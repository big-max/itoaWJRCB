package com.ibm.automation.core.util;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

import org.apache.commons.codec.binary.Base64;

import sun.misc.BASE64Encoder;

/**
 * java 加密 nodejs 解密
 * 
 * @author hujin
 * 
 * 
 */
public class SecurityUtil {
	/**
	 * @param input
	 *            输入数据
	 * @param key
	 *            加密秘钥 必须16位
	 */
	public static String encrypt(String input, String key) {
		byte[] crypted = null;
		try {
			SecretKeySpec skey = new SecretKeySpec(key.getBytes(), "AES");
			Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
			cipher.init(Cipher.ENCRYPT_MODE, skey);
			crypted = cipher.doFinal(input.getBytes());
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return new String(Base64.encodeBase64(crypted));
	}

	public static String decrypt(String input, String key) {
		byte[] output = null;
		try {
			SecretKeySpec skey = new SecretKeySpec(key.getBytes(), "AES");
			Cipher cipher = Cipher.getInstance("AES/ECB/PKCS5Padding");
			cipher.init(Cipher.DECRYPT_MODE, skey);
			output = cipher.doFinal(Base64.decodeBase64(input));
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return new String(output);
	}

	public static String EncoderByMd5(String str) throws NoSuchAlgorithmException, UnsupportedEncodingException {
		MessageDigest md5 = MessageDigest.getInstance("MD5");
		BASE64Encoder base64en = new BASE64Encoder();
		String newstr = base64en.encode(md5.digest(str.getBytes("utf-8")));
		return newstr;
	}

	public static void main(String[] args) throws NoSuchAlgorithmException, UnsupportedEncodingException {
		/*String key = "1234567890abcdfg"; // 必须16位
		String data = "password";
		// System.out.println(SecurityUtil.decrypt(SecurityUtil.encrypt(data,
		// key), key));
		// byte[] passByte =
		// Base64.decodeBase64(request.getParameter("password"));
		byte[] b = Base64.encodeBase64(data.getBytes());
		String s = new String(b);
		System.out.println(s);
		byte[] c = Base64.decodeBase64(s);
		System.out.println(new String(c));
		byte[] d = Base64.decodeBase64(c);
		System.out.println(SecurityUtil.encrypt(new String(d), key));*/
		String s= EncoderByMd5("password");
		System.out.println(s);
	}

}
