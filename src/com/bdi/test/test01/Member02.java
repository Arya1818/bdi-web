package com.bdi.test.test01;


public class Member02 {
	int a;
	public String test(int a) {
		return "abc";
	}

	public static void changeMember(Member02 member) {
//		System.out.println(member.a);
		member = new Member02();
		member.a = 10;
//		System.out.println(member.a);
		
	}
	public static void main(String[] args) {
		Member02 m = new Member02();
//		System.out.println(m.a); //0
		changeMember(m);

		m = new Member02();
		m.a=20;
		System.out.println(m.a);
	}
}
