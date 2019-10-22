package com.bdi.test.test01;

import java.util.HashMap;
import java.util.Map;

public class Member {
	
	public static void neker(Map<String,String> map) { //3.내가만든메서드 neker()안에 Map<String,String> map을 넣어주고 똑같이 neker(map)을 넣어주면됨
		map.put("a","b");
	}
	
	public static void test(Map<String,String> map) { 	//1.강제할수있음! 
		map.put("a","b");
		
	
	}
	
	public static void main(String[] args) {
		Map<String,String> map = new HashMap<String,String>();
		test(map); //2.
		neker(map);
	}
}

//내가 누군가에게 받은 맵을 다른 메서드에서 사용하고 싶을때!
//선언부에 있는 메서든 사용할수없다.
//선언부는 내가 만드는거잖아. 거기에서 다른 메서드는 사용할 수 없음. 

//<%!에서 만든 메서드는 <%같은클래스에 있어도 다른 메서드 영역이라 사용할수 없다. 
//쓰려면 아예 클래스로 빼라 --->굳이 선언부를 쓸 이유가 없다. 
// 