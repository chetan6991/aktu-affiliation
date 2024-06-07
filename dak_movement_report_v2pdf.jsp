<%@page import="com.itextpdf.text.pdf.PdfReader"%>
<%@ page import="com.sits.general.ReadProps"%>
<%@ page import="java.util.*" %>
<%@ page import="org.springframework.beans.factory.annotation.Autowired" %>
<%@ include file="../myCks.jsp"%>
<%@ page import="java.io.*" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="java.awt.Color"%>
<%@ page import="com.itextpdf.text.Image"%>
<%@ page import="com.itextpdf.text.BaseColor"%>
<%@ page import="com.itextpdf.text.Document"%>
<%@ page import="com.itextpdf.text.DocumentException"%>
<%@ page import="com.itextpdf.text.Element"%>
<%@ page import="com.itextpdf.text.Font"%>
<%@ page import="com.itextpdf.text.FontFactory"%>
<%@ page import="com.itextpdf.text.Font.FontFamily"%> 
<%@ page import="com.itextpdf.text.PageSize"%>
<%@ page import="com.itextpdf.text.Paragraph"%>
<%@ page import="com.itextpdf.text.Phrase"%>
<%@ page import="com.itextpdf.text.Chunk"%>
<%@ page import="com.itextpdf.text.pdf.PdfPCell"%>
<%@ page import="com.itextpdf.text.pdf.PdfPTable"%>
<%@ page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@ page import="com.itextpdf.text.pdf.BaseFont"%>
<%@ page import="com.itextpdf.text.Rectangle"%>
<%@ page import="com.itextpdf.text.pdf.PdfPageEventHelper"%>
<%@ page import="com.itextpdf.text.pdf.ColumnText"%>
<%@ page import="com.itextpdf.text.pdf.PdfContentByte"%>
<%@page import="com.sits.fms.reports.file_movement_report.FileMovementReportModel"%>
<%@page import="com.sits.fms.reports.file_movement_report.FileMovementReportManager"%>

<head>
<script src="../resources/assets/sits/bootstrap/3.3.7/js/bootstrap.min.js"></script>
   	<script type="text/javascript" src="../resources/js/jquery-3.2.1.js"></script>
    <script type="text/javascript" src="../resources/js/filemovement/dak_creation.js"></script>
    <script type="text/javascript" src="../resources/js/common.js"></script> 
    <script type="text/javascript" src="../resources/js/common/validations.js"></script>
    <script type="text/javascript" src="../resources/js/gen.js"></script>
    <script type="text/javascript" src="../resources/js/common/common-utilities.js"></script>
   <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
  </head>
  <style>
.btn-view {
	    color: #ffffff !important;
	    background-color: #00799A !important;
	    border-color: #687DB4 !important;
	    font-size: 15px !important;
	    box-shadow: 2px 2px 1px #336376 !important;
		background: -webkit-gradient(linear, left top, left bottom, color-stop(0%,#0e303e), color-stop(100%,#285f73)) !important;
		}
</style>
  
  <%
	try{
		       
				DecimalFormat df = new DecimalFormat("#,###,###,###.00");
			  	DecimalFormat df1 = new DecimalFormat("##########.##");
			  	DecimalFormat df_num = new DecimalFormat("##########.##");
			  	
				
                Document document             = new Document(PageSize.A4, 20, 20, 15, 15); //1.Left, 2.Right, 3.Top, 4.Bottom
               
				ByteArrayOutputStream buffer  = new ByteArrayOutputStream();
				PdfWriter writer              = PdfWriter.getInstance(document, buffer);
				
				
			    String verdanab_file = "verdanab.ttf";
			    verdanab_file = request.getRealPath("fonts/" + verdanab_file);
			
			    String verdana_file = "verdana.ttf";
			    verdana_file = request.getRealPath("fonts/" + verdana_file);
			
			    ServletContext servletContext = request.getServletContext();
				String path =   File.separator + "resources/images"+File.separator+"ulogo.png";
			    String contextPath = servletContext.getRealPath(path);
	
			    String FileId    = General.checknull(request.getParameter("fileId"));
			    String file_status    = General.checknull(request.getParameter("file_status"));
			    //System.out.println("FileId "+FileId+"|"+file_status);
			    
			    response.setHeader("Content-Disposition","attachment; filename=\"" + "dak_Detail.pdf\"");
				 String headerName = "Dak Detail";
				 FontFactory.register(verdanab_file, "my_varadana_bold_font");
				 Font small = new Font(FontFamily.HELVETICA, 6);
				 Font myVerdanabFontM12 = FontFactory.getFont("my_varadana_bold_font",12.0f, new BaseColor(128, 0, 0));
				 Font myVerdanabFontB12 = FontFactory.getFont("my_varadana_bold_font",12.0f, new BaseColor(0, 0, 0));
				 Font myVerdanabFontM10 = FontFactory.getFont("my_varadana_bold_font",10.0f, new BaseColor(128, 0, 0));
				 Font myVerdanabFontB10 = FontFactory.getFont("my_varadana_bold_font",10.0f, new BaseColor(0, 0, 0));
				 Font myVerdanabFontM11 = FontFactory.getFont("my_varadana_bold_font",11.0f, new BaseColor(128, 0, 0));
				 Font myVerdanabFontB11 = FontFactory.getFont("my_varadana_bold_font",11.0f, new BaseColor(0, 0, 0));
                 Font myVerdanabFontM08 = FontFactory.getFont("my_varadana_bold_font",8.0f, new BaseColor(128, 0, 0));
				 Font myVerdanabFontB08 = FontFactory.getFont("my_varadana_bold_font",8.0f, new BaseColor(0, 0, 0));
				 Font myVerdanabFontM07 = FontFactory.getFont("my_varadana_bold_font",7.0f, new BaseColor(128, 0, 0));
				 Font myVerdanabFontB07 = FontFactory.getFont("my_varadana_bold_font",7.0f, new BaseColor(0, 0, 0));
				 Font myVerdanabFontM06 = FontFactory.getFont("my_varadana_bold_font",6.0f, new BaseColor(128, 0, 0));
				 Font myVerdanabFontB06 = FontFactory.getFont("my_varadana_bold_font",6.0f, new BaseColor(0, 0, 0));
				 Font myVerdanabFontB09 = FontFactory.getFont("my_varadana_bold_font", 9.0f, new BaseColor(0, 0, 0));
			     // Font RED_NORMAL = new Font(FontFamily.HELVETICA, 12, Font.NORMAL, BaseColor.RED);
			
			     //FontFactory.register("c:/windows/fonts/verdana.TTF", "my_varadana_normal_font");
				 FontFactory.register(verdana_file, "my_varadana_normal_font");
			     Font myVerdanaFontM12 = FontFactory.getFont("my_varadana_normal_font",12.0f, new BaseColor(128, 0, 0));
				 Font myVerdanaFontB12 = FontFactory.getFont("my_varadana_normal_font",12.0f, new BaseColor(0, 0, 0));
				 Font myVerdanaFontM11 = FontFactory.getFont("my_varadana_normal_font",11.0f, new BaseColor(128, 0, 0));
			     Font myVerdanaFontB11 = FontFactory.getFont("my_varadana_normal_font",11.0f, new BaseColor(0, 0, 0));
				 Font myVerdanaFontM10 = FontFactory.getFont("my_varadana_normal_font",10.0f, new BaseColor(128, 0, 0));
			     Font myVerdanaFontB10 = FontFactory.getFont("my_varadana_normal_font",10.0f, new BaseColor(0, 0, 0));
				 Font myVerdanaFontBL10 = FontFactory.getFont("my_varadana_normal_font",10.0f, new BaseColor(0, 34, 255));
			     Font myVerdanaFontM08 = FontFactory.getFont("my_varadana_normal_font",8.0f, new BaseColor(128, 0, 0));
			     Font myVerdanaFontB08 = FontFactory.getFont("my_varadana_normal_font",8.0f, new BaseColor(0, 0, 0));
				 Font myVerdanaFontBL08 = FontFactory.getFont("my_varadana_normal_font",8.0f, new BaseColor(0, 34, 255));
				 Font myVerdanaFontM07 = FontFactory.getFont("my_varadana_normal_font",7.0f, new BaseColor(128, 0, 0));
				 Font myVerdanaFontB07 = FontFactory.getFont("my_varadana_normal_font",7.0f, new BaseColor(0, 0, 0));
				 Font myVerdanaFontBL07 = FontFactory.getFont("my_varadana_normal_font",7.0f, new BaseColor(0, 34, 255));
				 Font myVerdanaFontM06 = FontFactory.getFont("my_varadana_normal_font",6.0f, new BaseColor(128, 0, 0));
				 Font myVerdanaFontB06 = FontFactory.getFont("my_varadana_normal_font",6.0f, new BaseColor(0, 0, 0));
				 Font myVerdanaFontBL06 = FontFactory.getFont("my_varadana_normal_font",6.0f, new BaseColor(0, 34, 255));
				 Font myVerdanaFontB09 = FontFactory.getFont("my_varadana_normal_font", 9.0f, new BaseColor(0, 0, 0));
				 Font myVerdanaFontB13 = FontFactory.getFont("my_varadana_normal_font", 9.0f, new BaseColor(215, 57, 37));//red
				 Font myVerdanaFontB14 = FontFactory.getFont("my_varadana_normal_font", 9.0f, new BaseColor(60, 141, 188));//blue
				 Font myVerdanaFontB15 = FontFactory.getFont("my_varadana_normal_font", 9.0f, new BaseColor(35, 127, 82));//green
				 Font myVerdanaFontB16 = FontFactory.getFont("my_varadana_normal_font", 9.0f, new BaseColor(255, 140, 0));//orange
				     
				     
				 document.open();
				
				 HttpSession session1=(HttpSession) request.getAttribute("session");
				 FileMovementReportModel model=new FileMovementReportModel();
				List<FileMovementReportModel> list= FileMovementReportManager.PDFReport(model,session1,FileId);
				//System.out.println("list size    "+list.size());
					
				float[] headerWidth = {1.2f,8f};
				 PdfPTable headerTable = new PdfPTable(headerWidth);
				 headerTable.setWidthPercentage(95f);
				
				 /* float[] headerWidth = {1f};
				 PdfPTable headerTable = new PdfPTable(headerWidth);
				 headerTable.setWidthPercentage(95f); */
				     
				 float[] headerListWidth = {2f, 4f, 2f,4f};
				 PdfPTable HeaderListTable = new PdfPTable(headerListWidth);
				 HeaderListTable.setSpacingAfter(20);
				 HeaderListTable.setWidthPercentage(95f);
				 HeaderListTable.setSpacingBefore(20);
				 
				 PdfPCell cell;  	
				 
				   // ============   Start headerWidth ================================= 
				 
             	 
					Image image1 = Image.getInstance(contextPath);
				    image1.setAlignment(Image.RIGHT);
				    image1.scaleAbsolute(60.0f, 70.0f);
				    cell = new PdfPCell();
				    cell.addElement(image1);
				    cell.setRowspan(7);
				    cell.setColspan(1);
				    cell.setHorizontalAlignment(Element.ALIGN_LEFT);
				    cell.setBorderColor(BaseColor.WHITE);
				    headerTable.addCell(cell);
				    
				    cell = new PdfPCell(new Phrase("",myVerdanabFontB10));
				    cell.setColspan(1);
				    cell.setHorizontalAlignment(Element.ALIGN_CENTER);
				    cell.setBorderColor(new BaseColor(255, 255, 255));
				    headerTable.addCell(cell);
				     
				    cell = new PdfPCell(new Phrase(ReadProps.getkeyValue("comp.name","filemovement"),myVerdanabFontB12));
				    cell.setColspan(1);
				    cell.setHorizontalAlignment(Element.ALIGN_CENTER);
				    cell.setBorderColor(new BaseColor(255, 255, 255));
				    headerTable.addCell(cell);
				     
				    cell = new PdfPCell(new Phrase(ReadProps.getkeyValue("comp.add1", "filemovement")+", "+ReadProps.getkeyValue("comp.add2", "filemovement"),myVerdanaFontB08));
				    cell.setColspan(1);
				    cell.setHorizontalAlignment(Element.ALIGN_CENTER);
				    cell.setBorderColor(new BaseColor(255, 255, 255));
				    headerTable.addCell(cell);
				     
				    cell = new PdfPCell(new Phrase(headerName,myVerdanabFontB10));
				    cell.setColspan(1);
				    cell.setHorizontalAlignment(Element.ALIGN_CENTER);
				    cell.setBorderColor(new BaseColor(255, 255, 255));
				    headerTable.addCell(cell);
				     
				    cell = new PdfPCell(new Phrase(" ",myVerdanabFontB10));
				    cell.setColspan(1);
				    cell.setHorizontalAlignment(Element.ALIGN_CENTER);
				    cell.setBorderColor(new BaseColor(255, 255, 255));
				    headerTable.addCell(cell);
				     
				    cell = new PdfPCell(new Phrase(" ",myVerdanabFontB10));
				    cell.setColspan(1);
				    cell.setHorizontalAlignment(Element.ALIGN_CENTER);
				    cell.setBorderColor(new BaseColor(255, 255, 255));
				    headerTable.addCell(cell);
			     
		            // ============   End headerWidth =================================  
				  
				 
				 
				 
				/*  cell = new PdfPCell(new Phrase(headerName,myVerdanabFontB10));
		         cell.setColspan(1);
		    	 cell.setHorizontalAlignment(Element.ALIGN_CENTER);
		    	 cell.setBorderColor(new BaseColor(255, 255, 255));
		    	 headerTable.addCell(cell); */
		    	 
				 cell = new PdfPCell(new Phrase("Dak Id",myVerdanabFontB09));
		         cell.setColspan(1);
		    	 cell.setHorizontalAlignment(Element.ALIGN_LEFT);
		    	 cell.setBorderColor(new BaseColor(255, 255, 255));
		    	 HeaderListTable.addCell(cell);

		    	 cell = new PdfPCell(new Phrase(": "+list.get(0).getFile_group_id(),myVerdanaFontB10)); 
		         cell.setColspan(1);
		    	 cell.setHorizontalAlignment(Element.ALIGN_LEFT);
		    	 cell.setBorderColor(new BaseColor(255, 255, 255));
		    	 HeaderListTable.addCell(cell);
		    	 
		    	 cell = new PdfPCell(new Phrase("Manual Dak No.",myVerdanabFontB09));
		         cell.setColspan(1);
		    	 cell.setHorizontalAlignment(Element.ALIGN_LEFT);
		    	 cell.setBorderColor(new BaseColor(255, 255, 255));
		    	 HeaderListTable.addCell(cell);

		    	 cell = new PdfPCell(new Phrase(": "+list.get(0).getManual_file_id(),myVerdanaFontB10)); 
		         cell.setColspan(1);
		    	 cell.setHorizontalAlignment(Element.ALIGN_LEFT);
		    	 cell.setBorderColor(new BaseColor(255, 255, 255));
		    	 HeaderListTable.addCell(cell);
		    	 
		    	 cell = new PdfPCell(new Phrase("Title",myVerdanabFontB09));
		         cell.setColspan(1);
		    	 cell.setHorizontalAlignment(Element.ALIGN_LEFT);
		    	 cell.setBorderColor(new BaseColor(255, 255, 255));
		    	 HeaderListTable.addCell(cell);

		    	 cell = new PdfPCell(new Phrase(": ",myVerdanaFontB10)); 
		         cell.setColspan(1);
		    	 cell.setHorizontalAlignment(Element.ALIGN_LEFT);
		    	 cell.setBorderColor(new BaseColor(255, 255, 255));
		    	 HeaderListTable.addCell(cell);
		    	 
		    	 cell = new PdfPCell(new Phrase("Subject",myVerdanabFontB09));
		         cell.setColspan(1);
		    	 cell.setHorizontalAlignment(Element.ALIGN_LEFT);
		    	 cell.setBorderColor(new BaseColor(255, 255, 255));
		    	 HeaderListTable.addCell(cell);

		    	 cell = new PdfPCell(new Phrase(": "+list.get(0).getSubject(),myVerdanaFontB10)); 
		         cell.setColspan(1);
		    	 cell.setHorizontalAlignment(Element.ALIGN_LEFT);
		    	 cell.setBorderColor(new BaseColor(255, 255, 255));
		    	 HeaderListTable.addCell(cell);
		    	 
		    	 cell = new PdfPCell(new Phrase("Created By",myVerdanabFontB09));
		         cell.setColspan(1);
		    	 cell.setHorizontalAlignment(Element.ALIGN_LEFT);
		    	 cell.setBorderColor(new BaseColor(255, 255, 255));
		    	 HeaderListTable.addCell(cell);

		    	 cell = new PdfPCell(new Phrase(": "+list.get(0).getSenderId(),myVerdanaFontB10)); 
		         cell.setColspan(1);
		    	 cell.setHorizontalAlignment(Element.ALIGN_LEFT);
		    	 cell.setBorderColor(new BaseColor(255, 255, 255));
		    	 HeaderListTable.addCell(cell);
		    	 
		    	 cell = new PdfPCell(new Phrase("Opening Date",myVerdanabFontB09));
		         cell.setColspan(1);
		    	 cell.setHorizontalAlignment(Element.ALIGN_LEFT);
		    	 cell.setBorderColor(new BaseColor(255, 255, 255));
		    	 HeaderListTable.addCell(cell);

		    	 cell = new PdfPCell(new Phrase(": "+list.get(0).getFile_opening_date(),myVerdanaFontB10)); 
		         cell.setColspan(1);
		    	 cell.setHorizontalAlignment(Element.ALIGN_LEFT);
		    	 cell.setBorderColor(new BaseColor(255, 255, 255));
		    	 HeaderListTable.addCell(cell);
		    	 
		    	 cell = new PdfPCell(new Phrase("Department",myVerdanabFontB09));
		         cell.setColspan(1);
		    	 cell.setHorizontalAlignment(Element.ALIGN_LEFT);
		    	 cell.setBorderColor(new BaseColor(255, 255, 255));
		    	 HeaderListTable.addCell(cell);

		    	 cell = new PdfPCell(new Phrase(": "+General.checknull(list.get(0).getSender_dpt()),myVerdanaFontB10)); 
		         cell.setColspan(1);
		    	 cell.setHorizontalAlignment(Element.ALIGN_LEFT);
		    	 cell.setBorderColor(new BaseColor(255, 255, 255));
		    	 HeaderListTable.addCell(cell);
		    	 
		    	 cell = new PdfPCell(new Phrase("Purpose",myVerdanabFontB09));
		         cell.setColspan(1);
		    	 cell.setHorizontalAlignment(Element.ALIGN_LEFT);
		    	 cell.setBorderColor(new BaseColor(255, 255, 255));
		    	 HeaderListTable.addCell(cell);

		    	 cell = new PdfPCell(new Phrase(": ",myVerdanaFontB10)); 
		         cell.setColspan(1);
		    	 cell.setHorizontalAlignment(Element.ALIGN_LEFT);
		    	 cell.setBorderColor(new BaseColor(255, 255, 255));
		    	 HeaderListTable.addCell(cell);
		    	 
		    	 cell = new PdfPCell(new Phrase("File Status",myVerdanabFontB09));
		         cell.setColspan(1);
		    	 cell.setHorizontalAlignment(Element.ALIGN_LEFT);
		    	 cell.setBorderColor(new BaseColor(255, 255, 255));
		    	 HeaderListTable.addCell(cell);
		    	 
		    	 
                /*  if(list.get(0).getFilestatus().equals("0"))
		    	 cell = new PdfPCell(new Phrase(": Send",myVerdanaFontB10)); 
                 else
                 cell = new PdfPCell(new Phrase(": Receive",myVerdanaFontB10)); */
                 cell = new PdfPCell(new Phrase(": "+file_status,myVerdanaFontB10)); 
                 cell.setColspan(1);
		    	 cell.setHorizontalAlignment(Element.ALIGN_LEFT);
		    	 cell.setBorderColor(new BaseColor(255, 255, 255));
		    	 HeaderListTable.addCell(cell);
		    	 
		    	 cell = new PdfPCell(new Phrase("Attach To",myVerdanabFontB09));
		         cell.setColspan(1);
		    	 cell.setHorizontalAlignment(Element.ALIGN_LEFT);
		    	 cell.setBorderColor(new BaseColor(255, 255, 255));
		    	 HeaderListTable.addCell(cell);

		    	 cell = new PdfPCell(new Phrase(": ",myVerdanaFontB10)); 
		         cell.setColspan(1);
		    	 cell.setHorizontalAlignment(Element.ALIGN_LEFT);
		    	 cell.setBorderColor(new BaseColor(255, 255, 255));
		    	 HeaderListTable.addCell(cell);
		    	 
		    	 cell = new PdfPCell(new Phrase("For Location",myVerdanabFontB09));
		         cell.setColspan(1);
		    	 cell.setHorizontalAlignment(Element.ALIGN_LEFT);
		    	 cell.setBorderColor(new BaseColor(255, 255, 255));
		    	 HeaderListTable.addCell(cell);
    	
		    	 cell = new PdfPCell(new Phrase(": "+list.get(0).getCreated_for_location(),myVerdanaFontB10)); 
		         cell.setColspan(1);
		    	 cell.setHorizontalAlignment(Element.ALIGN_LEFT);
		    	 cell.setBorderColor(new BaseColor(255, 255, 255));
		    	 HeaderListTable.addCell(cell);
		    	 
		    	 cell = new PdfPCell(new Phrase("Remarks",myVerdanabFontB09));
		         cell.setColspan(1);
		    	 cell.setHorizontalAlignment(Element.ALIGN_LEFT);
		    	 cell.setBorderColor(new BaseColor(255, 255, 255));
		    	 HeaderListTable.addCell(cell);

		    	 cell = new PdfPCell(new Phrase(": "+list.get(0).getRemarks(),myVerdanaFontB10)); 
		         cell.setColspan(1);
		    	 cell.setHorizontalAlignment(Element.ALIGN_LEFT);
		    	 cell.setBorderColor(new BaseColor(255, 255, 255));
		    	 HeaderListTable.addCell(cell);
		    	 
		    	 cell = new PdfPCell(new Phrase("Creation Date",myVerdanabFontB09));
		         cell.setColspan(1);
		    	 cell.setHorizontalAlignment(Element.ALIGN_LEFT);
		    	 cell.setBorderColor(new BaseColor(255, 255, 255));
		    	 HeaderListTable.addCell(cell);

		    	 cell = new PdfPCell(new Phrase(": "+list.get(0).getCreated(),myVerdanaFontB10)); 
		         cell.setColspan(1);
		    	 cell.setHorizontalAlignment(Element.ALIGN_LEFT);
		    	 cell.setBorderColor(new BaseColor(255, 255, 255));
		    	 HeaderListTable.addCell(cell);
		    	 
		    	 
		    	 cell = new PdfPCell(new Phrase("",myVerdanaFontB10)); 
		         cell.setColspan(1);
		    	 cell.setHorizontalAlignment(Element.ALIGN_LEFT);
		    	 cell.setBorderColor(new BaseColor(255, 255, 255));
		    	 HeaderListTable.addCell(cell);
		    	 
		    	 cell = new PdfPCell(new Phrase(" ",myVerdanaFontB10)); 
		         cell.setColspan(1);
		    	 cell.setHorizontalAlignment(Element.ALIGN_LEFT);
		    	 cell.setBorderColor(new BaseColor(255, 255, 255));
		    	 HeaderListTable.addCell(cell);
		    	 
		    	 document.add(headerTable);
		    	 document.add(HeaderListTable);
	
		    	 document.close();
				   
			     response.setContentType("application/pdf");
			     DataOutput dataOutput = new DataOutputStream(response.getOutputStream());   
			     byte[] bytes = buffer.toByteArray();
			     
			     response.setContentLength(bytes.length);
			     for(int f = 0; f < bytes.length; f++)
			     {
			       dataOutput.writeByte(bytes[f]);
			     }
			     response.flushBuffer();
			     out.clear(); // where out is a JspWriter
			     out = pageContext.pushBody();
	
		
	}catch (Exception e) {
        System.out.println("hi"+e);
	    }

			    %>
			   