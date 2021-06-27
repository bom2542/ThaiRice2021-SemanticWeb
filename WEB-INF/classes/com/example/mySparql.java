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
						"      SELECT ?ImageRice ?RiceNameEN ?RiceNamrTH\n" +
						"        WHERE { \n" +
						"          ?ThaiRice ex:isRiceEngName ?RiceNameEN .\n" +
						"          ?ThaiRice ex:isRiceThaiName ?RiceNameTH .\n" +
						"          ?ThaiRice ex:hasImage ?ImageRice .\n" +
						"          ?ThaiRice ex:beType ?ThaiRice2 .\n" +
						"          ?ThaiRice2 ex:isRiceTypeThaiName ?RiceType .\n" +
						"          FILTER regex(?RiceNameEN, \"^" + qstring + "\", \"i\")\n" +
						"        }";

				FileManager.get().addLocatorClassLoader(mySparql.class.getClassLoader());
				Model model = FileManager.get().loadModel("thricerdf.owl");
				Query query = QueryFactory.create(queryTemplat);
				QueryExecution qexec = QueryExecutionFactory.create(query, model);

				ResultSet results = qexec.execSelect();
				if (results.getRowNumber() != 0) {
					out.print(results.getResultVars() + "<br> This is a result: <br>");
				}

				// out.println(ResultSetFormatter.asText(results));

//				out.print("<br> This is a result: <br>");
				List<String> list = results.getResultVars();
//				out.print("---------------------------<br>");
				out.print("<table class=\"table table-hover\">");
				out.print("<thead><tr>");
				for (int i = 0; i < list.size(); i++){
					out.print("<th scope=\"col\">" + list.get(i) + "</th>");
				}
				out.print("</tr></thead>");

				while (results.hasNext()) {
					out.print("<tbody><tr>");
					QuerySolution soln = results.nextSolution();
					for (int i = 0; i < list.size(); i++){
						Literal var1 = soln.getLiteral(list.get(i));
						out.print("<td>" + var1 + "</td>");
					}
					out.print("</tr></tbody>");
				}
				out.print("</table>");
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return SKIP_BODY;
	}
}