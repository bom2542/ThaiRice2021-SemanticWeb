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

	private String qstring = "", fill = "", queryTemplat = "";
	public void setQstring(String qstring) {
		this.qstring = qstring;
	}
	public void setFill(String fill) {
		this.fill = fill;
	}

	public int doStartTag() throws JspException {

		JspWriter out = pageContext.getOut();
		try {
			if (!qstring.equals("")) {

				if(fill.equals("0")){
					queryTemplat = "PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>\n" +
							"      PREFIX ex: <http://www.myontology.com/rice#>\n" +
							"\n" +
							"      SELECT ?ImageRice ?RiceNameEN ?RiceNameTH ?Products ?RiceTypeEN ?RiceTypeTH \n" +
							"        WHERE { \n" +
							"          ?ThaiRice ex:isRiceEngName ?RiceNameEN .\n" +
							"          ?ThaiRice ex:isRiceThaiName ?RiceNameTH .\n" +
							"          ?ThaiRice ex:hasImage ?ImageRice .\n" +
							"          ?ThaiRice ex:hasProduct ?Products .\n" +
							"          ?ThaiRice ex:beType ?ThaiRice2 .\n" +
							"          ?ThaiRice2 ex:isRiceTypeEngName ?RiceTypeEN .\n" +
							"          ?ThaiRice2 ex:isRiceTypeThaiName ?RiceTypeTH .\n" +
							"          FILTER regex(?RiceNameEN, \"^" + qstring + "\", \"i\")\n" +
							"        }";
				}else if(fill.equals("1")){
					queryTemplat = "PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>\n" +
							"      PREFIX ex: <http://www.myontology.com/rice#>\n" +
							"\n" +
							"      SELECT ?RiceTypeEN ?RiceTypeTH ?RiceNameTH ?ImageRice \n" +
							"        WHERE { \n" +
							"          ?ThaiRice ex:isRiceEngName ?RiceNameEN .\n" +
							"          ?ThaiRice ex:isRiceThaiName ?RiceNameTH .\n" +
							"          ?ThaiRice ex:hasImage ?ImageRice .\n" +
							"          ?ThaiRice ex:hasProduct ?Products .\n" +
							"          ?ThaiRice ex:beType ?ThaiRice2 .\n" +
							"          ?ThaiRice2 ex:isRiceTypeEngName ?RiceTypeEN .\n" +
							"          ?ThaiRice2 ex:isRiceTypeThaiName ?RiceTypeTH .\n" +
							"          FILTER regex(?RiceTypeEN, \"^" + qstring + "\", \"i\")\n" +
							"        }";
				}else if(fill.equals("2")){
					queryTemplat = "PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>\n" +
							"      PREFIX ex: <http://www.myontology.com/rice#>\n" +
							"\n" +
							"      SELECT ?RiceAreaEN ?RiceAreaTH ?RiceNameTH ?ImageRice \n" +
							"        WHERE { \n" +
							"          ?ThaiRice ex:isRiceEngName ?RiceNameEN .\n" +
							"          ?ThaiRice ex:isRiceThaiName ?RiceNameTH .\n" +
							"          ?ThaiRice ex:hasImage ?ImageRice .\n" +
							"          ?ThaiRice ex:hasProduct ?Products .\n" +
							"          ?ThaiRice ex:beRegion ?ThaiRice2 .\n" +
							"          ?ThaiRice2 ex:isRiceRegionEngName ?RiceAreaEN .\n" +
							"          ?ThaiRice2 ex:isRiceRegionThaiName ?RiceAreaTH .\n" +
							"          FILTER regex(?RiceAreaEN, \"^" + qstring + "\", \"i\")\n" +
							"        }";
				}else if(fill.equals("3")){
					queryTemplat = "PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>\n" +
							"      PREFIX ex: <http://www.myontology.com/rice#>\n" +
							"\n" +
							"      SELECT ?ImageRice ?RiceNameEN ?RiceNameTH ?Leaf ?Seed ?Stem \n" +
							"        WHERE { \n" +
							"          ?ThaiRice ex:isRiceEngName ?RiceNameEN .\n" +
							"          ?ThaiRice ex:isRiceThaiName ?RiceNameTH .\n" +
							"          ?ThaiRice ex:hasImage ?ImageRice .\n" +
							"          ?ThaiRice ex:hasProduct ?Products .\n" +
							"          ?ThaiRice ex:beLeaf ?ThaiRice2 .\n" +
							"          ?ThaiRice2 ex:isPhysicalThaiName ?Leaf .\n" +
							"          ?ThaiRice ex:beSeed ?ThaiRice3 .\n" +
							"          ?ThaiRice3 ex:isPhysicalThaiName ?Seed .\n" +
							"          ?ThaiRice ex:beStem ?ThaiRice4 .\n" +
							"          ?ThaiRice4 ex:isPhysicalThaiName ?Stem .\n" +
							"          FILTER regex(?RiceNameEN, \"^" + qstring + "\", \"i\")\n" +
							"        }";
				}else{
					queryTemplat = "PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>\n" +
							"      PREFIX ex: <http://www.myontology.com/rice#>\n" +
							"\n" +
							"      SELECT ?ImageRice ?RiceNameEN ?RiceNameTH ?Products ?RiceTypeEN ?RiceTypeTH \n" +
							"        WHERE { \n" +
							"          ?ThaiRice ex:isRiceEngName ?RiceNameEN .\n" +
							"          ?ThaiRice ex:isRiceThaiName ?RiceNameTH .\n" +
							"          ?ThaiRice ex:hasImage ?ImageRice .\n" +
							"          ?ThaiRice ex:hasProduct ?Products .\n" +
							"          ?ThaiRice ex:beType ?ThaiRice2 .\n" +
							"          ?ThaiRice2 ex:isRiceTypeEngName ?RiceTypeEN .\n" +
							"          ?ThaiRice2 ex:isRiceTypeThaiName ?RiceTypeTH .\n" +
							"          FILTER regex(?RiceNameEN, \"^" + qstring + "\", \"i\")\n" +
							"        }";
				}


				FileManager.get().addLocatorClassLoader(mySparql.class.getClassLoader());
				Model model = FileManager.get().loadModel("thricerdf.owl");
				Query query = QueryFactory.create(queryTemplat);
				QueryExecution qexec = QueryExecutionFactory.create(query, model);

				ResultSet results = qexec.execSelect();
				if (results.getRowNumber() != 0) {
					out.print(results.getResultVars() + "<br> This is a result: <br>");
				}

				List<String> list = results.getResultVars();
				out.print("<table class=\"table table-hover\">");
				out.print("<thead><tr>");
				for (int i = 0; i < list.size(); i++){
					if(list.get(i).equals("ImageRice"))
						out.print("<th scope=\"col\" class=\"text-center\">" + "Rice photos" + "</th>");
					else if(list.get(i).equals("RiceNameEN"))
						out.print("<th scope=\"col\" class=\"text-center\">" + "Eng rice name" + "</th>");
					else if(list.get(i).equals("RiceNameTH"))
						out.print("<th scope=\"col\" class=\"text-center\">" + "Thai rice name" + "</th>");
					else if(list.get(i).equals("Products"))
						out.print("<th scope=\"col\" class=\"text-center\">" + "Products(kg-Farm/Year)" + "</th>");
					else if(list.get(i).equals("RiceTypeEN"))
						out.print("<th scope=\"col\" class=\"text-center\">" + "Eng rice type" + "</th>");
					else if(list.get(i).equals("RiceTypeTH"))
						out.print("<th scope=\"col\" class=\"text-center\">" + "Thai rice type" + "</th>");
					else
						out.print("<th scope=\"col\" class=\"text-center\">" + list.get(i) + "</th>");
				}
				out.print("</tr></thead>");

				while (results.hasNext()) {
					out.print("<tbody><tr>");
					QuerySolution soln = results.nextSolution();
					for (int i = 0; i < list.size(); i++){
						Literal var1 = soln.getLiteral(list.get(i));
						out.print("<td class=\"text-center\">" + var1 + "</td>");
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