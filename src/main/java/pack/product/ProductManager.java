package pack.product;

import jakarta.servlet.http.HttpServletRequest;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ProductManager {
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;
    private DataSource ds;

    public ProductManager(){
        try {
            Context context = new InitialContext();
            ds = (DataSource)context.lookup("java:comp/env/jdbc_maria");
        } catch (Exception e) {
            System.out.println("Product Manager Driver 로딩 실패 : " + e.getMessage());
        }
    }

    public ArrayList<ProductDto> getProductAll(){
        ArrayList<ProductDto> list = new ArrayList<>();

        try {
            conn = ds.getConnection();
            String sql = "select * from shop_product order by no desc";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while(rs.next()){
                ProductDto dto = new ProductDto();
                dto.setNo(rs.getInt("no"));
                dto.setName(rs.getString("name"));
                dto.setPrice(rs.getString("price"));
                dto.setDetail(rs.getString("detail"));
                dto.setSdate(rs.getString("sdate"));
                dto.setStock(rs.getString("stock"));
                dto.setImage(rs.getString("image"));
                list.add(dto);
            }
        } catch (Exception e) {
            System.out.println("getProductAll err : " + e);
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

    public boolean insertProduct(ProductDto dto){
        boolean b = false;

        try {
            conn = ds.getConnection();
            String sql = "insert into shop_product(name, price, detail, stock, image, sdate) values(?,?,?,?,?,now())";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, dto.getName());
            pstmt.setString(2, dto.getPrice());
            pstmt.setString(3, dto.getDetail());
            pstmt.setString(4, dto.getStock());
            pstmt.setString(5, dto.getImage() != null ? dto.getImage() : ""); // image가 null이면 빈 문자열로 저장

            int result = pstmt.executeUpdate();
            if(result > 0) b = true;
        } catch (Exception e) {
            System.out.println("insertProduct err : " + e);
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

    public ProductDto getProduct(String no){
        ProductDto dto = null;

        try{
            conn = ds.getConnection();
            String sql = "select * from shop_product where no = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, no);
            rs = pstmt.executeQuery();
            if(rs.next()){
                dto = new ProductDto();
                dto.setNo(rs.getInt("no"));
                dto.setName(rs.getString("name"));
                dto.setPrice(rs.getString("price"));
                dto.setDetail(rs.getString("detail"));
                dto.setSdate(rs.getString("sdate"));
                dto.setStock(rs.getString("stock"));
                dto.setImage(rs.getString("image"));
            }
        } catch (Exception e) {
            System.out.println("getProduct err : " + e);
        } finally {
            try {
                if(rs != null) rs.close();
                if(pstmt != null) pstmt.close();
                if(conn != null) conn.close();
            } catch (Exception e2) {
                System.out.println("closing err : " + e2);
            }
        }
        return dto;
    }
}
