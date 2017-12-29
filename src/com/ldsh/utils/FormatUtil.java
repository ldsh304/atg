package com.ldsh.utils;

import java.io.UnsupportedEncodingException;

public class FormatUtil {

	/**
	 * tomcat 的默认编码
	 */
	public static final String TOMCATWEBENCODING = "ISO-8859-1";
	/**
	 * 将web接受到的字符串
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
