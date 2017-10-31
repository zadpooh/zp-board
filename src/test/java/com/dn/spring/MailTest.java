package com.dn.spring;

//@SpringBootApplication
public class MailTest {

	/*@Bean
	public SenderService senderService() {
	    return new SenderService();
	}*/
	
	public static void main(String[] args) {
		
		//SpringApplication.run(MailTest.class, args);

	}
	
	/*public class SenderService {

		@Autowired
		private JavaMailSender mailSender;

		@PostConstruct
		public void send() {
		    MimeMessage mail = mailSender.createMimeMessage();
		    try {
		        MimeMessageHelper helper = new MimeMessageHelper(mail, true);
		        helper.setTo("zadpooh@nate.com"); // 받는이
	            //helper.setReplyTo("someone@localhost");
	            helper.setFrom("zadpooh@naver.com"); // 보내는이
	            helper.setSubject("Lorem ipsum");
	            helper.setText("Lorem ipsum dolor sit amet [...]");
		    } catch (MessagingException e) {
		        e.printStackTrace();
		    } finally {}
		    mailSender.send(mail);
		    //return helper;
		}

		}*/


}
