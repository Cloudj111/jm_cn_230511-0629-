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
                <a href="cafe_pro_InviteToCafe.html" id="InviteToCafe">ī�� �ʴ�</a>  -->
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
					<li>
						<a href="myInfoOK" id="myInfo">�� ���� ����</a>
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
            <div id="showAllPost"><a href="showList.do">��ü �� ����</a>   </div>
             <div id='table_menubar'></div>
            <ul id="opearateMenu"> <c:out value="� �޴�"/>		
                <li id="notice_boardSet" value="����" class="tableMenuBtn">���� �Խ���<br></li>
                <li id="report_boardSet" value="�Ű�" class="tableMenuBtn">�Ű� �Խ���<br></li>                    
                <li id="warning_boardSet" value="���" class="tableMenuBtn">��� �Խ��� <br></li>
            </ul>
            <ul id="active_boardMenu"> <c:out value="�Խ��� �޴�"/>		
                <li id="normal_boardSet" value="�Ϲ�" class="tableMenuBtn">�Ϲ� �Խ��� <br></li>                
                <li id="memo_boardSet" value="�޸�" class="tableMenuBtn">�޸� �Խ��� <br></li>
                    <!-- �� ��� ���� ��� -->
            </ul>              
                <!-- �Խ��� �߰� ����� �ڹٽ�ũ��Ʈ �Լ��� �����ϱ� -->            
        </div>        
       <!--  <aside>
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
    
    
   <!--  <div style="clear:left"></div> -->
 	<section class="showAllPost_window">
       	<div class="showAllPost_tablePlace">              
			 <table id="showAllPostTable">
				<caption>[ ${subTableKind} �Խ��� ] </caption>
					<tr>
						<td colspan="7" id="postLimitBox"> <c:out value="�Խñ� ǥ�� ��"/>												
							<select name="limitPostPrint" id="limitPostPrint">
							<c:choose>
								<c:when test="${limitPostPrint eq 10 }">
									<option value="10" selected> 10�� </option> 
								</c:when>
								<c:otherwise>
									<option value="10"> 10�� </option>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${limitPostPrint eq 15 }">
									<option value="15" selected> 15�� </option> 
								</c:when>
								<c:otherwise>
									<option value="15"> 15�� </option>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${limitPostPrint eq 20 }">
									<option value="20" selected> 20�� </option> 
								</c:when>
								<c:otherwise>
									<option value="20"> 20�� </option>
								</c:otherwise>
							</c:choose>								
							</select>
						</td>
					</tr>
					<tr>
						<td>��ȣ</td>
						<td>�Խ���</td>
						<td>�ۼ���</td>
						<td>����</td>
						<td>�ۼ���</td>
						<td>��ȸ��</td>
						<td>����</td>
					</tr>						
					
						<tr>
							<td colspan="7" id="tdNotice">[ ��ü ���� ]</td>
						</tr>
						<c:forEach var="dto" items="${allList }">
						<c:set var="comCount" value="0" scope="page"/>		
							<c:choose>
								<c:when test="${(dto.subTableTag eq '����') and (dto.writer ne 'del') and (dto.isNoticeThisOrAll gt 1)}">
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
							<td colspan="7">[ ${subTableKind} �Խ��� ] </td>
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
		    			alert("��ġ�ϴ� ������ �����ϴ�.");
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
		    				alert("������ ������ ����");
		    			}
		    		})
		    	}
		    	function moveKindTableSendData(){
		    	/* 	alert("���̺� ������ ������ ����"); */
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

