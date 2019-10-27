package com.bdi.test.test01;

class Mother2{
	int a = 3; 
	Mother2(){
		System.out.println("엄마1");

	}
	Mother2(int a){
		System.out.println("엄마2");
	}
	void test(int a, int b){
		int sum = a + b;
		System.out.println(sum);
	}

}

public class MethodTest extends Mother2{
	int a = 123;

	MethodTest(int a){
	//	super();
		super(2);
		System.out.println("난실행되겠지");
	}
	
	public static void main(String[] args) {
		Mother2 mt = new MethodTest(1); //하면? 뭐가나올까? 엄마1,난실행되겠지
		mt.test(2, 3);
		System.out.println(mt.a); //상속과 상관 없음 mt의 데이터타입따라감
		
	}
}

//오버로딩- 같은메서드명->이 일을하겠구나! 같은영역(상속까지포함)->
//메서드가 오버라이딩되는거ㅏㄹㅇ
//오버라이딩-상위클래스보다 작으면 안됨
//변수의 오버라이딩 ?x 변수는 각각의것. 변수는 데이터타입을 따라감. 
//MethodTest mt = new MethodTest(); System.out.println(mt.a); 하면 mt의 데이터타입이 MethodTest라서 123이 나옴
//Mother mt = new MethodTest(); System.out.println(mt.a); 하면 mt의 데이터타입이 Mother라서 3이 나옴


//생성자
//super.test(); 오류안나는 이유는 이미 상위클래스의 test를 알고있다는 뜻.
//내가 생성자를 한번 강제하면 MethodTest(int a) , 자바는 기본 생성자를 만들어주지않음.
//

