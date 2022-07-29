package com.pcinside.javamail;

import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailChk {
	
	Authenticator auth = null;
	Session session = null;
	MimeMessage msg = null;
	
	public EmailChk(){
		Properties p = System.getProperties();
        p.put("mail.smtp.starttls.enable", "true");
        p.put("mail.smtp.host", "smtp.naver.com");
        p.put("mail.smtp.auth", "true");
        p.put("mail.smtp.port", "587");
        
        auth = new MyAuthentication();
        session = Session.getDefaultInstance(p, auth);
        msg = new MimeMessage(session);
	}
	
	public void authStart(String email, int authCode) {
		try {
            msg.setSentDate(new Date());
            InternetAddress from = new InternetAddress();
            
            from = new InternetAddress("피시인사이드<pcinside-portfolio@naver.com>");
            msg.setFrom(from);
 
            InternetAddress to = new InternetAddress(email);
            msg.setRecipient(Message.RecipientType.TO, to);
 
            msg.setSubject("인증번호", "UTF-8");
            msg.setText("인증번호는 "+ authCode + "입니다.", "UTF-8");
            msg.setHeader("content-Type", "text/html");
 
            javax.mail.Transport.send(msg);
        } catch (AddressException addr_e){
            addr_e.printStackTrace();
        } catch (MessagingException msg_e){
            msg_e.printStackTrace();
        }
	}
	
}
