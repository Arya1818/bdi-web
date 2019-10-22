package com.bdi.test.test01;

class Father{
	static int a = 3;
	int b = 10;
	Father(){
		System.out.println(1);
	}
}

public class MethodTest3 extends Father{
	static int a = 4;
	MethodTest3(){
		System.out.println(3);
	}
	public static void main(String[] args) {
		System.out.println(a);//4
		System.out.println(Father.a); //3
		Father m = new MethodTest3(); //1,3
		System.out.println(m.b); //10
	}
}
