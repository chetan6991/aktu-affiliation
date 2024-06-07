<%@page import="java.util.zip.ZipOutputStream"%>
<%@page import="com.sits.fms.file_inward_movement.FileInwardMovementManager"%>
<%@ include file="../myCks.jsp"%>
<%@ page import="java.io.*" %>
<%
try{
	File directory=null;
	String ZipName = General.checknull(ReadProps.getkeyValue("download_file_path", "filemovement"));
	System.out.println("ZipName :"+ZipName);
	String directoryName = General.checknull(ReadProps.getkeyValue("cuk_fms_file_path", "filemovement"));
	System.out.println("directoryName :"+directoryName);
	directory  			 = new File(ZipName);
	
	ZipOutputStream zos = new ZipOutputStream(new FileOutputStream(ZipName));
	
	FileInwardMovementManager.deleteDirectory(directory);	 
	System.out.println("Folder Delete Successfully");
	FileInwardMovementManager.zipdirectory(directoryName, zos); 
	System.out.println("Folder ZIP Successfully");
	
	zos.close(); 
	
	FileInputStream inStream = new FileInputStream(directory);

	// obtains ServletContext
	ServletContext context = getServletContext();

	// gets MIME type of the file
	String mimeType = context.getMimeType(ZipName);
	if (mimeType == null) {        
   		// set to binary type if MIME mapping not found
   		mimeType = "application/octet-stream";
	}
	
	// modifies response
	response.setContentType(mimeType);
	response.setContentLength((int) directory.length());

	// forces download
	response.setHeader("Content-Disposition","attachment; filename=\"FMS.zip");

	// obtains response's output stream
	OutputStream outStream = response.getOutputStream();
	byte[] buffer1 = new byte[5120000];
	int bytesRead = -1;
	while ((bytesRead = inStream.read(buffer1)) != -1){
   		outStream.write(buffer1, 0, bytesRead);
	}
	inStream.close();
	outStream.close(); 
	response.setContentType("application/zip");
	System.out.println("ZIP Download Successfully");
	response.flushBuffer();
	out.clear(); // where out is a JspWriter
	out = pageContext.pushBody();  
}catch (Exception e) {
	System.out.println("file_inward_backup.jsp :"+e);
}    
%>