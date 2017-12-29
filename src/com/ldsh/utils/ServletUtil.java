package com.ldsh.utils;

import java.io.UnsupportedEncodingException;

public class ServletUtil {

	/**
	 * 把字符串str转成encoding编码格式
	 * eg: stringChangeTo(response.getCharacterEncoding(), "你好");
	 */
	private static String stringChangeTo(String str,String encoding){
		try {
			return new String(str.getBytes("iso-8859-1"), encoding);
		} catch (UnsupportedEncodingException e) {
			System.out.println(e.getMessage()+"字符串转换失败！");
			e.printStackTrace();
		}
		return null;
	}
}
