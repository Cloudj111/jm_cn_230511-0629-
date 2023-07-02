<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8"><meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>ShowPostList</title>
	<link rel="stylesheet" type=text/css href="./css/showKindList.css?after">
	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<style>
		a{
			text-decoration: none;
		}
	</style>
</head>
<body>
<script src="./js/showKindList.js" charset="utf-8"></script>
<script src="./js/jquery-3.6.4.js"></script>
<%		
	String mCnt = (String)session.getAttribute("mCnt");
	String adminName = (String)session.getAttribute("adminName");
			
	System.out.println("==========");
	System.out.println("listMain");
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
               <!--  <a href="cafe_pro_cafeChatting.html" id="CafeChat">카페 채팅 </a>
                채팅방 설정(개설 & 편집 & 인원 수 설정)
                <a href="cafe_pro_InviteToCafe.html" id="InviteToCafe">카페 초대</a>  -->
            	<div id="profile_menubar">
                	
                </div>
            
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
		<div id="newPostBox"><a href="cafe_pro_newPosting.jsp" id="newPosting">카페 글 쓰기</a> </div>
	</c:when>
	<c:when test="${empty aId}">
		<!-- <div><a href="cafe_pro_newPosting.jsp" id="newPosting"></a> </div> -->
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
            <ul id="opearateMenu"> <c:out value="운영 메뉴"/>		
                <li id="notice_boardSet" value="공지" class="tableMenuBtn">공지 게시판<br></li>
                <li id="report_boardSet" value="신고" class="tableMenuBtn">신고 게시판<br></li>                    
                <li id="warning_boardSet" value="경고" class="tableMenuBtn">경고 게시판 <br></li>
            </ul>
            <ul id="active_boardMenu"> <c:out value="게시판 메뉴"/>		
                <li id="normal_boardSet" value="일반" class="tableMenuBtn">일반 게시판 <br></li>                
                <li id="memo_boardSet" value="메모" class="tableMenuBtn">메모 게시판 <br></li>
                    <!-- 글 양식 편집 기능 -->
            </ul>              
                <!-- 게시판 추가 기능은 자바스크립트 함수로 구현하기 -->            
        </div>        
       <!--  <aside>
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
    
    
   <!--  <div style="clear:left"></div> -->
 	<section class="showAllPost_window">
       	<div class="showAllPost_tablePlace">              
			 <table id="showAllPostTable">
				<caption>[ ${subTableKind} 게시판 ] </caption>
					<tr>
						<td colspan="7" id="postLimitBox"> <c:out value="게시글 표시 수"/>												
							<select name="limitPostPrint" id="limitPostPrint">
							<c:choose>
								<c:when test="${limitPostPrint eq 10 }">
									<option value="10" selected> 10개 </option> 
								</c:when>
								<c:otherwise>
									<option value="10"> 10개 </option>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${limitPostPrint eq 15 }">
									<option value="15" selected> 15개 </option> 
								</c:when>
								<c:otherwise>
									<option value="15"> 15개 </option>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${limitPostPrint eq 20 }">
									<option value="20" selected> 20개 </option> 
								</c:when>
								<c:otherwise>
									<option value="20"> 20개 </option>
								</c:otherwise>
							</c:choose>								
							</select>
						</td>
					</tr>
					<tr>
						<td>번호</td>
						<td>게시판</td>
						<td>작성자</td>
						<td>제목</td>
						<td>작성일</td>
						<td>조회수</td>
						<td>공감</td>
					</tr>						
					
						<tr>
							<td colspan="7" id="tdNotice">[ 전체 공지 ]</td>
						</tr>
						<c:forEach var="dto" items="${allList }">
						<c:set var="comCount" value="0" scope="page"/>		
							<c:choose>
								<c:when test="${(dto.subTableTag eq '공지') and (dto.writer ne 'del') and (dto.isNoticeThisOrAll gt 1)}">
									<tr id="noticePost">
										<td>${ dto.contentNo}</td>
										<td>${ dto.subTableTag }</td>
										<td>${ dto.writer}</td>
										<c:choose>
										<c:when test="${not empty boxList }">											
												<c:set var="comCount" value="0"/>										
												<c:forEach var="boxdto" items="${boxList }">
													<c:if test="${dto.contentNo eq boxdto.tableNo }">
														<!-- <script>function b(){console.log("contentNo:"+${dto.contentNo}+"tableNo:"+${boxdto.tableNo})} b() </script> -->
														<c:set var="comCount" value="${comCount+1}"/>
													</c:if>																							
												</c:forEach>
												<!-- <script>function c(){console.log("======comCount:"+${comCount}+"=======")} c() </script> -->
										</c:when>
											<c:otherwise>
												<c:set var="comCount" value="0"/>
											</c:otherwise>
										</c:choose>
										
										<td id="noticePost_title">
											<c:choose>
													<c:when test="${dto.subNum gt 0 }">
														<c:forEach begin="1" end="${dto.subNum}">
															<img src="./image_src/showAllPost/app-g05cc8e105_640.png" alt="#" id="subImg" />
														</c:forEach>
															<c:if test="${dto.indentNum gt 0 }">
																<img src="./image_src/showAllPost/arrow-right-ga680cb928_640.png" alt="#" id="subImg" />
															</c:if>
													</c:when>
											</c:choose>	
										 	<a href="view.do?no=${dto.contentNo}"><b><b>[${dto.extraTag}] </b> ${ dto.title}</b> </a><b> (${comCount})</b>
										</td>
										<td>${ dto.writtenDate}</td>
										<td>${ dto.readCnt}</td>
										<c:set var="hitCount" value="0" scope="page" />	
										<c:if test="${dto.isHit eq 1}">
											<c:if test="${dto.hitList ne 'del' }">
												<c:set var="tempArray" value="${fn:split(dto.hitList,'/')}"/>
												<c:set var="hitNum" value="${fn:length(tempArray)}"/>
											</c:if>
										</c:if>
										<c:if test="${dto.isHit eq 0}">
											<c:set var="hitNum" value="0"/>
										</c:if>
										<c:if test="${dto.hitList eq null }">
											<c:set var="hitNum" value="0"/>
										</c:if>
										<td> ${hitNum } </td>				
									</tr>			
								</c:when>
							</c:choose> 		
						</c:forEach>						
						<tr>
							<td colspan="7">[ ${subTableKind} 게시판 ] </td>
						</tr>
						<c:set var="postCounter" value="0"/>						
						<c:set var="isPostPrint" value="false"/>
						<c:forEach var="dto" items="${list }" varStatus="status">
							<c:set var="postCounter" value="${postCounter+1}"/>								
								<c:if test="${not isPostPrint }">
									<c:if test="${postCounter eq limitPostPrint }">
										<c:set var="isPostPrint" value="true"/>
									</c:if>																	
							<c:choose>
								<c:when test="${(dto.subTableTag eq subTableKind )}">
									<c:set var="comCount" value="0" scope="page"/>									
									<c:choose>
										<c:when test="${dto.subTableTag ne null  }">
										<%-- 	<c:set var="blankLeftS" value="${10+(dto.subNum*10)}" />
											<c:set var="blankLeftI" value="${dto.indentNum*10 }" /> --%>
											<%-- <tr class="group${dto.groupNo}_sub${dto.subNum}_ind${dto.indentNum}"> --%>
																					
											<tr>
												<td>${ dto.contentNo}</td>
												<td>${ dto.subTableTag }</td>
												<td>${ dto.writer}</td>
												<c:choose>
													<c:when test="${not empty boxList }">											
														<c:set var="comCount" value="0"/>										
														<c:forEach var="boxdto" items="${boxList }">
															<c:if test="${dto.contentNo eq boxdto.tableNo }">
																<!-- <script>function b(){console.log("contentNo:"+${dto.contentNo}+"tableNo:"+${boxdto.tableNo}+" comCount:"+${comCount})} b() </script> -->
																<c:set var="comCount" value="${comCount+1}"/>
															</c:if>
														</c:forEach>
														<!-- <script>function c(){console.log("======comCount:"+${comCount}+"=======")} c() </script> -->
													</c:when>
													<c:otherwise>
														<c:set var="comCount" value="0"/>
													</c:otherwise>
												</c:choose>
												<td>					
													<c:choose>
														<c:when test="${dto.subNum gt 0 }">
															<c:forEach begin="1" end="${dto.subNum}">
																<img src="./image_src/showAllPost/app-g05cc8e105_640.png" alt="#" id="subImg" />
															</c:forEach>
																<c:if test="${dto.indentNum gt 0 }">
																	<c:forEach begin="1" end="${dto.indentNum}">															
																		<img src="./image_src/showAllPost/arrow-right-ga680cb928_640.png" alt="#" id="subImg" />
																	</c:forEach>
																</c:if>
															[${dto.extraTag }] <a href="view.do?no=${dto.contentNo}">${ dto.title} </a>(${comCount})
														</c:when>
														<c:otherwise>
															[${dto.extraTag }] <a href="view.do?no=${dto.contentNo}">${ dto.title} </a>(${comCount})
														</c:otherwise>
													</c:choose>
												</td>
													
												
												<td>${ dto.writtenDate}</td>
												<td>${ dto.readCnt}</td>
												
												
												<c:set var="hitCount" value="0" scope="page" />	
												<c:if test="${dto.isHit eq 1}">
													<c:if test="${not empty dto.hitList and dto.hitList ne 'del'}">
														<c:set var="tempArray" value="${fn:split(dto.hitList,'/')}"/>
														<c:set var="hitNum" value="${fn:length(tempArray)}"/>
														<!-- <script>function q(){console.log("content:"+${dto.contentNo}+"hitNum:"+${hitNum});} q();</script> -->											
													</c:if>
													<c:if test="${empty dto.hitList }">
														<c:set var="hitNum" value="0"/>
													</c:if>
												</c:if>
												<c:if test="${dto.isHit eq 0}">
													<c:set var="hitNum" value="0"/>
												</c:if>
												
												<td>${ hitNum}</td>
											</tr>
										</c:when>
										</c:choose>
							   		</c:when>	
						    	</c:choose>	
							</c:if>						
						</c:forEach>
					<tr>
						<fmt:parseNumber var="curPageListPos" value="${ (lastPageIdx/10)}" integerOnly="true" />							
							<c:set var="pageBtnCount" value="1" />													
								<td colspan="7">									
									<ul class="movePageBtnList">
										<c:choose>
											<c:when test="${curPagePos-10 lt 1}" >
												<li><img src="./image_src/showAllPost/appLeft-g6db7b7639_640.png" alt="#" id="SkipLeftBtn" class="Btn.1"/></li>
												<c:set var="skipLeftBtnValue" value="1"/>
											</c:when>
											<c:when test="${curPagePos-10 gt 10  }">
												<li><img src="./image_src/showAllPost/appLeft-g6db7b7639_640.png" alt="#" id="SkipLeftBtn" class="Btn.${curPagePos-10}"/></li>
												<c:set var="skipLeftBtnValue" value="${curPagePos-10}"/>
											</c:when>							
										</c:choose>
										<c:if test="${curPagePos+10 gt lastPageIdx }">								
										<c:forEach begin="1" end="${lastPageIdx }">
											<c:choose>												
												<c:when test="${(curPagePos%10) eq pageBtnCount }">
													<li><input type="button" value="${curPagePos}" id="movePageBtn" class="pageBtnCurrent"/></li>
													<c:set var="pageBtnCount" value="${pageBtnCount+1}"/>
												</c:when>
												<c:otherwise>
													<li><input type="button" value="${(curPageListPos*10)+pageBtnCount}" id="movePageBtn"/></li>
													<c:set var="pageBtnCount" value="${pageBtnCount+1}"/>
												</c:otherwise>
											</c:choose>				
										</c:forEach>
										</c:if>
										<c:if test="${curPagePos+10 lt lastPageIdx }">											
												<c:forEach begin="1" end="10">
													<c:choose>												
														<c:when test="${(curPagePos%10) eq pageBtnCount }">
															<li><input type="button" value="${curPagePos}" id="movePageBtn" class="pageBtnCurrent"/></li>
															<c:set var="pageBtnCount" value="${pageBtnCount+1}"/>
														</c:when>
														<c:otherwise>
															<li><input type="button" value="${(curPageListPos*10)+pageBtnCount}" id="movePageBtn"/></li>
															<c:set var="pageBtnCount" value="${pageBtnCount+1}"/>
														</c:otherwise>
													</c:choose>				
												</c:forEach>										
										</c:if>
										<c:choose>
											<c:when test="${curPagePos+9 gt lastPageIdx }">
												<li><img src="./image_src/showAllPost/appRight-g6db7b7639_640.png" alt="#" id="SkipRightBtn" class="Btn.${lastPageIdx}"/></li>
												<c:set var="skipRightBtnValue" value="${lastPageIdx}"/>
											</c:when>
											<c:when test="${curPagePos+9 lt lastPageIdx }">
												<li><img src="./image_src/showAllPost/appRight-g6db7b7639_640.png" alt="#" id="SkipRightBtn" class="Btn.${curPagePos+10}"/></li>
												<c:set var="skipRightBtnValue" value="${curPagePos+10}"/>												
											</c:when>
										</c:choose>										
									</ul>
								</td>
					</tr>						
      		 </table>         
       	</div>
       						<script>
								function afs1(){
									console.log("curListPos:"+${curPageListPos});
								}
								afs1();
							</script>	
    </section>
    <script>
		function callPagePos(){
			let pos = ${curPagePos}; 
			console.log("pos:"+pos); 
			let lpp = ${limitPostPrint};
			console.log("lpp:"+lpp);
		}
	 	function eventRegPageSkipLeftBtn(){
			let btn = document.querySelector("#SkipLeftBtn");			
			btn.addEventListener("click", function(){
				let posValue = btn.getAttributeNode('class');						
				movePageSLExcute(${skipLeftBtnValue});
			});
		}
	 	
		$("#SkipLeftBtn").on("click",eventRegPageSkipLeftBtn);
		 
		function eventRegPageSkipRightBtn(){
			let btn = document.querySelector("#SkipRightBtn");
			btn.addEventListener("click", function(){
				let posValue = btn.getAttributeNode('class');								
					movePageSRExcute(${skipRightBtnValue});
				});		
		} 
		
		$("#SkipRightBtn").on("click",eventRegPageSkipRightBtn);
		
		function movePageExcute(posValue){
			let posData = posValue;
			if(posData < 1){
				value=1;
			}
			else if(posData > ${lastPageIdx}){
				value=${lastPageIdx};
			}
			$.ajax({
				url:"showList.do",
				type: "get",
				async: false,
				data:{
					isChangeLimitPost:"noChange",
					isChangePage:"pageChange",
					curPagePos:posValue,
					limitPostPrint:${limitPostPrint},					
				},
				dataType: "text",
				success: movePageSendData,
				error: function(){
					alert("please check data");
				}
			})
		}
	
		function movePageSLExcute(){
			$.ajax({
				url:"showList.do",
				type: "get",
				async: false,
				data:{
					isChangeLimitPost:"noChange",
					isChangePage:"pageChange",
					curPagePos:${skipLeftBtnValue},
					limitPostPrint:${limitPostPrint},					
				},
				dataType: "text",
				success: movePageSendData,
				error: function(){
					alert("please check data");
				}
			})
		}
		function movePageSRExcute(){
			$.ajax({
				url:"showList.do",
				type: "get",
				async: false,
				data:{
					isChangeLimitPost:"noChange",
					isChangePage:"pageChange",
					curPagePos:${skipRightBtnValue},
					limitPostPrint:${limitPostPrint},					
				},
				dataType: "text",
				success: movePageSendData,
				error: function(){
					alert("please check data");
				}
			})
		}
		function movePageSendData(){
			/* alert("page send data success"); */
			if(${isReload == true}){
				window.location.reload();
			}
		}
		
		$("#limitPostPrint").on("change",eventRegPageLimit);		
		function changePageLimit(limitValue){			
			$.ajax({
				url:"showList.do",
				type: "get",
				async: false,
				data:{
					isChangeLimitPost:"change",
					isChangePage:"noChange",
					curPagePos:${curPagePos},
					limitPostPrint:limitValue,					
				},
				dataType: "text",
				success: changePageSendData,
				error: function(){
					alert("please check data");
				}
			})
		}
		function changePageSendData(){
		/* 	alert("page limit data send ok"); */
			if(${isReload == true}){
				window.location.reload();
			}
		}
		$("#QuitToCafe").on("click", quitToCafe_member);
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
		    			alert("일치하는 정보가 없습니다.");
		    		}
		    		<!-- location.href="startMain.jsp"; -->
		    	}
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
		    				alert("데이터 보내기 실패");
		    			}
		    		})
		    	}
		    	function moveKindTableSendData(){
		    	/* 	alert("테이블 데이터 보내기 성공"); */
				location.href="showKindList.jsp";
		    		
		    	}
		   

			function eventRegTableMenuBtn(){
				let btns = document.querySelectorAll(".tableMenuBtn");
				for(let i=0; i<btns.length; i++){
					btns[i].addEventListener("click",function(){
						let kind = btns[i].getAttributeNode("value").value;
						moveKindTable(kind);
					})
				}
			}
			window.onload=eventRegTableMenuBtn;
		
	</script>
	
  </body>
</html>


