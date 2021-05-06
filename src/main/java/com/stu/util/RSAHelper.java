package com.stu.util;

import org.bouncycastle.crypto.util.PrivateKeyInfoFactory;

import javax.crypto.Cipher;
import java.security.*;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;
import java.util.Base64;

public class RSAHelper {

    private static PrivateKey PRIVATE_KEY;
    private static PublicKey PUBLIC_KEY;

    static{
        try {
            PRIVATE_KEY = getPrivateKey(PropertiesUtil.readProperty("rsa.private.key"));    //获取properties中配好的私钥
            PUBLIC_KEY = getPublicKey(PropertiesUtil.readProperty("rsa.public.key"));       //获取properties中配好的公钥
        } catch (Exception e) {
            PRIVATE_KEY=null;
        }
    }

    /**
     * 生成RSA密钥对(默认密钥长度为1024)
     *
     * @return
     */
    public static KeyPair generateRSAKeyPair() {
        return generateRSAKeyPair(1024);
    }

    /**
     * 生成RSA密钥对
     *
     * @param keyLength  密钥长度
     *
     * @return
     */
    public static KeyPair generateRSAKeyPair(int keyLength) {
        try {
            KeyPairGenerator kpg = KeyPairGenerator.getInstance("RSA");
            kpg.initialize(keyLength);
            return kpg.genKeyPair();
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }


    // 用公钥加密
    public static byte[] encryptData(byte[] data, PublicKey pubKey) {
        try {
            Cipher cipher = Cipher.getInstance("RSA/ECB/PKCS1Padding");
            cipher.init(Cipher.ENCRYPT_MODE, pubKey);
            return cipher.doFinal(data);
        } catch (Exception e) {
            return null;
        }
    }
    /**
     *
     * 用公钥加密
     * @param str     待加密字符串
     * @param enCode  字符串编码格式
     * @param pubKey  公钥
     * @return        加密后字符串
     */
    public static String encryptData(String str,String enCode, PublicKey pubKey) {
        try {
            byte[] data=str.getBytes(enCode);
            Cipher cipher = Cipher.getInstance("RSA/ECB/PKCS1Padding");
            cipher.init(Cipher.ENCRYPT_MODE, pubKey);
            return Base64.getEncoder().encodeToString(cipher.doFinal(data));
        } catch (Exception e) {
            return null;
        }
    }

    /**
     * 用已存的公钥加密
     * @param str 待加密字符串
     * @param enCode 字符串编码格式，常用“UTF-8”
     * @return
     */
    public static String encryptData(String str, String enCode) {
        return encryptData(str, enCode, PUBLIC_KEY);
    }

    // 用私钥解密
    public static byte[] decryptData(byte[] encryptedData, PrivateKey priKey) {
        try {
            Cipher cipher = Cipher.getInstance("RSA");
            cipher.init(Cipher.DECRYPT_MODE, priKey);
            return cipher.doFinal(encryptedData);
        } catch (Exception e) {
            return null;
        }
    }
    /**
     * 用私钥解密
     * @author suo
     * @param encryptedStr 待解密字符串
     * @param enCode       字符串编码格式
     * @param priKey       私钥
     * @return  解密后字符串
     */
    public static String decryptData(String encryptedStr,String enCode, PrivateKey priKey) {
        try {
            byte[] encryptedData=Base64.getDecoder().decode(encryptedStr);
            Cipher cipher = Cipher.getInstance("RSA");
            cipher.init(Cipher.DECRYPT_MODE, priKey);
            return new String(cipher.doFinal(encryptedData),enCode);
        } catch (Exception e) {
            throw  new RuntimeException(e);
        }
    }
    /**
     * 使用既有的私钥进行解密
     * @param encryptedStr
     * @param enCode
     * @return
     */
    public static String decryptData(String encryptedStr,String enCode) {
        return decryptData(encryptedStr, enCode, PRIVATE_KEY);
    }



    /**
     * 根据指定私钥对数据进行签名(默认签名算法为"SHA1withRSA")
     *
     * @param data 要签名的数据
     * @param priKey 私钥
     * @return
     */
    public static byte[] signData(byte[] data, PrivateKey priKey) {
        return signData(data, priKey, "SHA1withRSA");
    }

    /**
     * 根据指定私钥和算法对数据进行签名
     *
     * @param data 要签名的数据
     * @param priKey 私钥
     * @param algorithm 签名算法
     * @return
     */
    public static byte[] signData(byte[] data, PrivateKey priKey,
                                  String algorithm) {
        try {
            Signature signature = Signature.getInstance(algorithm);
            signature.initSign(priKey);
            signature.update(data);
            return signature.sign();
        } catch (Exception ex) {
            return null;
        }
    }

    /**
     * 用指定的公钥进行签名验证(默认签名算法为"SHA1withRSA")
     *
     * @param data 数据
     * @param sign 签名结果
     * @param pubKey 公钥
     * @return
     */
    public static boolean verifySign(byte[] data, byte[] sign, PublicKey pubKey) {
        return verifySign(data, sign, pubKey, "SHA1withRSA");
    }

    /**
     *
     * @param data  数据
     * @param sign 签名结果
     * @param pubKey 公钥
     * @param algorithm 签名算法
     * @return
     */
    public static boolean verifySign(byte[] data, byte[] sign,
                                     PublicKey pubKey, String algorithm) {
        try {
            Signature signature = Signature.getInstance(algorithm);
            signature.initVerify(pubKey);
            signature.update(data);
            return signature.verify(sign);
        } catch (Exception ex) {
            return false;
        }
    }
    /**
     * 从base64字符串获取公钥
     * @param key
     * @return
     * @throws Exception
     */
    public static PublicKey getPublicKey(String key) throws Exception {
        byte[] keyBytes;
        keyBytes = Base64.getDecoder().decode(key);
        X509EncodedKeySpec keySpec = new X509EncodedKeySpec(keyBytes);
        KeyFactory keyFactory = KeyFactory.getInstance("RSA");
        PublicKey publicKey = keyFactory.generatePublic(keySpec);
        return publicKey;
    }
    /**
     * 从base64字符串获取私钥
     * @param key
     * @return
     * @throws Exception
     */
    public static PrivateKey getPrivateKey(String key) throws Exception{
        byte[] keyBytes;
        keyBytes = Base64.getDecoder().decode(key);
        PKCS8EncodedKeySpec keySpec = new PKCS8EncodedKeySpec(keyBytes);
        KeyFactory keyFactory = KeyFactory.getInstance("RSA");
        PrivateKey privateKey = keyFactory.generatePrivate(keySpec);
        return privateKey;
    }
    /**
     * 把密钥转成base64字符串
     * @param key
     * @return
     * @throws Exception
     */
    public static String getKeyString(Key key) throws Exception {
        byte[] keyBytes = key.getEncoded();
        String s = Base64.getEncoder().encodeToString(keyBytes);
        return s;
    }

    public static void main(String[] args) throws Exception {
//        KeyPair kp = generateRSAKeyPair();
//        PrivateKey privateKey  = kp.getPrivate();
//        PublicKey publicKey = kp.getPublic();
//        String prik = getKeyString(privateKey);
//        String pubk = getKeyString(publicKey);
//        System.out.println("私钥:" + prik);
//        System.out.println("公钥:" + pubk);
//
//        PropertiesUtil.writeProperty("rsa.private.key", prik);
//        PropertiesUtil.writeProperty("rsa.public.key", pubk);
        String publicKeyStr = PropertiesUtil.readProperty("rsa.public.key");
        PublicKey publicKey = getPublicKey(publicKeyStr);
        String privateKeyStr = PropertiesUtil.readProperty("rsa.private.key");
        PrivateKey privateKey = getPrivateKey(privateKeyStr);

        // 用公钥加密
        String encryped = encryptData("123", "UTF-8", publicKey);
        System.out.println("加密后字符串:" + encryped);
        // 用私钥解密
        String encryp = decryptData(encryped, "UTF-8", privateKey);
        System.out.println("解密后字符串:" + encryp);



    }

}
