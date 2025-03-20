package pack.board;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BoardManager {
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;
    private DataSource ds;

    private int recTot;     // 전체 레코드 수
    private int pageList = 10;   // 페이지 당 출력 레코드 수
    private int pageTot;    // 전체 페이지 수

    public BoardManager() {
        try {
            Context context = new InitialContext();
            ds = (DataSource)context.lookup("java:comp/env/jdbc_maria");
        } catch (Exception e) {
            System.out.println("Driver 로딩 실패 : " + e.getMessage());
        }
    }

    public void totalList() {
        String sql = "select count(*) from board";
        try (
            Connection conn = ds.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery()
        ){
            rs.next();
            recTot = rs.getInt(1);
            System.out.println("전체 레코드 수 : " + recTot);
        } catch (Exception e) {
            System.out.println("totalList err : " + e);
        }
    }

    public int getPageSu(){ // 총 페이지 수 반환
        pageTot = recTot / pageList;
        if(recTot % pageList > 0) pageTot++;
        System.out.println("전체 페이지 수 : " + recTot);
        return pageTot;
    }
//    public ArrayList<BoardDto> getDataAll(int page){ // 검색이 없는 경우
    public ArrayList<BoardDto> getDataAll(int page, String searchType, String searchWord){ // CRUD중 Read => select
        ArrayList<BoardDto> list = new ArrayList<>();
//        String sql = "select * from board order by gnum desc, onum asc";
        String sql = "select * from board";

        try {
            conn = ds.getConnection();

            if(searchWord == null) { // 검색이 없는 경우
                sql += " order by gnum desc, onum asc";
                pstmt = conn.prepareStatement(sql);
            } else { // 검색이 있는 경우
                sql += " where " + searchType + " like ?";
                sql += " order by gnum desc, onum asc";
                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, "%" + searchWord + "%");
            }

            rs = pstmt.executeQuery();
            
            for(int i = 0; i < (page - 1) * pageList; i++){
                rs.next(); // 레코드 포인터 이동
            }

            int k = 0;
            while(rs.next() && k < pageList){
                BoardDto dto = new BoardDto();
                dto.setNum(rs.getInt("num"));
                dto.setName(rs.getString("name"));
                dto.setTitle(rs.getString("title"));
                dto.setBdate(rs.getString("bdate"));
                dto.setReadcnt(rs.getInt("readcnt"));
                dto.setNested(rs.getInt("nested"));
                list.add(dto);
                k++;
            }
        } catch (Exception e) {
            System.out.println("getDataAll err : " + e.getMessage());
        } finally {
            try {
                if(rs != null) rs.close();
                if(pstmt != null) pstmt.close();
                if(conn != null) conn.close();
            } catch (Exception e2) {
                System.out.println("close err : " + e2.getMessage());
            }
        }
        return list;
    }

    // insert를 위해 num 최대 번호 구하기
    public int currentMaxNum() {
        String sql = "select max(num) from board";
        int num = 0;

        try (
            Connection conn = ds.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery()
        ){
            if(rs.next()) num = rs.getInt(1);
        } catch (Exception e) {
            System.out.println("currentMaxNum err : " + e.getMessage());
        }

        return num;
    }

    public void saveData(BoardBean bean) {
        String sql = "insert into board values(?,?,?,?,?,?,?,?,?,?,?,?)";

        try (
            Connection conn = ds.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);
        ){
            pstmt.setInt(1, bean.getNum());
            pstmt.setString(2, bean.getName());
            pstmt.setString(3, bean.getPass());
            pstmt.setString(4, bean.getMail());
            pstmt.setString(5, bean.getTitle());
            pstmt.setString(6, bean.getCont());
            pstmt.setString(7, bean.getBip());
            pstmt.setString(8, bean.getBdate());
            pstmt.setInt(9, 0);
            pstmt.setInt(10, bean.getGnum());
            pstmt.setInt(11, 0);
            pstmt.setInt(12, 0);

            pstmt.executeUpdate();
        } catch (Exception e) {
            System.out.println("saveData err : " + e.getMessage());
        }
    }
}
