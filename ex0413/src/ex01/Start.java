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
		
	//�������Է�
		/* BBSVO vo=new BBSVO();
		 vo.setTitle("���ο� ������ �Է��մϴ�.");
		 vo.setContent("���ο� ������ �Է��մϴ�.");
		 dao.insert(vo);
		 System.out.println("�ԷµǾ����ϴ�.");*/
		
	
	//������ �б�
		/*BBSVO vo=dao.read(8);
		System.out.println("��ȣ:"+vo.getBno());
		System.out.println("����:"+vo.getTitle());
		System.out.println("����:"+vo.getContent());
		System.out.println("��¥:"+vo.getWdate());*/
		
		
	//������ ����
		/*dao.delete(1);
		System.out.println("�����Ǿ����ϴ�.");*/
		
	//������ ����
		BBSVO vo=new BBSVO();
		vo.setBno(10);
		vo.setTitle("�����������Դϴ�.");
		vo.setContent("������ �����Դϴ�.");
		dao.update(vo);
		System.out.println("�����Ǿ����ϴ�.");
		
		
	}

}
