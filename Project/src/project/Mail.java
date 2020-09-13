package project;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class Mail extends Authenticator{

	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		//네이버 email,pw
		String id="leechanggod";
		String pwd="leechnag0798";
		return new PasswordAuthentication(id, pwd);
	}
	
}
