package dkconnexus;

import java.io.IOException;

import static java.lang.System.out;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.Collections;
import java.util.List;
import java.util.Date;
import java.util.ListIterator;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import com.googlecode.objectify.ObjectifyService;
//import com.googlecode.objectify.ObjectifyService.ofy;

@SuppressWarnings("serial")
public class ConnexusEmail extends HttpServlet {

    public void doGet(HttpServletRequest req, HttpServletResponse resp)
           throws IOException {
    	
    	List<EmailTime> t2 = OfyService.ofy().load().type(EmailTime.class).list();
		String time1 = "default";
		for (EmailTime e : t2) {
			time1 = e.EmailFreq;
		}
		long act_time = 0;
		
    	List<LastTime> t3 = OfyService.ofy().load().type(LastTime.class).list();
		Date time2 = new Date();;
		for (LastTime e : t3) {
			time2 = e.PrevTime;
		}
	
/*		resp.setContentType("text/plain");
		resp.getWriter().println(time1);
		resp.getWriter().println(time2);
*/		
		List<Stream> th = OfyService.ofy().load().type(Stream.class).list();
		Collections.sort(th);	
		ListIterator<Stream> it = th.listIterator();
		String top3 = "";
		for(int i = 0; i < 3; i++) {
			if (it.hasNext()) {
				Stream s = it.next();
				top3 = top3 + " " + s.name;	
			}
		}
		
		for (Stream str : th) {
			OfyService.ofy().save().entity(str).now();
		}
		
		if(!time1.equals("no")) {
			if(time1.equals("five"))
				act_time = 5;
			if(time1.equals("hour"))
				act_time = 60;
			if(time1.equals("daily"))
				act_time = 24*60;
		}
		
		Date t4 = new Date();
		long diffMinutes = (t4.getTime() - time2.getTime())/ (60 * 1000);  
//		resp.getWriter().println(diffMinutes);
	
		if(!time1.equals("no") && (diffMinutes > act_time))
		{
    	Properties props = new Properties();
    	Session session = Session.getDefaultInstance(props, null);
    	String msgBody = "The mostly viewed streams are" + top3;
    	
    	try {
    	    Message msg = new MimeMessage(session);
    	    msg.setFrom(new InternetAddress("kundu.debarati@gmail.com", "Debarati Kundu"));
    	    
    	    msg.addRecipient(Message.RecipientType.TO,
    	     new InternetAddress("kamram.ks+aptmini@gmail.com", "Kamran Saleem"));
    	    ListIterator<Stream> it1 = th.listIterator();
    	    for (int i = 0; i < 3; i++) {
    	    	if (it1.hasNext()) {
    				Stream s = it1.next();
    					msg.addRecipient(Message.RecipientType.TO,
    						new InternetAddress(s.owner, s.name));
    				}
    	    }
           
    	    msg.setSubject("Top Trending Streams");
    	    msg.setText(msgBody);
    	    Transport.send(msg);

    	} catch (AddressException e) {
    //		resp.getWriter().println("Hello, world AddressException!");
    	} catch (MessagingException e) {
    //		resp.getWriter().println("Hello, world MessagException!");
    	}
    	
    } // End of email check
    	Date PresentDate = new Date();
    	LastTime t1 = new LastTime();
        t1.Id = 1;
        t1.PrevTime = PresentDate;
        OfyService.ofy().save().entity(t1).now();
  //      resp.getWriter().println(t1.PrevTime);    
    }
}

/*
String[] to = {"kundu.kabita@gmail.com",owner1,owner2,owner3};
InternetAddress[] addressTo = new InternetAddress[to.length];
for (int i = 0; i < to.length; i++)
{
    addressTo[i] = new InternetAddress(to[i]);
}
msg.setRecipients(RecipientType.TO, addressTo); */


