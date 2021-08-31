package email;

import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EnviaEmail {
	
	// Dependencia usada.
	/*  <dependency>
		    <groupId>com.sun.mail</groupId>
		    <artifactId>javax.mail</artifactId>
		    <version>1.6.2</version>
		</dependency>
	*/

	private String userName = ""; // email do gmail
	private String senha = ""; // senha do gmail

	private String listaDestinatarios = "";
	private String nomeRemetente = "";
	private String assuntoEmail = "";
	private String textoEmail = "";

	public EnviaEmail(String listaDestinatarios, String nomeRemetente, String assuntoEmail, String textoEmail) {
		this.listaDestinatarios = listaDestinatarios;
		this.nomeRemetente = nomeRemetente;
		this.assuntoEmail = assuntoEmail;
		this.textoEmail = textoEmail;
	}

	public void enviarEmail() {

		try {

			Properties properties = new Properties();
			// properties.put("mail.smtp.ssl.trust", "*"); Caso nao venha a funcionar mais.
			properties.put("mail.smtp.auth", "true"); // autorizacao
			properties.put("mail.smtp.starttls", "true"); // autenticacao
			properties.put("mail.smtp.host", "smtp.gmail.com"); // servidor gmail Google.
			properties.put("mail.smtp.port", "465"); // porta do servidor
			properties.put("mail.smtp.socketFactory.port", "465"); // especifica a porta a ser conectada pelo socket
			properties.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory"); // classe socket de
																								// conexao ao SMTP

			Session session = Session.getInstance(properties, new Authenticator() {

				@Override
				protected PasswordAuthentication getPasswordAuthentication() {

					return new PasswordAuthentication(userName, senha);

				}

			});

			// destinatarios
			Address[] toUsers = InternetAddress.parse(listaDestinatarios);

			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(userName, nomeRemetente)); // email do remetente ,
																			// descricao.
			message.setRecipients(Message.RecipientType.TO, toUsers); // email do destinatario
			message.setSubject(assuntoEmail); // Titulo do e-mail
			message.setText(textoEmail); // corpo do // email.

			Transport.send(message);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
