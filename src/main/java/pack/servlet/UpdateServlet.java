package pack.servlet;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.UUID;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import pack.product.ProductDto;
import pack.product.ProductManager;

@WebServlet("/product/update")
@MultipartConfig(
	fileSizeThreshold = 1024*1024*5, // 메모리 임계값
	maxFileSize = 1024*1024*50,      //최대 파일 사이즈
	maxRequestSize = 1024*1024*60    //최대 요청 사이즈
)

public class UpdateServlet extends HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//업로드될 실제 경로 얻어내기
		//String uploadPath=this.getServletContext().getRealPath("/upload");  // tomcat 기본 경로로 설치한 경우 
		String uploadPath = "C:/work/intellij_web/myweb/src/main/webapp/upload";
		System.out.println("uploadPath: " + uploadPath);
		
		File uploadDir = new File(uploadPath);
		//만일 upload 폴더가 존재 하지 않으면 
		if(!uploadDir.exists()) {
			uploadDir.mkdir(); //실제로 폴더 만들기
		}
		
		// input type="text"에 입력한 문자열 얻어내기 
		String no = req.getParameter("no");
		String name = req.getParameter("name");
		String price = req.getParameter("price");
		String detail = req.getParameter("detail");
		String stock = req.getParameter("stock");
		String currentImage = req.getParameter("currentImage"); // 기존 이미지명
		
		String uid = UUID.randomUUID().toString();
		String orgFileName=null;
		String saveFileName=null;
		
		// 이미지 파일 데이터 처리
		Part filePart = req.getPart("image");
		
		if(filePart != null && filePart.getSize() > 0) {
			orgFileName=filePart.getSubmittedFileName();
			saveFileName=uid+orgFileName;
			String filePath=uploadPath + File.separator + saveFileName;

			try (InputStream is = filePart.getInputStream()) {
                Files.copy(is, Paths.get(filePath));
            }

            // 기존 이미지 파일 삭제
            if (currentImage != null && !currentImage.isEmpty()) {
                File oldFile = new File(uploadPath + File.separator + currentImage);
                if (oldFile.exists()) oldFile.delete();
            }
		} else {
			// 새 이미지 업로드 안 했으면 기존 이미지 유지
            saveFileName = currentImage;
		}
		
		System.out.println(saveFileName);

		// DB에 저장
		ProductDto dto = new ProductDto();
		dto.setNo(Integer.parseInt(no));  // 수정 대상 ID
		dto.setName(name);
		dto.setPrice(price);
		dto.setDetail(detail);
		dto.setStock(stock);
		dto.setImage(saveFileName); // null도 허용됨

		// DB 저장
		ProductManager manager = new ProductManager();
		boolean success = manager.updateProduct(dto);

		if(success){
		    System.out.println("수정 성공");
		} else {
		    System.out.println("수정 실패");
		}

		resp.sendRedirect("/myshop/admin/productmanager.jsp");
	}
}


















