package ex0904;

public class Car {
	int speed;
	int distance;
	String color;
	
	public Car() {
		
	}
	
	//����
	public void speedUp() {
		speed=speed+5;
	}
	
	//����
	public void breakDown() {
		speed=speed-10;
	}
	
	//����ӵ�
	public int getCurrentSpeed() {
		return speed;
	}
	
	public void checkChar() {
		char charMin='\u0000';
		char charMax='\uffff';
		System.out.println("charMin=["+charMin+"]");
		System.out.println("charMin=["+charMax+"]");
		
		int intValue='a';
		System.out.println("intValue=["+intValue+"]");
	}
}