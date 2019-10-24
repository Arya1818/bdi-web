package com.bdi.test.test01;

public class SplitTest {
	
	public static void main(String[] args) {
		
		String hobby = "movie,game,study";
		String[] hobbies = hobby.split(",");
		
		String hob1 = "movie"; 
//		System.out.println(hobby.indexOf(hob1)); //m의 시작이 0번째이니 0나옴
		System.out.println(hobbies.length);
		System.out.println(hobbies[0]);
		System.out.println(hobbies[1]);
//		for(int i=0; i<hobbies.length; i++) {
//			System.out.println(hobbies[i]);
		for(String str:hobbies) { //몇번째 방에 뭐가 있는게 궁금할땐 위처럼 하지만 각방에있는걸 다 보고싶을땐 이렇게 써도 무방. (arraylist할때도 자주씀)
			if(str.equals(hob1)) {
				System.out.println("checked");
				break;
			}
//			System.out.println(str);
		}
	}
}

//indexOf 로 비교해도 되지만 같은게 많이 나올 수 있음
//.split으로 자르고 하나씩 비교


