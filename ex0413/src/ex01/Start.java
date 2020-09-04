package ex01;

import java.util.ArrayList;

public class Start {

	public static void main(String[] args) throws Exception{
		BBSDAO dao=new BBSDAO();
	/*	ArrayList<BBSVO> array= dao.list();
		
		for(int i=0; i<array.size(); i++) {
			BBSVO vo=array.get(i);
			System.out.println(vo.getBno()+vo.getTitle()+vo.getWdate());
		}*/
		
	//데이터입력
		/* BBSVO vo=new BBSVO();
		 vo.setTitle("새로운 제목을 입력합니다.");
		 vo.setContent("새로운 내용을 입력합니다.");
		 dao.insert(vo);
		 System.out.println("입력되었습니다.");*/
		
	
	//데이터 읽기
		/*BBSVO vo=dao.read(8);
		System.out.println("번호:"+vo.getBno());
		System.out.println("제목:"+vo.getTitle());
		System.out.println("내용:"+vo.getContent());
		System.out.println("날짜:"+vo.getWdate());*/
		
		
	//데이터 삭제
		/*dao.delete(1);
		System.out.println("삭제되었습니다.");*/
		
	//데이터 수정
		BBSVO vo=new BBSVO();
		vo.setBno(10);
		vo.setTitle("수정한제목입니다.");
		vo.setContent("수정한 내용입니다.");
		dao.update(vo);
		System.out.println("수정되었습니다.");
		
		
	}

}
