package com.bdi.test.test01;

public class Member01 {
	int a; //접근제어자 안썼을때 default가 됨 
//	default int a;	//클래스에서 쓸순 없고 인터페이스에서 사용가능 
	
	public static String test() {
		String str = "abc";
		String str1 ="bbc";
		return str;
	}
	
	public static void main(String[] args) {
//		final String str = test(); //접근제어자 
		String str = test(); //원래는  Member01.test() 해아하는데 static이니 가능. 
		Member01 m = new Member01();
		m.a = 10; //
		System.out.println(m.a);
	}
}

//클래스 안에있으며 다른 영역에 포함되지 않는 곳에 선언되어있는것만 접근제어자,static 선언할수있음
//클래스 안에 안에 (메소드)에 선언되어있는건 xx

//사용자정의 데이터타입