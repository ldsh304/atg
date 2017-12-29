package com.ldsh.utils;

import java.io.UnsupportedEncodingException;

public class FormatUtil {

	/**
	 * tomcat ��Ĭ�ϱ���
	 */
	public static final String TOMCATWEBENCODING = "ISO-8859-1";
	/**
	 * ��web���ܵ����ַ���
	 * @param str
	 * @param encoding
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	public static String changeEncoding(String str, String encoding)
			throws UnsupportedEncodingException {
		return new String(str.getBytes(TOMCATWEBENCODING),encoding);
	}
}
