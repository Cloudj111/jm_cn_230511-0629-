<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
	String mod = request.getParameter("mode");
	session.setAttribute("mode", mod);
%>

<%
	String mCnt = (String)session.getAttribute("mCnt");
	String adminName = (String)session.getAttribute("adminName");
	
	String mode1 = request.getParameter("mode");
	session.setAttribute("mode", mode1);
	System.out.println(session.getAttribute("mode"));
%>

<c:set var="aId" value="${sessionScope.id }"/>
<c:set var="aNickname" value="${sessionScope.nickname }"/>
<c:set var="chName" value="${sessionScope.cNickname }" />
<c:set var="isStaff" value="${priv }" />
<c:choose>
	<c:when test="${empty groupNo }">
		<c:set var="groupNo" value="${0}" scope="session" />
	</c:when>
	<c:when test="${empty subNo }">
		<c:set var="subNo" value="${0}" scope="session" />
	</c:when>
	<c:when test="${empty indentNo }">
		<c:set var="indentNo" value="${0}" scope="session" />
	</c:when>
</c:choose>
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
<title>passwordcheck</title>
<script src="./js/jquery-3.6.4.js"></script>
<script src="./js/cafe_pro_PWPass_info.js"></script>
</head>
<link rel="stylesheet" type="text/css" href="./css/PWPass_info.css" />
<body>
<div class="top">
        <div id="music_player">
            <audio src="audio_src/Kalimba.mp3" controls></audio>
            <!-- 오디오 플레이어 -->
           </div>
            <div id="gnl">
                <!-- 상단 통합 메뉴 공간 -->
                <ul>
                    <li id="goToCafeHome"><a href="startMain.jsp">카페 홈</a> </li>
                    <li id="goToMainSite"><a href="#">메인 포털 사이트</a> </li>               
                </ul>
            </div>
    </div>
    <header>
        <!-- 맨 윗부분 -->
       
        <div id="title">
            <!-- 로고 타이틀-->
            <!-- 누르면 메인 홈으로 이동 -->
            <div id="title_text"> All Animals World</div>
            <a href="cafe_proj_cafeMain.jsp" id="logo" title="home"></a>
            
        </div>
    </header>
    <nav>
        <!-- 왼쪽 부분 메뉴 공간 -->
        <div class="cafe_mainMenu">
            <!--카페 프로필 & 카페 관리 & 회원가입 & 글쓰기  -->
            <div class="cafe_profile">                
                <!-- 카페 프로필 공간 -->
                <div id="cafeName">All Animals World</div> 
                <!-- 카페 등급 이미지 -->
                <!-- 누르면 현재 등급 전체 카페 등급 화면 표시 -->
                <div id="curCafeGrade">카페 등급</div>
                <!-- 회원 등급 이미지 -->
                <!-- 누르면 현재 등급 전체 회원 등급 화면 표시 -->
                <div id="managersName">매니저 : ${adminName}</div>
                <!-- 왼쪽에 사람 아이콘 이미지 -->
                <div id="countMembers">회원 수 : ${mCnt}명</div>
                <!-- 설정 아이콘 이미지 -->
<c:choose>
	<c:when test="${isStaff eq 'staff' }">
		<a href="cafe_pro_cafeAdmin.html" id="admin_Cafe">카페 관리 </a> 
	</c:when>	
	<c:otherwise>
		<a href="cafe_pro_cafeAdmin.html" id="admin_Cafe"> </a> 
	</c:otherwise>
</c:choose>
               

                <!-- 카페 대표 이미지 설정 기능 -->
                <!-- 카페 도메인 변경 기능 -->
                <!-- 카페 활동, 회원별, 게시판별 활동 추이 화면 -->
                <!-- 게시판 추가 삭제 수정 등 편집 기능 -->
                <!-- 회원 등급 조정 기능 / 스탭 권한 편집 기능  -->
                <!-- 카페 디자인 편집 기능(템플릿 저장 기능 포함) -->
                <!-- 카페 레이아웃 편집-->
                <!-- <a href="cafe_pro_cafeChatting.html" id="CafeChat">카페 채팅 </a>
                채팅방 설정(개설 & 편집 & 인원 수 설정)
                <a href="cafe_pro_InviteToCafe.html" id="InviteToCafe">카페 초대</a>  -->
            	<div id="profile_menubar">
            </div>
                <ul class="memberMenu">
<c:choose>
	<c:when test="${empty aId}">
					<li>
                    	<a href="cafe_pro_logIn.html" id="logIn">로그인</a>
                    </li>                                    	
                    <li>
                        <a href="cafe_pro_joinToCafe.html" id=joinToCafe>회원 가입</a>
                    </li>
	</c:when>
	<c:when test="${not empty chName}" >
	<li id="markNickname" style="text-align:center">
						${chName}님 환영합니다.
					</li><br>					
					<li>
						<a href="cafe_logOut" id="logOut">로그아웃</a>
					</li>
					<li>
						<a href="cafe_pro_PWPass_info.jsp?mode=editInfo" id="infoEdit">회원 정보 수정</a>
					</li>
					<li>
						<a href="myInfoOK" id="myInfo">내 정보 보기</a>
					</li>
					
	</c:when>
	<c:when test="${not empty aId || empty chName }">
					<li id="markNickname" style="text-align:center">
						${aNickname}님 환영합니다.
					</li><br>					
					<li>
						<a href="cafe_logOut" id="logOut">로그아웃</a>
					</li>
					<li>
						<a href="cafe_pro_PWPass_info.jsp?mode=editInfo" id="infoEdit">회원 정보 수정</a>
					</li>
					<br>					
					<li>
						<a href="myInfoOK" id="myInfo">내 정보 보기</a>
					</li>
	</c:when>
	
</c:choose>      
                </ul>                                
                <!-- 펜 이미지 -->
<c:choose>
	<c:when test="${not empty aId}">
		<div><a href="cafe_pro_newPosting.jsp" id="newPosting">카페 글쓰기</a> </div>
	</c:when>
	<c:when test="${empty aId}">
		<div><a href="cafe_pro_newPosting.jsp" id="newPosting"></a> </div>
	</c:when>
	
</c:choose>
               <!--  <div><a href="cafe_pro_newPosting.jsp" id="newPosting">카페 글쓰기</a> </div> -->
                <!-- 게시글 레이아웃 편집 기능 필요(템플릿 저장 기능 포함) -->                            
            </div>       
        <div class="table_menu">
            <!-- 게시판 메뉴 공간 -->           
            <!-- 게시판 그룹 접기 열기 기능 필요 -->
            <!-- 구분 선 넣기 필요 -->
            <!-- 상위 게시판, 하위 게시판, 게시판 순서 편집 기능 -->
            <div id="showAllPost"><a href="showList.do">전체 글 보기</a>   </div>
            <div id='table_menubar'></div>
            <ul id="opearateMenu">
            	<li id="opearateMenu_head"><c:out value="운영 메뉴" /><br></li>
                <li id="notice_boardSet" value="공지" class="tableMenuBtn"><img src="./image_src/showAllPost/black-circle-g15db91f27_640.png" alt="#" id="listImg" />공지 게시판<br></li>
                <li id="report_boardSet" value="신고" class="tableMenuBtn"><img src="./image_src/showAllPost/black-circle-g15db91f27_640.png" alt="#" id="listImg" />신고 게시판<br></li>                    
                <li id="warning_boardSet" value="경고" class="tableMenuBtn"><img src="./image_src/showAllPost/black-circle-g15db91f27_640.png" alt="#" id="listImg" />경고 게시판<br></li>
            </ul>
            <ul id="active_boardMenu">
            	<li id="active_boardMenu_head"><c:out value="게시판 메뉴"/><br></li>
                <li id="normal_boardSet" value="일반" class="tableMenuBtn"><img src="./image_src/showAllPost/black-circle-g15db91f27_640.png" alt="#" id="listImg" />일반 게시판<br></li>
                <li id="memo_boardSet" value="메모" class="tableMenuBtn"><img src="./image_src/showAllPost/black-circle-g15db91f27_640.png" alt="#" id="listImg" />메모 게시판<br></li>
                    <!-- 글 양식 편집 기능 -->
            </ul>               
                <!-- 게시판 추가 기능은 자바스크립트 함수로 구현하기 -->            
        </div>        
        <!-- <aside>
            <div style="text-align: center;">(wiget place)</div> 
            추가 메뉴 혹은 위젯 공간(레이아웃 편집 기능으로 변경 가능)
            시계 위젯
            방문자 집계 위젯
            최근 게시글 목록
            visitor / calender / clock / etc..
            <form action="searchData">
            	<div class="search">
                	검색 <input type="text" placeholder="검색할 내용을 입력하세요">
            		<input type="submit" value="검색" id="searchBtn" />
            	</div>
            </form>
        </aside> -->
        <div>
	 		 <c:choose>
        		<c:when test="${not empty aId}">
		            <button id="QuitToCafe">카페 탈퇴</button>		            
        		</c:when>
				<c:when test="${empty aId }">
					<button id="QuitToCafe" style="display:none">카페 탈퇴</button>
				</c:when>
        	 </c:choose>
        </div>
    </nav>
    <section class="pwCheckBox">
	<form action="Pwchk?mode=${mode}" method="post" name="pwchkForm" accept-charset="utf-8">
		<table id="passwordCheckTable">
			<caption id="pwCheckBox_caption">비밀번호 확인</caption>
			<tr>
				<td id="pwCheckInputBox">
					비밀번호: &nbsp; &nbsp;<input type="password" required name="pw" />
				</td>
			</tr>
			<tr>
				<td colspan="2" id="pwCheckRemortBox">
					<input type="submit" value="확인" />
					&nbsp;<a href="startMain.jsp"><input type="button" value="돌아가기" /></a>
				</td>			
			</tr>					
		</table>
	</form>
	</section>
	<script>
	function eventRegQuitBtn(){
		let btn = document.querySelector("#QuitToCafe");
		btn.addEventListener("click", quitToCafe_member);
	}
	$("#QuitToCafe").on("click", quitToCafe_member);

	window.onload=eventRegQuitBtn;
	
	function quitToCafe_member(){
 	  	let input=confirm("정말로 탈퇴하시겠습니까?");
 	  	if(input){
 			  let pwInput = prompt("사용하시던 아이디[${id}]는 재이용이 불가능합니다. "
 					  	+"비밀번호를 입력하세요.");
 			  if(pwInput){
 				  alert(pwInput);
 				  quitToCheckPassword(pwInput);
 			  }
 			  else{
 				  alert("탈퇴 취소");
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
 				alert("확인 데이터 전송 실패");
 			}
 			
 		})
 	}
 	function quitToCheckPasswordSendData(){
 		alert("비밀번호 체크 확인");
 		
 		if(${ispwOK == "yes"}){
 			alert("탈퇴되었습니다.");
 			location.href="startMain.jsp";
 		}
 		if(${ispwOK == "no"}){
 			alert('일치하는 정보가 없습니다.');
 		}
 		<!-- location.href="startMain.jsp"; -->
 	}
	    	function moveKindTable(kind){
	    		let a = kind;
	    		$.ajax({
	    			url:"showList.do",
	    			type:"get",
	    			async:"false",
	    			data:{
	    				subTableKind:a,
	    			},
	    			dataType:"text",
	    			success:moveKindTableSendData,
	    			error:function(){
	    				alert("데이터 보내기 실패");
	    			}
	    		})
	    	}
	    	function moveKindTableSendData(){
	    		/* alert("테이블 데이터 보내기 성공"); */
	    		location.href="showKindList.jsp";
	    	}
	   	
	
		function eventRegTableMenuBtn(){
			let btns = document.querySelectorAll(".tableMenuBtn");
			for(let i=0; i<btns.length; i++){
				btns[i].addEventListener("click", function(){
					let kind = btns[i].getAttributeNode("value").value;
					moveKindTable(kind);
				})
			}
		}
		window.onload=eventRegTableMenuBtn;
	</script>
</body>
</html>