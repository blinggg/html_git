package ex0420;

import java.util.Scanner;

public class Practice {

	public static void main(String[] args) {
		Scanner s=new Scanner(System.in);
		
		
		int result=0;
		
		for(int i=0; i<5; i++) {
			int input=s.nextInt();
			
			if(input<40) { 
				result +=40;}
			else {
			result +=input;}
		
	}
		System.out.println("´Ù¼¸¸íÀÇ Æò±ÕÀº:"+result/5);
	}
}
