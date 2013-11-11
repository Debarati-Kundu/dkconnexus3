package dkconnexus;

import java.io.IOException;

import javax.servlet.http.*;

import java.util.HashSet;
import java.util.LinkedList;
import java.util.Date;
import java.util.List;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import static com.googlecode.objectify.ObjectifyService.ofy;

// Backs up create.jsp form submission. Trivial since there's no image uploaded, just a URL
@SuppressWarnings("serial")
public class CreateStreamServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		
		UserService userService = UserServiceFactory.getUserService();
        User user = userService.getCurrentUser();
        
        String tags = req.getParameter("tags"); 
        String subs = req.getParameter("subs"); 
        String default_msg = req.getParameter("msg");
        if (default_msg.equals(""))
        	default_msg = user.getEmail() + " invites you to the photo stream she has created at ";

        String newname = req.getParameter("streamName");
        
        int flag = 0;
        List<Stream> th = OfyService.ofy().load().type(Stream.class).list();
        for(Stream str : th) {
        	if(str.name.equals(newname)){
        		if(flag == 0) flag = 1;
        	}
        }
        
        resp.getWriter().println(flag);
        if(flag == 0) {
		Stream s = new Stream(req.getParameter("streamName"), user.getEmail(),
				/*req.getParameter("tags"),*/ req.getParameter("url"));
		
		s.subscribers = new LinkedList<String>();
		s.tags = new HashSet<String>();
		
        for (String tag : tags.split("#")) { 
			tag = tag.replace(" ", ""); 
	    	s.tags.add(tag);
		} 
        for (String sub : subs.split(",")) { 
			sub = sub.replace(" ", ""); 
			if(!s.subscribers.contains(sub))
				s.subscribers.add(sub);
		} 
        
        s.stream_view_dates = new LinkedList<Date>();
        ofy().save().entity(s).now();
        
        Properties props = new Properties();
    	Session session = Session.getDefaultInstance(props, null);
    	String msgBody = default_msg
    			+ " https://dkconnexus.appspot.com/show_stream.jsp?streamId=" + s.id + "&"
				+ "streamName=" + s.name;
        
    	try {
    	    Message msg = new MimeMessage(session);
    	    msg.setFrom(new InternetAddress(user.getEmail(), "Connexus User"));
    	    for (String sub : s.subscribers) {
    	    	msg.addRecipient(Message.RecipientType.TO,
    	       	     new InternetAddress(sub, "Invitees"));
    	    }

    	    msg.setSubject("New Connexus photo stream created!");
    	    msg.setText(msgBody);
    	    Transport.send(msg);

    	} catch (AddressException e) {
    //		resp.getWriter().println("Hello, world AddressException!");
    	} catch (MessagingException e) {
    //		resp.getWriter().println("Hello, world MessagException!");
    	}
    	
		resp.sendRedirect("/view_stream.jsp");
        } else {
        	resp.sendRedirect("/error.jsp");
        }
	}
}