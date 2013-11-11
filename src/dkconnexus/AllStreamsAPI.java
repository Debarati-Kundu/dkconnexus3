package dkconnexus;

import java.io.IOException;
import java.lang.reflect.Type;
import java.util.List;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.appengine.api.blobstore.BlobstoreService;
import com.google.appengine.api.blobstore.BlobstoreServiceFactory;
import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;

public class AllStreamsAPI extends HttpServlet {
	
	private static final Logger log = Logger.getLogger(AllStreamsAPI.class.getName());

	private BlobstoreService blobstoreService = BlobstoreServiceFactory
			.getBlobstoreService();

	@Override
	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	@Override
	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		log.warning("Entering AllStreamsAPI");
		List<Stream> allStreams = OfyService.ofy().load().type(Stream.class).list();
        List<Stream> subsetStreams = null;
		String jsonSelector = req.getParameter("selector");
        if ( jsonSelector == null ) {
           subsetStreams = allStreams;
        } else {
          Gson gson = new Gson();
          Type t = new TypeToken<Selector>(){}.getType();
          Selector sel = gson.fromJson(jsonSelector, t);
          subsetStreams = sel.selectStreams(allStreams);
        }		
		
		
		Gson gson = new Gson();
		String json = gson.toJson(subsetStreams);
		res.setContentType("application/json");
		res.getWriter().print(json);
	}
}
