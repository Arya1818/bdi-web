<%@page import="java.util.Iterator"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

Map<String,String[]> paramMap = request.getParameterMap(); 
Iterator<String> it = paramMap.keySet().iterator();

while(it.hasNext()){
	String key = it.next();
	String[] values = paramMap.get(key);
	out.print("key [" + key + "]:");
	for(int i=0; i<values.length; i++){
		out.print(values[i]+","); 
	}
	out.println();
}

%>

<!-- is이거맞아? hasnext:next에 가져올거있어?

순서가 정확하지 않을 때 키값을 싹 다 가져오고 싶을 때  -->