package com.dn.spring.email;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.thymeleaf.TemplateEngine;
import org.thymeleaf.context.Context;

import com.dn.spring.email.domain.Email;

@Service
public class EmailService {

	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private TemplateEngine templateEngine;
	
	public void mailSender(Email email){
		MimeMessage mail = mailSender.createMimeMessage();
	    try {
	        MimeMessageHelper helper = new MimeMessageHelper(mail, true);
	        helper.setTo(email.getToUserEmail()); // 받는이
            helper.setFrom(email.getFromUserEmail()); // 보내는이
            helper.setSubject(email.getTitle());
            helper.setText(email.getContent());
	    } catch (MessagingException e) {
	        e.printStackTrace();
	    } 
	    
	    mailSender.send(mail);
	}
	
	public void mailHtmlSender(Email email){
		MimeMessage mail = mailSender.createMimeMessage();
		try {
			MimeMessageHelper helper = new MimeMessageHelper(mail, true);
			helper.setTo(email.getToUserEmail()); // 받는이
			helper.setFrom(email.getFromUserEmail()); // 보내는이
			helper.setSubject(email.getTitle());
			
			Map model = new HashMap();
			model.put("emailDetail", email);
			
			Context context = new Context(Locale.getDefault());
	        context.setVariables(model);
	        String text = templateEngine.process(email.getEmailTemplate(), context);
			helper.setText(text, true);
		} catch (MessagingException e) {
			e.printStackTrace();
		} 
		
		mailSender.send(mail);
	}
}
