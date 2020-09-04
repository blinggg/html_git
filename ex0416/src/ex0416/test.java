package ex0416;

import java.util.ArrayList;

public class test {

	public static void main(String[] args)throws Exception {
		// 목록출력 테스트하기
		ProductDAO dao=new ProductDAO();
		ArrayList<ProductVO> list=dao.list();

		for(int i=0; i<list.size(); i++) {
			ProductVO vo=list.get(i);
			System.out.println(vo.getPno()+vo.getPname()+vo.getPrice());
		}
	}

}
