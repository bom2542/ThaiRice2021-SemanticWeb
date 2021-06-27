package com.example;

import java.util.Calendar;
import java.util.Iterator;
import java.util.List;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.TagSupport;

import com.hp.hpl.jena.query.Query;
import com.hp.hpl.jena.query.QueryExecution;
import com.hp.hpl.jena.query.QueryExecutionFactory;
import com.hp.hpl.jena.query.QueryFactory;
import com.hp.hpl.jena.query.QuerySolution;
import com.hp.hpl.jena.query.ResultSet;
import com.hp.hpl.jena.query.ResultSetFormatter;
import com.hp.hpl.jena.rdf.model.Literal;
import com.hp.hpl.jena.rdf.model.Model;
import com.hp.hpl.jena.util.FileManager;

public class mySparql extends TagSupport {

	private String qstring = "";
	private String queryTemplat = "";

	public void setQstring(String qstring) {
		this.qstring = qstring;
	}

	public int doStartTag() throws JspException {

		JspWriter out = pageContext.getOut();
		try {
			if (!qstring.equals("")) {
				queryTemplat = "PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>\n" +
						"      PREFIX ex: <http://www.myontology.com/rice#>\n" +
						"\n" +
						"      SELECT ?RiceEngName ?RiceThaiName ?Image\n" +
						"        WHERE { \n" +
						"          ?ThaiRice ex:isRiceEngName ?RiceEngName .\n" +
						"          ?ThaiRice ex:isRiceThaiName ?RiceThaiName .\n" +
						"          ?ThaiRice ex:hasImage ?Image .\n" +
						"          ?ThaiRice ex:beType ?tr .\n" +
						"          ?tr ex:isRiceTypeThaiName ?RiceType .\n" +
						"          FILTER regex(?RiceEngName, \"" + qstring + "\", \"i\")\n" +
						"        }";

				FileManager.get().addLocatorClassLoader(mySparql.class.getClassLoader());
				Model model = FileManager.get().loadModel("thricerdf.owl");
				Query query = QueryFactory.create(queryTemplat);
				QueryExecution qexec = QueryExecutionFactory.create(query, model);

				ResultSet results = qexec.execSelect();
				if (results.getRowNumber() != 0) {
					out.print(results.getResultVars() + "<br> <center><b><h3>Data search not found !!!</h3></b></center> <br>");
				}

				// out.println(ResultSetFormatter.asText(results));

//				out.print("<br> This is a result: <br>");
				List<String> list = results.getResultVars();
//				out.print("---------------------------<br>");
				out.print("<table class=\"table table-hover\">");
				out.print("<tr>");
				for (int i = 0; i < list.size(); i++){
					out.print("<th>" + list.get(i) + "</th>");
				}
				out.print("</tr>");

				while (results.hasNext()) {
					out.print("<tr>");
					QuerySolution soln = results.nextSolution();
					for (int i = 0; i < list.size(); i++){
						Literal var1 = soln.getLiteral(list.get(i));
						out.print("<td>" + var1 + "</td>");
					}
					out.print("</tr>");
				}
				out.print("</table>");
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return SKIP_BODY;
	}
}