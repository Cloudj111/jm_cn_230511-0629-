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
            <!-- 오디오 플레이어 -->
           </div>
            <div id="gnl">
                <!-- 상단 통합 메뉴 공간 -->
                <ul>
                    <li id="goToCafeHome"><a href="cafe_proj_cafeMain.jsp">카페 홈</a> </li>
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
                <div id="cafeName">카페 이름: All Animals Worlds</div> 
                <!-- 카페 등급 이미지 -->
                <!-- 누르면 현재 등급 전체 카페 등급 화면 표시 -->
                <div id="curCafeGrade">카페 등급</div>
                <!-- 회원 등급 이미지 -->
                <!-- 누르면 현재 등급 전체 회원 등급 화면 표시 -->
                <div id="managersName">매니저 이름 
                	<c:out value="${data}" />
                	${c.loadInfo() }
                </div>
                <!-- 왼쪽에 사람 아이콘 이미지 -->
                <div id="countMembers">회원 수 n(명)</div>
                <!-- 설정 아이콘 이미지 -->
<c:choose>
	<c:when test="${isStaff eq none }">
		<a href="cafe_pro_cafeAdmin.html" id="admin_Cafe">카페 관리 </a> 
	</c:when>
</c:choose>
               

                <!-- 카페 대표 이미지 설정 기능 -->
                <!-- 카페 도메인 변경 기능 -->
                <!-- 카페 활동, 회원별, 게시판별 활동 추이 화면 -->
                <!-- 게시판 추가 삭제 수정 등 편집 기능 -->
                <!-- 회원 등급 조정 기능 / 스탭 권한 편집 기능  -->
                <!-- 카페 디자인 편집 기능(템플릿 저장 기능 포함) -->
                <!-- 카페 레이아웃 편집-->
                <a href="cafe_pro_cafeChatting.html" id="CafeChat">카페 채팅 </a>
                <!-- 채팅방 설정(개설 & 편집 & 인원 수 설정)-->
                <a href="cafe_pro_InviteToCafe.html" id="InviteToCafe">카페 초대</a> 
            </div>
                <ul>
<c:choose>
	<c:when test="${empty aId}">
					<li>
                    	<a href="cafe_pro_logIn.html" id="logIn">로그인</a>
                    </li>                                    	
                    <li>
                        <a href="cafe_pro_joinToCafe.html" id=joinToCafe>회원 가입</a>
                    </li>
	</c:when>
	<c:when test="${not empty aId }">
					<li>
						${aNickname}님 환영합니다.
					</li>
					<br>
					<li>
						<a href="cafe_logOut" id="logOut">로그아웃</a>
					</li>
					<li>
						<a href="cafe_pro_infoEdit.jsp" id="infoEdit">회원 정보 수정</a>
					</li>
	</c:when>
</c:choose>      
                </ul>                
                <!-- 펜 이미지 -->
                <div><a href="cafe_pro_newPosting.html" id="newPosting">카페 글쓰기</a> </div>
                <!-- 게시글 레이아웃 편집 기능 필요(템플릿 저장 기능 포함) -->           
            </div>       
        <div class="table_menu">
            <!-- 게시판 메뉴 공간 -->           
            <!-- 게시판 그룹 접기 열기 기능 필요 -->
            <!-- 구분 선 넣기 필요 -->
            <!-- 상위 게시판, 하위 게시판, 게시판 순서 편집 기능 -->
            <div id="showAllPost"><a href="cafe_pro_showAllPost.html">전체 글 보기</a>   </div>
            <ul id="opearateMenu"> <c:out value="운영 메뉴"/>
                <li id="notice_boardSet" ><a href="cafe_pro_noticeTable.html"> 공지 게시판 </a><br></li>
                <li id="report_boardSet"> <a href="cafe_pro_reportTable.html">신고 게시판</a> <br></li>                    
                <li id="warning_boardSet"><a href="cafe_pro_warningTable.html">경고 게시판</a> <br></li>
            </ul>
            <ul id="active_boardMenu"> <c:out value="게시판 메뉴"/>
                <li id="normal_boardSet"><a href="cafe_pro_normalTable.html">일반 게시판</a> <br></li>
                <li id="video_boardSet"> <a href="cafe_pro_videoTable.html">영상 게시판</a> <br></li>
                <li id="vote_boardSet"> <a href="cafe_pro_voteTable.html">투표 게시판</a>  <br></li>
                <li id="memo_boardSet"> <a href="cafe_pro_memoTable.html">메모 게시판</a> <br></li>
                    <!-- 글 양식 편집 기능 -->
            </ul>               
                <!-- 게시판 추가 기능은 자바스크립트 함수로 구현하기 -->            
        </div>        
        <aside>
            <div style="text-align: center;">(wiget place)</div> 
            <!-- 추가 메뉴 혹은 위젯 공간(레이아웃 편집 기능으로 변경 가능) -->
            <!-- 시계 위젯 -->
            <!-- 방문자 집계 위젯 -->
            <!-- 최근 게시글 목록 -->
            visitor / calender / clock / etc..
            <div id="search">
                검색 <input type="text" placeholder="검색할 내용을 입력하세요">
            </div>
        </aside>
        <div>
            <button id="QuitToCafe" onclick="quitToCafe_member()">카페 탈퇴</button>
        </div>
    </nav>
    <section class="main_sect">
        <!-- 메인 컨텐츠 공간 -->
        <!-- 홈 레이아웃 편집 기능 필요 -->
        <div id="table_notice"> <ul> <c:out value="공지 목록"></c:out>
                                    <li> title 1</li>
                                    <li> title 2</li>
                                    <li> title 3</li>
                                </ul> 
            </div> 
        <div id="table_spotlight"> <ul> <c:out value="인기 글 목록"></c:out>
                                        <li> title 1</li>
                                        <li> title 2</li>
                                        <li> title 3</li>            
                                   </ul> 
            </div>
        <div id="table_event">   <ul> <c:out value="이벤트 글 목록"></c:out>
                                        <li> title 1</li>
                                        <li> title 2</li>
                                        <li> title 3</li>
                                 </ul> 
            </div>
        <div id="table_tempCategory1"> <ul><c:out value="게시판 카테고리 1"></c:out>
                                            <li> title 1</li>
                                            <li> title 2</li>
                                            <li> title 3</li>   
                                       </ul> 
            </div>        
    </section>
    
    <div style="clear:left"></div>
    
    <!-- <footer> -->
        <!-- 카피라이트. 카페 주소 등. -->
        <!-- copyrights jm -->
    <!-- </footer> -->

    <script src="cafe_pro_cafeMain.js"></script>
</body>
</html>