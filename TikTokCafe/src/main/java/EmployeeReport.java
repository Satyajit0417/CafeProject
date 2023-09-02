


import java.io.IOException;
import java.io.InputStream;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.FileOutputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.HashMap;
import java.io.File;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.design.JRDesignQuery;
import net.sf.jasperreports.engine.design.JasperDesign;
import net.sf.jasperreports.engine.xml.JRXmlLoader;
import net.sf.jasperreports.view.JasperViewer;










/**
 * Servlet implementation class addEmployee
 */
@WebServlet("/EmployeeReport")
public class EmployeeReport extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		 String dburl = "jdbc:mysql://localhost:3306/Cdac";
		 String dbname = "root";
		 String dbpassword = "Cdac@123";
	     String dbdriver = "com.mysql.cj.jdbc.Driver";

		Connection cn = null;
		java.sql.Statement st = null;

		PrintWriter out = response.getWriter();
		
		String event = request.getParameter("tiktok");
		//String event1 = request.getParameter("Users");
		//String event2 = request.getParameter("Feedbacks");
		
		
		
		
		try {
			
			if(event.equals("Employees")) {
				
			Class.forName(dbdriver);
			cn = DriverManager.getConnection(dburl, dbname, dbpassword);
			

			
			InputStream in=new FileInputStream(new File("D:\\TikTokCafe\\src\\main\\Report\\EmployeeReport.jrxml"));         //G:\\HMSFinalwithout database\\Run\\reports
			JasperDesign jd= JRXmlLoader.load(in);																					//G:\\HMSFinalwithout database\\Run\\rprt\\HmsReports
																				//G:\HMSFinalwithout database\Run\lastreport														
		String sql="Select * from employee";
			JRDesignQuery newQuery =new JRDesignQuery();
			newQuery.setText(sql);
			jd.setQuery(newQuery);
			
			JasperReport jr =JasperCompileManager.compileReport(jd);
			HashMap para = new HashMap();
			JasperPrint j= JasperFillManager.fillReport(jr,para,cn);
			JasperViewer.viewReport(j,false);
			OutputStream os = new FileOutputStream(new File ("D:\\TikTokCafe\\src\\main\\Report\\EmployeeReport.jrxml"));       //G:\\HMSFinalwithout database\\Run\\generated reports
																		//G:\\print
			JasperExportManager.exportReportToPdfStream(j,os);
			
			
		} 
			
		
			else if(event.equals("Users")) {
				Class.forName(dbdriver);
				cn = DriverManager.getConnection(dburl, dbname, dbpassword);
				

				
				InputStream in=new FileInputStream(new File("D:\\TikTokCafe\\src\\main\\Report\\UsersReport.jrxml"));         //G:\\HMSFinalwithout database\\Run\\reports
				JasperDesign jd= JRXmlLoader.load(in);																					//G:\\HMSFinalwithout database\\Run\\rprt\\HmsReports
																					//G:\HMSFinalwithout database\Run\lastreport														
			String sql="Select * from user";
				JRDesignQuery newQuery =new JRDesignQuery();
				newQuery.setText(sql);
				jd.setQuery(newQuery);
				
				JasperReport jr =JasperCompileManager.compileReport(jd);
				HashMap para = new HashMap();
				JasperPrint j= JasperFillManager.fillReport(jr,para,cn);
				JasperViewer.viewReport(j,false);
				OutputStream os = new FileOutputStream(new File ("D:\\TikTokCafe\\src\\main\\Report\\UsersReport.jrxml"));       //G:\\HMSFinalwithout database\\Run\\generated reports
																			//G:\\print
				JasperExportManager.exportReportToPdfStream(j,os);
				
				
				
				
				
				
			}
			
			
				
			else if(event.equals("Feedbacks")) {
				Class.forName(dbdriver);
				cn = DriverManager.getConnection(dburl, dbname, dbpassword);
				

				
				InputStream in=new FileInputStream(new File("D:\\TikTokCafe\\src\\main\\Report\\FeedbackReport.jrxml"));         //G:\\HMSFinalwithout database\\Run\\reports
				JasperDesign jd= JRXmlLoader.load(in);																					//G:\\HMSFinalwithout database\\Run\\rprt\\HmsReports
																					//G:\HMSFinalwithout database\Run\lastreport														
			String sql="Select * from feedback";
				JRDesignQuery newQuery =new JRDesignQuery();
				newQuery.setText(sql);
				jd.setQuery(newQuery);
				
				JasperReport jr =JasperCompileManager.compileReport(jd);
				HashMap para = new HashMap();
				JasperPrint j= JasperFillManager.fillReport(jr,para,cn);
				JasperViewer.viewReport(j,false);
				OutputStream os = new FileOutputStream(new File ("D:\\TikTokCafe\\src\\main\\Report\\FeedbackReport.jrxml"));       //G:\\HMSFinalwithout database\\Run\\generated reports
																			//G:\\print
				JasperExportManager.exportReportToPdfStream(j,os);
				
				
				
				
				
			}
		    
				
			
			
			
			
			response.setContentType("text/html");
			out.println("<script type=\"text/javascript\">");
			out.println("location='./views/Reports.jsp';");
			out.println("</script>");
		    
			
			
			
		}
		
		
		 
		catch(Exception e) {
								System.out.println(e);
							}

		

		
		out.close();
		
		
		
		
			
		

	

}
}


	
	

    

