package com.bdi.test.test01; //static과 생성자 구분할줄 알아야함. 

class Mother {
	static int a = 3; // 이렇게 쓸거면 생성자로 씀
	static {
		System.out.println(123);
	}

	Mother() {
		System.out.println(1);

	}
}

public class MethodTest2 extends Mother {
	MethodTest2() {
		System.out.println(3);
	}

	public static void main(String[] args) {
		System.out.println(Mother.a); //123, 3
		MethodTest2 m = new MethodTest2(); //1, 3
	}
}
