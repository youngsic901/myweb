package pack.board;

import lombok.Getter;
import lombok.Setter;

import java.time.LocalDate;

@Getter
@Setter
public class
BoardBean {
    private String name, pass, mail, title, cont, bip, bdate;
    private int num, readcnt, gnum, onum, nested; // gnum, onum, nested 는 원글, 댓글 기능을 구현하기 위해 사용

    public void setBdate(){ // 오버로딩 => 기존의 setter에서 파라미터를 받지 않음
        // test push
        LocalDate now = LocalDate.now();
        int year = now.getYear();
        int month = now.getMonthValue();
        int day = now.getDayOfMonth();
        this.bdate = year + "-" + month + "-" + day;
    }
}
