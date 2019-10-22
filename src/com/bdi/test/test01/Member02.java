package com.bdi.test.test01;


public class Member02 {
	int a;
	public String test(int a) {
		return "abc";
	}

	public static void changeMember(Member02 member) {
		member = new Member02();
		member.a = 10;
		
	}
	public static void main(String[] args) {
		Member02 m = new Member02();
		System.out.println(m.a);
		changeMember(m);
		m = new Member02();
		System.out.println(m.a);
	}
}
