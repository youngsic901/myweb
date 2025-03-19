package pack.board;

import lombok.Getter;
import lombok.Setter;

import java.time.LocalDate;

@Getter
@Setter
public class BoardBean {
    private String name, pass, mail, title, cont, bip, bdate;
    private int num, readcnt, gnum, onum, nested;

    public void setBdate(){ // 오버로딩
        // test push
        LocalDate now = LocalDate.now();
        int year = now.getYear();
        int month = now.getMonthValue();
        int day = now.getDayOfMonth();
        this.bdate = year + "-" + month + "-" + day;
    }
}
