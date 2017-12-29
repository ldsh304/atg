package com.ldsh.utils;

import java.io.UnsupportedEncodingException;

public class ServletUtil {

	/**
	 * ���ַ���strת��encoding�����ʽ
	 * eg: stringChangeTo(response.getCharacterEncoding(), "���");
	 */
	private static String stringChangeTo(String str,String encoding){
		try {
			return new String(str.getBytes("iso-8859-1"), encoding);
		} catch (UnsupportedEncodingException e) {
			System.out.println(e.getMessage()+"�ַ���ת��ʧ�ܣ�");
			e.printStackTrace();
		}
		return null;
	}
}
