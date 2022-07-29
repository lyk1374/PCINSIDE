<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="com.pcinside.dto.*" %>
<%@ page import="com.pcinside.dao.*" %>
<!DOCTYPE html>
<html>
<head>
<%
	PCDao pcDao = new PCDao();
%>
<meta charset="UTF-8">
<title>피시인사이드</title>
</head>
<body>
	
	<%
		MultipartRequest mr = new MultipartRequest(request, "C:/Users/lyk13/Desktop/DEV/JDK 8/workspace/PCINSIDE_FINAL/WebContent/PCImage", 1024*1024*1024, "utf-8", new DefaultFileRenamePolicy());
		System.out.println("저장되는 경로(실제 서버) : "+"C:/Users/lyk13/Desktop/DEV/JDK 8/workspace/PCINSIDE_FINAL/WebContent/PCImage");
		
		String fileName = mr.getFilesystemName("image");
		System.out.println("사진 이름 : "+fileName);
	%>
	<%
		String cpuMaker = mr.getParameter("cpuMaker");
		String cpuType = mr.getParameter("cpuType");
		String cpuGen = mr.getParameter("cpuGen");
		String cpuName = mr.getParameter("cpuName");
		String motherBoardMaker = mr.getParameter("motherBoardMaker");
		String motherBoardName = mr.getParameter("motherBoardName");
		String graphicChipset = mr.getParameter("graphicChipset");
		String graphicName = mr.getParameter("graphicName");
		String ramMaker = mr.getParameter("ramMaker");
		String ramGen = mr.getParameter("ramGen");
		String ramVol = mr.getParameter("ramVol");
		String ssdMaker = mr.getParameter("ssdMaker");
		String ssdVol = mr.getParameter("ssdVol");
		String hddMaker = mr.getParameter("hddMaker");
		String hddVol = mr.getParameter("hddVol");
		String powerMaker = mr.getParameter("powerMaker");
		String powerCap = mr.getParameter("powerCap");
		String smoking = mr.getParameter("smoking");
		String mining = mr.getParameter("mining");
		int opinion1 = Integer.parseInt(mr.getParameter("opinion1"));
		int opinion2 = Integer.parseInt(mr.getParameter("opinion2"));
		int opinion3 = Integer.parseInt(mr.getParameter("opinion3"));
		int price = Integer.parseInt(mr.getParameter("price"));
		int baseBranch = Integer.parseInt(mr.getParameter("baseBranch"));
		PCDto pcDto = new PCDto(mining, smoking, opinion1, opinion2, opinion3, price, cpuMaker, cpuType, cpuGen, cpuName, motherBoardMaker, motherBoardName, graphicChipset, graphicName, ramMaker, ramGen, ramVol, ssdMaker, ssdVol, hddMaker, hddVol, powerMaker, powerCap, baseBranch);
		pcDao.uploadPC(pcDto);
	%>
	<script>
		alert("업로드 되었습니다!");
		location.href="AdminPage.jsp";
	</script>
</body>
</html>