package ex0904;

public class PrimitiveTypesSecond {
	//인스턴스 변수 생성
	int intDefault;
	byte byteDefault;
	char charDefault;
	long longDefault;
	float floatDefault;
	double doubleDefault;
	short shortDefault;
	boolean booleanDefault;
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		PrimitiveTypesSecond second=new PrimitiveTypesSecond();
		second.defaultValues();
	}
	
	public void defaultValues() {
		System.out.println("intDefault="+intDefault);
		System.out.println("byte="+byteDefault);
		System.out.println("char="+charDefault);
		System.out.println("long="+longDefault);
		System.out.println("float="+floatDefault);
		System.out.println("double="+doubleDefault);
		System.out.println("short="+shortDefault);
		System.out.println("boolean="+booleanDefault);
		
	}

}
