<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%		
	String mCnt = (String)session.getAttribute("mCnt");
	String adminName = (String)session.getAttribute("adminName");
%>

<c:set var="aId" value="${sessionScope.id }"/>
<c:set var="aNickname" value="${sessionScope.nickname }"/>
<c:set var="chName" value="${sessionScope.cNickname }" />
<c:set var="isStaff" value="${priv }" />
<c:choose>
	<c:when test="${empty isStaff}">
		<c:set var="isStaff" value="0"/>
	</c:when>
	<c:when test="${isStaff eq 1 }">
		<c:set var="isStaff" value="${no}"/>
	</c:when>
	<c:when test="${isStaff eq 2 }">
		<c:set var="isStaff" value="staff"/>
	</c:when>	
</c:choose>




<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>lookMyInfo</title>
</head>
<script src="./js/jquery-3.6.4.js"></script>
<script src="./js/cafe_pro_lookMyInfo.js"></script>
<link rel="stylesheet" type="text/css" href="./css/cafe_pro_lookMyInfo.css" />
<c:set var="myPriv" value="${sessionScope.myPriv }"/>
<c:choose>
	<c:when test="${myPriv eq 1}" >
		<c:set var="myPrivName" value="����"/>
	</c:when>
	<c:when test="${myPriv eq 2 }">
		<c:set var="myPrivName" value="�Ŵ���"/>
 	</c:when>
 	<c:when test="${myPriv eq 4 }">
		<c:set var="myPrivName" value="�θŴ���"/>
 	</c:when>
 	<c:when test="${myPriv eq 8 }">
		<c:set var="myPrivName" value="�̺�Ʈ ����"/>
 	</c:when>
 	<c:when test="${myPriv eq 16 }">
		<c:set var="myPrivName" value="�Խ��� ����"/>
 	</c:when>
 	<c:when test="${myPriv eq 32 }">
		<c:set var="myPrivName" value="������ ����"/>
 	</c:when>
</c:choose>
<body>
<div class="top">
        <div id="music_player">
            <audio src="audio_src/Kalimba.mp3" controls></audio>
            <!-- ����� �÷��̾� -->
        </div>
            <div id="gnl">
                <!-- ��� ���� �޴� ���� -->
                <ul>
                    <li id="goToCafeHome"><a href="startMain.jsp">ī�� Ȩ</a> </li>
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
            <a href="startMain.jsp" id="logo" title="home"></a>
            
        </div>
    </header>
    <nav>
        <!-- ���� �κ� �޴� ���� -->
        <div class="cafe_mainMenu">
            <!--ī�� ������ & ī�� ���� & ȸ������ & �۾���  -->
            <div class="cafe_profile">                
                <!-- ī�� ������ ���� -->
                <div id="cafeName">All Animals World</div> 
                <!-- ī�� ��� �̹��� -->
                <!-- ������ ���� ��� ��ü ī�� ��� ȭ�� ǥ�� -->
                <div id="curCafeGrade">ī�� ���</div>
                <!-- ȸ�� ��� �̹��� -->
                <!-- ������ ���� ��� ��ü ȸ�� ��� ȭ�� ǥ�� -->
                <div id="managersName">�Ŵ��� : ${adminName}</div>
                <!-- ���ʿ� ��� ������ �̹��� -->
                <div id="countMembers">ȸ�� �� : ${mCnt}��</div>
                <!-- ���� ������ �̹��� -->
<c:choose>
	<c:when test="${isStaff eq 'staff' }">
		<a href="cafe_pro_cafeAdmin.html" id="admin_Cafe">ī�� ���� </a> 
	</c:when>	
	<c:otherwise>
		<a href="cafe_pro_cafeAdmin.html" id="admin_Cafe"> </a> 
	</c:otherwise>
</c:choose>
             
                <!-- ī�� ��ǥ �̹��� ���� ��� -->
                <!-- ī�� ������ ���� ��� -->
                <!-- ī�� Ȱ��, ȸ����, �Խ��Ǻ� Ȱ�� ���� ȭ�� -->
                <!-- �Խ��� �߰� ���� ���� �� ���� ��� -->
                <!-- ȸ�� ��� ���� ��� / ���� ���� ���� ���  -->
                <!-- ī�� ������ ���� ���(���ø� ���� ��� ����) -->
                <!-- ī�� ���̾ƿ� ����-->
               <!--  <a href="cafe_pro_cafeChatting.html" id="CafeChat">ī�� ä�� </a>
                ä�ù� ����(���� & ���� & �ο� �� ����)
                <a href="cafe_pro_InviteToCafe.html" id="InviteToCafe">ī�� �ʴ�</a> -->
                <div id="profile_menubar">
                	
                </div>
            </div>
                <ul class="memberMenu">
<c:choose>
	<c:when test="${empty aId}">
					<li>
                    	<a href="cafe_pro_logIn.html" id="logIn">�α���</a>
                    </li>                                    	
                    <li>
                        <a href="cafe_pro_joinToCafe.html" id=joinToCafe>ȸ�� ����</a>
                    </li>
	</c:when>
	<c:when test="${not empty chName}" >
	<li id="markNickname" style="text-align:center">
						${chName}�� ȯ���մϴ�.
					</li><br>					
					<li>
						<a href="cafe_logOut" id="logOut">�α׾ƿ�</a>
					</li>
					<li>
						<a href="cafe_pro_PWPass_info.jsp?mode=editInfo" id="infoEdit">ȸ�� ���� ����</a>
					</li>
					
					
	</c:when>
	<c:when test="${not empty aId || empty chName }">
					<li id="markNickname" style="text-align:center">
						${aNickname}�� ȯ���մϴ�.
					</li><br>					
					<li>
						<a href="cafe_logOut" id="logOut">�α׾ƿ�</a>
					</li>
					<li>
						<a href="cafe_pro_PWPass_info.jsp?mode=editInfo" id="infoEdit">ȸ�� ���� ����</a>
					</li>
					<br>					
					<li>
						<a href="myInfoOK" id="myInfo">�� ���� ����</a>
					</li>
	</c:when>
	
</c:choose>      
                </ul>                                
                <!-- �� �̹��� -->
<c:choose>
	<c:when test="${not empty aId}">
		<div id="newPostBox"><a href="cafe_pro_newPosting.jsp" id="newPosting">ī�� �� ����</a> </div>
	</c:when>
	<c:when test="${empty aId}">
		<!-- <div><a href="cafe_pro_newPosting.jsp" id="newPosting"></a> </div> -->
	</c:when>
	
</c:choose>
               <!--  <div><a href="cafe_pro_newPosting.jsp" id="newPosting">ī�� �۾���</a> </div> -->
                <!-- �Խñ� ���̾ƿ� ���� ��� �ʿ�(���ø� ���� ��� ����) -->                            
            </div>       
        <div class="table_menu">
            <!-- �Խ��� �޴� ���� -->           
            <!-- �Խ��� �׷� ���� ���� ��� �ʿ� -->
            <!-- ���� �� �ֱ� �ʿ� -->
            <!-- ���� �Խ���, ���� �Խ���, �Խ��� ���� ���� ��� -->
            <div id="showAllPost"><a href="showList.do">��ü �� ����</a></div>
            <div id='table_menubar'></div>
            <ul id="opearateMenu"> <c:out value="� �޴�"/>
                <li id="notice_boardSet" value="����" class="tableMenuBtn"> ���� �Խ��� <br></li>
                <li id="report_boardSet" value="�Ű�" class="tableMenuBtn"> �Ű� �Խ��� <br></li>                    
                <li id="warning_boardSet" value="���" class="tableMenuBtn">��� �Խ��� <br></li>
            </ul>
            <ul id="active_boardMenu"> <c:out value="�Խ��� �޴�"/>
                <li id="normal_boardSet" value="�Ϲ�" class="tableMenuBtn" >�Ϲ� �Խ���<br></li>                
                <li id="memo_boardSet" value="�޸�"class="tableMenuBtn"> �޸� �Խ���<br></li>
                    <!-- �� ��� ���� ��� -->
            </ul>               
                <!-- �Խ��� �߰� ����� �ڹٽ�ũ��Ʈ �Լ��� �����ϱ� -->            
        </div>        
      <!--   <aside>
            <div style="text-align: center;">(wiget place)</div> 
            �߰� �޴� Ȥ�� ���� ����(���̾ƿ� ���� ������� ���� ����)
            �ð� ����
            �湮�� ���� ����
            �ֱ� �Խñ� ���
            visitor / calender / clock / etc..
            <form action="searchData">
            	<div class="search">
                	�˻� <input type="text" placeholder="�˻��� ������ �Է��ϼ���">
            		<input type="submit" value="�˻�" id="searchBtn" />
            	</div>
            </form>
        </aside> -->
        
        <div>
        	 <c:choose>
        		<c:when test="${not empty aId}">
		            <button id="QuitToCafe">ī�� Ż��</button>		            
        		</c:when>
				<c:when test="${empty aId }">
					<button id="QuitToCafe" style="display:none">ī�� Ż��</button>
				</c:when>
        	 </c:choose>
        	 		
        </div>
    </nav>

	<section class="lookMyInfoWindow">
		<section class="lookMyInfoTableWindow">
			<table id="lookMyInfoTable">
				<caption>�� ����</caption>
				<tr>
					<td>����</td><td>${sessionScope.myNickname }</td>
				</tr>
				<tr>
					<td>���</td><td>${sessionScope.myHobby }</td>
				</tr>
				<tr>
					<td>ī�� ������</td><td>${sessionScope.myRegDate }</td>
				</tr>
				<tr>
					<td>�ֱ� �湮��</td><td>${sessionScope.myComeDate }</td>
				</tr>
				<tr>
					<td>���� ã�� ����</td><td>${sessionScope.myQues }</td>
				</tr>
				<tr>
					<td>���� ã�� ����</td><td>${sessionScope.myAns }</td>
				</tr>
				<tr>
					<td>���� ����</td><td>${myPrivName }</td>
				</tr>
				<tr>
					<td>�湮 Ƚ��</td><td>${sessionScope.myVisitCnt }</td>
				</tr>				
				<tr>
					<td colspan="2" id="lastTd">
						<a href="startMain.jsp"><input type="button" value="��������" /></a>
						<a href="cafe_pro_PWPass_info.jsp?mode=editInfo"><input type="button" value="���� ����" /></a>
					</td>
				</tr>
				
					
			</table>
		</section>
	</section>
	<script>

    $("#QuitToCafe").on("click", quitToCafe_member);

    function eventRegTableMenuBtn(){
    	let btns = document.querySelectorAll(".tableMenuBtn"); 
    	for(let i=0; i<btns.length; i++){
    		btns[i].addEventListener("click",function(){
    		    	let kind = btns[i].getAttributeNode("value").value;
    				moveKindTable(kind);
    		});
    		
    	}    	
	}
	window.onload=eventRegTableMenuBtn;
    
    	function moveKindTable(kind){
    		$.ajax({
    			url:"showList.do",
    			type:"get",
    			async:"false",
    			data:{
    				subTableKind:kind,
    			},
    			dataType:"text",
    			success:moveKindTableSendData,
    			error:function(){
    				alert("������ ������ ����");
    			}
    		})
    	}
    	function moveKindTableSendData(){
    		alert("���̺� ������ ������ ����");
    		location.href="showKindList.jsp";
    	}    	
    	function quitToCafe_member(){
    	  	let input=confirm("������ Ż���Ͻðڽ��ϱ�?");
    	  	if(input){
    			  let pwInput = prompt("����Ͻô� ���̵�[${id}]�� ���̿��� �Ұ����մϴ�. "
    					  	+"��й�ȣ�� �Է��ϼ���.");
    			  if(pwInput){
    				  alert(pwInput);
    				  quitToCheckPassword(pwInput);
    			  }
    			  else{
    				  alert("Ż�� ���");
    			  }
    		  }
    	  	else{
    	  		
    	  	}
    	}
    	function quitToCheckPassword(pwInput){
    		$.ajax({
    			url:"checkPWQuit.do",
    			type:"post",
    			async:false,
    			data:{    				
    				pwInput:pwInput,
    			},
    			dataType:"text",
    			success: quitToCheckPasswordSendData,
    			error: function(){
    				alert("Ȯ�� ������ ���� ����");
    			}
    			
    		})
    	}
    	function quitToCheckPasswordSendData(){
    		alert("��й�ȣ üũ Ȯ��");
    		
    		if(${ispwOK == "yes"}){
    			alert("Ż��Ǿ����ϴ�.");
    			location.href="startMain.jsp";
    		}
    		if(${ispwOK == "no"}){
    			alert('��ġ�ϴ� ������ �����ϴ�.');
    		}
    		<!-- location.href="startMain.jsp"; -->
    	}
   
    	
    </script>
</body>
</html>