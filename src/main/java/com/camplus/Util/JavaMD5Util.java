package com.camplus.Util;

import java.security.MessageDigest;

/**
 * Created by mark on 8/2/15.
 */
public class JavaMD5Util {
    /**
     * MD5加密
     * @param password
     * @return
     */
    public static String MD5(String password){
        MessageDigest md5 = null;
        try{
            md5 = MessageDigest.getInstance("MD5");
        }catch (Exception e){
            System.out.println(e.toString());
            e.printStackTrace();
            return "";
        }
        char[] charArray = password.toCharArray();
        byte[] byteArray = new byte[charArray.length];

        for (int i = 0; i < charArray.length; i++)
            byteArray[i] = (byte) charArray[i];
        byte[] md5Bytes = md5.digest(byteArray);
        StringBuffer result = new StringBuffer();
        for (int i = 0; i < md5Bytes.length; i++){
            int val = ((int) md5Bytes[i]) & 0xff;
            if (val < 16)
                result.append("0");
            result.append(Integer.toHexString(val));
        }
        return result.toString();
    }

    public static void main(String[] args) {
        System.out.println(JavaMD5Util.MD5("abc"));
    }
}
