package com.pcinside.javamail;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

class MyAuthentication extends Authenticator {
	 
    PasswordAuthentication account;
 
    public MyAuthentication(){
        String id = "pcinside-portfolio";
        String pw = "insidepc1234";
        account = new PasswordAuthentication(id, pw);
    }
 
    public PasswordAuthentication getPasswordAuthentication(){
        return account;
    }
}