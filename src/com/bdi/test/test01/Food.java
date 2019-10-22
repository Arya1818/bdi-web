package com.bdi.test.test01;

import java.util.ArrayList;
import java.util.List;

public class Food {
	private String name;
	private int price;
	private String etc;
	
	public Food(String namd, int price, String etc) {
		super(); //빼도됨
		this.name = name;
		this.price = price;
		this.etc = etc;
	}
	@override
	public String toString() {
		return "Food [name=" + name + ", price=" + price +", etc=" + etc +"]";
	}
	public static void addMenu(List<Food> menu, String name, int price, String etc) {
		Food f = new Food();
		menu.add(f);
	}
	
	public static void main(String[] args) {
		List<Food> menus = new ArrayList<Food()>;
		Food.addMenu(menus,"치킨",20000,"jmt");
		
		
	}
}


//메서드로 만들어서 Food.addMenu(menus,"치킨",20000,"jmt"); 추가해보기
//다른 클래스에서도 사용가능