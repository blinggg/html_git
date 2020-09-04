package ex0422;

import java.util.ArrayList;

public class test {

	public static void main(String[] args)throws Exception {
		// TODO Auto-generated method stub
		
		MovieDAO dao=new MovieDAO();
		ArrayList<MovieVO> list=dao.list();
		
		for(int i=0; i<list.size(); i++){
			MovieVO vo=list.get(i);
			System.out.println(vo.getMno()+vo.getTitle()+vo.getActor());
	}

	}
}
