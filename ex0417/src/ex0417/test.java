package ex0417;

import java.util.ArrayList;

public class test {

	public static void main(String[] args)throws Exception{
		//�۵� �ߵǴ��� �׽�Ʈ �غ���
		
		GradeDAO dao=new GradeDAO();
		GradeVO vo=new GradeVO();
		//����Ʈ ��¸޼ҵ� Ȯ��
		/*ArrayList<GradeVO> list=dao.list();
		
		
		 for(int i=0; i<list.size(); i++) {
			 GradeVO vo=list.get(i);
			 System.out.println(vo.getGno()+vo.getGname()+vo.getKor()+vo.getEng()+vo.getMat());
		 }*/
		 
		 
		//insert �޼ҵ� Ȯ��
		/* GradeVO vo=new GradeVO();
		 vo.setGname("������");
		 vo.setKor(85);
		 vo.setEng(95);
		 vo.setMat(70);
		 
		 dao.insert(vo); //�������� ����. �׷��� �Է��� �Ǿ���?
		System.out.println("�ԷµǾ����ϴ�.");
		System.out.println(vo.getGno()+vo.getGname()+vo.getKor()+vo.getEng()+vo.getMat());*/
		 
		//delete �޼ҵ� Ȯ��
		/*dao.delete(6);
		System.out.println("�����Ǿ����ϴ�.");*/
		
		//update �޼ҵ� Ȯ��
		 vo.setGno(3);
		 vo.setKor(80);
		 vo.setEng(90);
		 vo.setMat(100);
		 dao.update(vo);
		}

	}
