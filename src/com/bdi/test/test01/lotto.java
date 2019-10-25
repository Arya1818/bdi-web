package com.bdi.test.test01;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class lotto {
	public static void main (String[] args) {
		List<Integer> lottoList = new ArrayList<Integer>();
		Random r = new Random();
	
//		while(lottoList.size()<7) {
//			int num = r.nextInt(6)+1;
//			if(lottoList.indexOf(num)==-1) {
		
//			}else {
//			}
//		}
//		
		for(int i=0; i<6; i++) {
			int num = r.nextInt(6) + 1;
			if(lottoList.indexOf(num)==-1) {
				lottoList.add(num);
			}else {
				i--;
			}
		}
		System.out.println(lottoList);
	}
}

//-1일땐 add
//-1아닐땐 다시 for문 돌리기
//lottoList.add(r.nextInt(45) + 1);