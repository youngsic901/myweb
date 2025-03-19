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
    private int pageList;   // 페이지 당 출력 레코드 수
    private int pageTot;    // 전체 페이지 수

    public BoardManager() {
        try {
            Context context = new InitialContext();
            ds = (DataSource)context.lookup("java:comp/env/jdbc_maria");
        } catch (Exception e) {
            System.out.println("Driver 로딩 실패 : " + e.getMessage());
        }
    }

    public ArrayList<BoardDto> getDataAll(int page){
        ArrayList<BoardDto> list = new ArrayList<>();

        return list;
    }
}
