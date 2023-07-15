<%@page import="com.cafeprojF.www.CafememberInfoDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%!		
	public String loadInfo(){
	CafememberInfoDAO cimDAO = new CafememberInfoDAO();
		String data = cimDAO.sendDataToMain();
	System.out.println(data);
	if(data==null)
	{
		data="abc";
	}
	return data;
}
%>
<c:set var="aId" value="${sessionScope.id }"/>
<c:set var="aNickname" value="${sessionScope.nickname }"/>
<c:set var="isStaff" value="${sessionScope.priv }" />
<c:set var="data" value="${c.loadInfo()}" />
<c:choose>
	<c:when test="${empty isStaff}">
		<c:set var="isStaff" value="${0}"/>
	</c:when>
	<c:when test="${isStaff eq 1 }">
		<c:set var="isStaff" value="${1}"/>
	</c:when>
</c:choose>


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>cafe_proj_cafeMain</title>
    <link rel="stylesheet" type=text/css href="cafe_pro_cafeMain.css">
    <link href="https://fonts.googleapis.com/css2?family=Alkatra&display=swap" rel="stylesheet">
</head>
<body>
    <div class="top">
        <div id="music_player">
            <audio src="audio_src/Kalimba.mp3" controls></audio>
            <!-- ����� �÷��̾� -->
           </div>
            <div id="gnl">
                <!-- ��� ���� �޴� ���� -->
                <ul>
                    <li id="goToCafeHome"><a href="cafe_proj_cafeMain.jsp">ī�� Ȩ</a> </li>
                    <li id="goToMainSite"><a href="#">���� ���� ����Ʈ</a> </li>               
                </ul>
            </div>
    </div>
    <header>
        <!-- �� ���κ� -->
       
        <div id="title">
            <!-- �ΰ� Ÿ��Ʋ-->
            <!-- ������ ���� Ȩ���� �̵� -->
            <div id="title_text"> All Animals World</div>
            <a href="cafe_proj_cafeMain.jsp" id="logo" title="home"></a>
            
        </div>
    </header>
    <nav>
        <!-- ���� �κ� �޴� ���� -->
        <div class="cafe_mainMenu">
            <!--ī�� ������ & ī�� ���� & ȸ������ & �۾���  -->
            <div class="cafe_profile">                
                <!-- ī�� ������ ���� -->
                <div id="cafeName">ī�� �̸�: All Animals Worlds</div> 
                <!-- ī�� ��� �̹��� -->
                <!-- ������ ���� ��� ��ü ī�� ��� ȭ�� ǥ�� -->
                <div id="curCafeGrade">ī�� ���</div>
                <!-- ȸ�� ��� �̹��� -->
                <!-- ������ ���� ��� ��ü ȸ�� ��� ȭ�� ǥ�� -->
                <div id="managersName">�Ŵ��� �̸� 
                	<c:out value="${data}" />
                	${c.loadInfo() }
                </div>
                <!-- ���ʿ� ��� ������ �̹��� -->
                <div id="countMembers">ȸ�� �� n(��)</div>
                <!-- ���� ������ �̹��� -->
<c:choose>
	<c:when test="${isStaff eq none }">
		<a href="cafe_pro_cafeAdmin.html" id="admin_Cafe">ī�� ���� </a> 
	</c:when>
</c:choose>
               

                <!-- ī�� ��ǥ �̹��� ���� ��� -->
                <!-- ī�� ������ ���� ��� -->
                <!-- ī�� Ȱ��, ȸ����, �Խ��Ǻ� Ȱ�� ���� ȭ�� -->
                <!-- �Խ��� �߰� ���� ���� �� ���� ��� -->
                <!-- ȸ�� ��� ���� ��� / ���� ���� ���� ���  -->
                <!-- ī�� ������ ���� ���(���ø� ���� ��� ����) -->
                <!-- ī�� ���̾ƿ� ����-->
                <a href="cafe_pro_cafeChatting.html" id="CafeChat">ī�� ä�� </a>
                <!-- ä�ù� ����(���� & ���� & �ο� �� ����)-->
                <a href="cafe_pro_InviteToCafe.html" id="InviteToCafe">ī�� �ʴ�</a> 
            </div>
                <ul>
<c:choose>
	<c:when test="${empty aId}">
					<li>
                    	<a href="cafe_pro_logIn.html" id="logIn">�α���</a>
                    </li>                                    	
                    <li>
                        <a href="cafe_pro_joinToCafe.html" id=joinToCafe>ȸ�� ����</a>
                    </li>
	</c:when>
	<c:when test="${not empty aId }">
					<li>
						${aNickname}�� ȯ���մϴ�.
					</li>
					<br>
					<li>
						<a href="cafe_logOut" id="logOut">�α׾ƿ�</a>
					</li>
					<li>
						<a href="cafe_pro_infoEdit.jsp" id="infoEdit">ȸ�� ���� ����</a>
					</li>
	</c:when>
</c:choose>      
                </ul>                
                <!-- �� �̹��� -->
                <div><a href="cafe_pro_newPosting.html" id="newPosting">ī�� �۾���</a> </div>
                <!-- �Խñ� ���̾ƿ� ���� ��� �ʿ�(���ø� ���� ��� ����) -->           
            </div>       
        <div class="table_menu">
            <!-- �Խ��� �޴� ���� -->           
            <!-- �Խ��� �׷� ���� ���� ��� �ʿ� -->
            <!-- ���� �� �ֱ� �ʿ� -->
            <!-- ���� �Խ���, ���� �Խ���, �Խ��� ���� ���� ��� -->
            <div id="showAllPost"><a href="cafe_pro_showAllPost.html">��ü �� ����</a>   </div>
            <ul id="opearateMenu"> <c:out value="� �޴�"/>
                <li id="notice_boardSet" ><a href="cafe_pro_noticeTable.html"> ���� �Խ��� </a><br></li>
                <li id="report_boardSet"> <a href="cafe_pro_reportTable.html">�Ű� �Խ���</a> <br></li>                    
                <li id="warning_boardSet"><a href="cafe_pro_warningTable.html">��� �Խ���</a> <br></li>
            </ul>
            <ul id="active_boardMenu"> <c:out value="�Խ��� �޴�"/>
                <li id="normal_boardSet"><a href="cafe_pro_normalTable.html">�Ϲ� �Խ���</a> <br></li>
                <li id="video_boardSet"> <a href="cafe_pro_videoTable.html">���� �Խ���</a> <br></li>
                <li id="vote_boardSet"> <a href="cafe_pro_voteTable.html">��ǥ �Խ���</a>  <br></li>
                <li id="memo_boardSet"> <a href="cafe_pro_memoTable.html">�޸� �Խ���</a> <br></li>
                    <!-- �� ��� ���� ��� -->
            </ul>               
                <!-- �Խ��� �߰� ����� �ڹٽ�ũ��Ʈ �Լ��� �����ϱ� -->            
        </div>        
        <aside>
            <div style="text-align: center;">(wiget place)</div> 
            <!-- �߰� �޴� Ȥ�� ���� ����(���̾ƿ� ���� ������� ���� ����) -->
            <!-- �ð� ���� -->
            <!-- �湮�� ���� ���� -->
            <!-- �ֱ� �Խñ� ��� -->
            visitor / calender / clock / etc..
            <div id="search">
                �˻� <input type="text" placeholder="�˻��� ������ �Է��ϼ���">
            </div>
        </aside>
        <div>
            <button id="QuitToCafe" onclick="quitToCafe_member()">ī�� Ż��</button>
        </div>
    </nav>
    <section class="main_sect">
        <!-- ���� ������ ���� -->
        <!-- Ȩ ���̾ƿ� ���� ��� �ʿ� -->
        <div id="table_notice"> <ul> <c:out value="���� ���"></c:out>
                                    <li> title 1</li>
                                    <li> title 2</li>
                                    <li> title 3</li>
                                </ul> 
            </div> 
        <div id="table_spotlight"> <ul> <c:out value="�α� �� ���"></c:out>
                                        <li> title 1</li>
                                        <li> title 2</li>
                                        <li> title 3</li>            
                                   </ul> 
            </div>
        <div id="table_event">   <ul> <c:out value="�̺�Ʈ �� ���"></c:out>
                                        <li> title 1</li>
                                        <li> title 2</li>
                                        <li> title 3</li>
                                 </ul> 
            </div>
        <div id="table_tempCategory1"> <ul><c:out value="�Խ��� ī�װ��� 1"></c:out>
                                            <li> title 1</li>
                                            <li> title 2</li>
                                            <li> title 3</li>   
                                       </ul> 
            </div>        
    </section>
    
    <div style="clear:left"></div>
    
    <!-- <footer> -->
        <!-- ī�Ƕ���Ʈ. ī�� �ּ� ��. -->
        <!-- copyrights jm -->
    <!-- </footer> -->

    <script src="cafe_pro_cafeMain.js"></script>
</body>
</html>