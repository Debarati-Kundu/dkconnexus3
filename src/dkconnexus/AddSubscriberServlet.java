package dkconnexus;
import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;     

import java.util.List;
       

import dkconnexus.Stream;        
import dkconnexus.OfyService;              

import java.util.ListIterator;        
import java.util.Collections;        

@SuppressWarnings("serial")
public class AddSubscriberServlet extends HttpServlet {
	 public void doGet(HttpServletRequest req, HttpServletResponse resp)
	            throws IOException {
//	        resp.setContentType(    "text/plain"    );
//	        resp.getWriter().println(    "Hello, world"    );
//		 Long streamId = new Long(req.getParameter("streamId"));
		 String streamName = req.getParameter("streamName");
//		 List<Stream> th = OfyService.ofy().load().type(Stream.class).list();
		 resp.getWriter().println(streamName);
//		 resp.getWriter().println(    "Hello, world"    );
		 
	    }
}
