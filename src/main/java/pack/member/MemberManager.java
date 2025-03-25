package pack.member;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class MemberManager {
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;
    private DataSource ds;
    
    public MemberManager(){
        try {
            Context context = new InitialContext();
            ds = (DataSource)context.lookup("java:comp/env/jdbc_maria");
        } catch (Exception e) {
            System.out.println("Driver 로딩 실패 : " + e.getMessage());
        }
    }

    // 동이름으로 우편자료 검색
    public ArrayList<ZipcodeDto> zipcodeRead(String dongName){
        ArrayList<ZipcodeDto> list = new ArrayList<>();

        try {
            conn = ds.getConnection();
            String sql = "select * from ziptab where area3 like ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, dongName + "%");
            rs = pstmt.executeQuery();

            while(rs.next()){
                ZipcodeDto zipcodeDto = new ZipcodeDto();
                zipcodeDto.setZipcode(rs.getString("zipcode")); // 가독성을 위해 숫자보다는 컬럼으로 작성하는 것이 좋다.
                zipcodeDto.setArea1(rs.getString("area1"));
                zipcodeDto.setArea2(rs.getString("area2"));
                zipcodeDto.setArea3(rs.getString("area3"));
                zipcodeDto.setArea4(rs.getString("area4"));
                list.add(zipcodeDto);
            }
        } catch (Exception e) {
            System.out.println("zipcodeRead err : " + e);
        } finally {
            try {
                if(rs != null) rs.close();
                if(pstmt != null) pstmt.close();
                if(conn != null) conn.close();
            } catch (Exception e2) {
                System.out.println("closing err : " + e2);
            }
        }
        return list;
    }

    public boolean idCheckProcess(String id){
        boolean b = false;

        try {
            conn = ds.getConnection();
            String sql = "select id from member where id = ?";
            // String sql = "select count(*) from member where id = ?"; // 이것도 가능
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();

            b = rs.next();
        } catch (Exception e) {
            System.out.println("idCheckProcess err : " + e);
        } finally {
            try {
                if(rs != null) rs.close();
                if(pstmt != null) pstmt.close();
                if(conn != null) conn.close();
            } catch (Exception e2) {
                System.out.println("closing err : " + e2);
            }
        }
        return b;
    }

    public boolean memberInsert(MemberBean mbean){
        boolean b = false;

        try{
            conn = ds.getConnection();
            String sql = "insert into member values(?,?,?,?,?,?,?,?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, mbean.getId());
            pstmt.setString(2, mbean.getPasswd());
            pstmt.setString(3, mbean.getName());
            pstmt.setString(4, mbean.getEmail());
            pstmt.setString(5, mbean.getPhone());
            pstmt.setString(6, mbean.getZipcode());
            pstmt.setString(7, mbean.getAddress());
            pstmt.setString(8, mbean.getJob());
            if(pstmt.executeUpdate() > 0) b = true;
        } catch (Exception e) {
            System.out.println("memberInsert err : " + e);
        } finally {
            try {
                if(rs != null) rs.close();
                if(pstmt != null) pstmt.close();
                if(conn != null) conn.close();
            } catch (Exception e2) {
                System.out.println("closing err : " + e2);
            }
        }
        return b;
    }

    public boolean loginCheck(String id, String passwd){
        boolean b = false;

        try {
            conn = ds.getConnection();
            String sql = "select * from member where id = ? and passwd = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.setString(2, passwd);

            rs = pstmt.executeQuery();
            b = rs.next();
        } catch (Exception e) {
            System.out.println("loginCheck err : " + e);
        } finally {
            try {
                if(rs != null) rs.close();
                if(pstmt != null) pstmt.close();
                if(conn != null) conn.close();
            } catch (Exception e2) {
                System.out.println("closing err : " + e2);
            }
        }

        return b;
    }

    public MemberDto getMember(String id){
        MemberDto memberDto = null;
        try{
            conn = ds.getConnection();
            String sql = "select * from member where id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            if(rs.next()){
                memberDto = new MemberDto();
                memberDto.setId(rs.getString("id"));
                memberDto.setPasswd(rs.getString("passwd"));
                memberDto.setName(rs.getString("name"));
                memberDto.setEmail(rs.getString("email"));
                memberDto.setPhone(rs.getString("phone"));
                memberDto.setZipcode(rs.getString("zipcode"));
                memberDto.setAddress(rs.getString("address"));
                memberDto.setJob(rs.getString("job"));
            }
        } catch (Exception e) {
            System.out.println("getMember err : " + e);
        }finally {
            try{
                if(rs != null) rs.close();
                if(pstmt != null) pstmt.close();
                if(conn != null) conn.close();
            } catch (Exception e2) {
                System.out.println("closing err : " + e2);
            }
        }
        return memberDto;
    }

    public boolean memberUpdate(MemberBean bean, String id){
        boolean b = false;
        String sql = "update member set passwd = ? , name = ? , email = ? , phone = ? , zipcode = ? , address = ? , job = ? where id = ?";
        try{
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, bean.getPasswd());
            pstmt.setString(2, bean.getName());
            pstmt.setString(3, bean.getEmail());
            pstmt.setString(4, bean.getPhone());
            pstmt.setString(5, bean.getZipcode());
            pstmt.setString(6, bean.getAddress());
            pstmt.setString(7, bean.getJob());
            pstmt.setString(8, id);
            if(pstmt.executeUpdate() > 0) b = true;
        } catch (Exception e) {
            System.out.println("memberUpdate err : " + e);
        } finally {
            try {
                if(rs != null) rs.close();
                if(pstmt != null) pstmt.close();
                if(conn != null) conn.close();
            } catch (Exception e2) {
                System.out.println("closing err : " + e2);
            }
        }

        return b;
    }

    public boolean adminLoginCheck(String id, String passwd){
        boolean b = false;
        try {
            conn = ds.getConnection();
            String sql = "select * from admin where admin_id = ? and admin_passwd = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            pstmt.setString(2, passwd);
            rs = pstmt.executeQuery();

            b = rs.next();
        } catch (Exception e) {
            System.out.println("adminLoginCheck err : " + e);
        } finally {
            try {
                if(rs != null) rs.close();
                if(pstmt != null) pstmt.close();
                if(conn != null) conn.close();
            } catch (Exception e2) {
                System.out.println("closing err : " + e2);
            }
        }
        return b;
    }

    // 관리자 : 전체 고객 읽기
    public ArrayList<MemberDto> getMemberAll() {
        ArrayList<MemberDto> list = new ArrayList<>();

        try {
            conn = ds.getConnection();
            String sql = "select * from member order by id asc";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while(rs.next()){
                MemberDto dto = new MemberDto();
                dto.setId(rs.getString("id"));
                dto.setName(rs.getString("name"));
                dto.setEmail(rs.getString("email"));
                dto.setPhone(rs.getString("phone"));
                list.add(dto);
            }
        } catch (Exception e) {
            System.out.println("getMemberAll err : " + e);
        } finally {
            try {
                if(rs != null) rs.close();
                if(pstmt != null) pstmt.close();
                if(conn != null) conn.close();
            } catch (Exception e2) {
                System.out.println("closing err : " + e2);
            }
        }

        return list;
    }
}
