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
	private String name = "";
	private String tel = "";
	private String car = "";

	public void setName(String name) {
		this.name = name;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public void setCar(String car) {
		this.car = car;
	}

	public void setQstring(String qstring) {
//		qstring = "PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>"
//				+ "PREFIX ex: <http://www.myontology.com/car#>"
//				+ " "
//				+ "SELECT ?name ?phone ?brand"
//				+ "WHERE "
//				+ "{"
//				+ "?x ex:hasPersonName ?name ."
//				+ "?x ex:hasTelephoneNumber ?phone ."
//				+ "?x ex:hasCar ?y ."
//				+ "}";
		this.qstring = qstring;
	}

//	public void getValue() {
//		String queryString = "PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>"
//				+ "PREFIX ex: <http://www.myontology.com/car#>"
//				+ " "
//				+ "SELECT ?name ?phone ?brand"
//				+ "WHERE "
//				+ "{"
//				+ "?x ex:hasPersonName ?name ."
//				+ "?x ex:hasTelephoneNumber ?phone ."
//				+ "?x ex:hasCar ?y ."
////				+ "FILTER regex(?name, \"J\", \"i\")"
////				+ "FILTER regex(?phone, \"045\")"
////				+ "FILTER regex(?brand, \"B\", \"i\")"
//				+ "}";
//		this.getValue = queryString;
//	}

	public int doStartTag() throws JspException {

		JspWriter out = pageContext.getOut();
		try {
			if (!qstring.equals("")) {
				FileManager.get().addLocatorClassLoader(mySparql.class.getClassLoader());
				Model model = FileManager.get().loadModel("carrdf.owl");
				Query query = QueryFactory.create(qstring);
				QueryExecution qexec = QueryExecutionFactory.create(query, model);

//				out.print(qstring);
//				ResultSet results = qexec.execSelect();
//				if (results.getRowNumber() != 0) {
//					out.print(results.getResultVars() + "<br> This is a result: <br>");
//				}
//
//				// out.println(ResultSetFormatter.asText(results));
//
//				out.print("<br> This is a result: <br>");
//				List<String> list = results.getResultVars();
//				out.print("---------------------------<br>");
//				out.print("<table>");
//				out.print("<tr>");
//				for (int i = 0; i < list.size(); i++){
//					out.print("<th>" + list.get(i) + "</th>");
//				}
//				out.print("</tr>");
//
//				while (results.hasNext()) {
//					out.print("<tr>");
//					QuerySolution soln = results.nextSolution();
//					for (int i = 0; i < list.size(); i++){
//						Literal var1 = soln.getLiteral(list.get(i));
//						out.print("<td>" + var1 + "</td>");
//					}
//					out.print("</tr>");
//				}
//				out.print("</table>");
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return SKIP_BODY;
	}
}
