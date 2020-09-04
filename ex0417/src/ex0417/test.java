package ex0417;

import java.util.ArrayList;

public class test {

	public static void main(String[] args)throws Exception{
		//작동 잘되는지 테스트 해보기
		
		GradeDAO dao=new GradeDAO();
		GradeVO vo=new GradeVO();
		//리스트 출력메소드 확인
		/*ArrayList<GradeVO> list=dao.list();
		
		
		 for(int i=0; i<list.size(); i++) {
			 GradeVO vo=list.get(i);
			 System.out.println(vo.getGno()+vo.getGname()+vo.getKor()+vo.getEng()+vo.getMat());
		 }*/
		 
		 
		//insert 메소드 확인
		/* GradeVO vo=new GradeVO();
		 vo.setGname("서영숙");
		 vo.setKor(85);
		 vo.setEng(95);
		 vo.setMat(70);
		 
		 dao.insert(vo); //누락하지 말자. 그런데 입력은 되었다?
		System.out.println("입력되었습니다.");
		System.out.println(vo.getGno()+vo.getGname()+vo.getKor()+vo.getEng()+vo.getMat());*/
		 
		//delete 메소드 확인
		/*dao.delete(6);
		System.out.println("삭제되었습니다.");*/
		
		//update 메소드 확인
		 vo.setGno(3);
		 vo.setKor(80);
		 vo.setEng(90);
		 vo.setMat(100);
		 dao.update(vo);
		}

	}
