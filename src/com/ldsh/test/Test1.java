package com.ldsh.test;

import java.util.ArrayList;
import java.util.List;

public class Test1 {

	public static void main(String[] args) {
		List list = null;
//		Object list = new ArrayList<String>();
		Object obj = (ArrayList<String>)list;
		System.out.println(obj);
	}

}
