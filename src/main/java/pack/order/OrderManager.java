package pack.order;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class OrderManager {
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;
    private DataSource ds;

    public OrderManager() {
        try {
            Context context = new InitialContext();
            ds = (DataSource)context.lookup("java:comp/env/jdbc_maria");
        } catch (Exception e) {
            System.out.println("OrderManager Driver 로딩 실패: " + e);
        }
    }
}
