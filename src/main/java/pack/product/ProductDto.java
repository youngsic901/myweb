package pack.product;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ProductDto {
    private int no;
    private String name, price, detail, sdate, stock, image;
}
