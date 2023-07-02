<%@page import="com.cafeprojF.www.CafememberInfoDAO"%>
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
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>cafe_proj_cafeMain</title>
    <link rel="stylesheet" type=text/css href="./css/cafe_pro_cafeMain.css?after">
	<script src="./js/jquery-3.6.4.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link href="https://fonts.googleapis.com/css2?family=Alkatra&display=swap" rel="stylesheet">
</head>
<body>
<script>
	
</script>
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
                <div id="cafeName">All Animal World</div> 
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
    <section class="main_sect">
        <!-- ���� ������ ���� -->
        <!-- Ȩ ���̾ƿ� ���� ��� �ʿ� -->
        <div id="table_notice"> <ul id="table_notice_ul"> 
        							<li id="table_notice_head"> <b><c:out value="[���� �Խ���]" /></b></li>	        					     
		        					     	<c:if test="${not empty tableList }">
		        					     						     <!-- and (dto.writer ne 'del') -->
		        					     		<c:set var="count" value="${0 }"></c:set>
		        					   			<c:set var="loopSwitch" value="false"/>
		        					   				<c:forEach var="dto" items="${tableList }" varStatus="status">
		        					   					<c:if test="${not loopSwitch }">
							        						<c:if test="${count==1 }">
							        							<c:set var="loopSwitch" value="true" />
							        						</c:if>
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
								        						<c:choose>																					        						
									        						<c:when test="${(dto.subTableTag eq '����') and (dto.writer ne 'del') and ( (dto.isNoticeThisOrAll eq 1) or (dto.isNoticeThisOrAll eq 3)) }">								        							
									        							<c:set var="count" value="${count+1}"/>									        							
									        							 	<li id="tableNotice">
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
																					</c:when>
																				</c:choose>	
									        							 		<a href="view.do?no=${dto.contentNo }"> [${dto.extraTag }] ${dto.writer } || ${ dto.title} (${comCount }) <br> ��ȸ�� ${dto.readCnt}</a>
									        							 	</li>
									        						</c:when> 
									        					</c:choose>
								        					</c:if>
		        					   				</c:forEach>
		        					   		</c:if>		
		        					   		<c:if test="${not empty tableList }"> 
		        				   					<c:set var="count" value="${0 }"></c:set>
		        				   					<c:set var="loopSwitch" value="false"/>      					     	  	
							        					<c:forEach var="dto" items="${tableList }" varStatus="status">
							        						<c:if test="${not loopSwitch }">
							        						<c:if test="${count==1 }">
							        							<c:set var="loopSwitch" value="true" />
							        						</c:if>
							        						<c:choose>
																<c:when test="${not empty boxList }">											
																		<c:set var="comCount" value="0"/>										
																		<c:forEach var="boxdto" items="${boxList }">
																			<c:if test="${dto.contentNo eq boxdto.tableNo }">
																				<c:set var="comCount" value="${comCount+1}"/>
																			</c:if>																							
																		</c:forEach>
																		
																</c:when>
																	<c:otherwise>
																		<c:set var="comCount" value="0"/>
																	</c:otherwise>
															</c:choose>
								        						<c:choose>																					        						
									        						<c:when test="${(dto.subTableTag eq '����') and (dto.writer ne 'del') }">								        							
									        							<c:set var="count" value="${count+1}"/>
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
																			</c:when>
																		</c:choose>
									        							 	<li>
																				<c:choose>
																					<c:when test="${dto.subNum gt 0 }">
																						<c:forEach begin="1" end="${dto.subNum}">-</c:forEach>
																							<c:if test="${dto.indentNum gt 0 }">
																								<c:forEach begin="1" end="${dto.indentNum}">&</c:forEach>
																							</c:if>
																					</c:when>
																				</c:choose>								        							
									        							 		<a href="view.do?no=${dto.contentNo }">  [${dto.extraTag }] ${ dto.title} (${comCount }) <br> ��ȸ�� ${dto.readCnt}</a>
									        							 	</li>
									        						</c:when> 
									        					</c:choose>
								        					</c:if>
								        				</c:forEach>
		        					     	</c:if>					
                                </ul> 
            </div> 
        <div id="table_basic"> <ul id="table_basic_ul"> 
        							<li id="table_basic_head"><b> <c:out value="[�Ϲ� �Խ���]" /></b></li>
                                        <c:if test="${not empty tableList }">
		        		
		        					     						     <!-- and (dto.writer ne 'del') -->
		        					     		<c:set var="count" value="${0 }"></c:set>
		        					   			<c:set var="loopSwitch" value="false"/>			        					     	  	
							        					<c:forEach var="dto" items="${tableList }" varStatus="status">
							        						<c:if test="${not loopSwitch }">
								        						<c:if test="${count==5 }">
								        							<c:set var="loopSwitch" value="true" />
								        						</c:if>
								        						<!-- <script>function c(){console.log("======contentNo:"+${dto.contentNo}+"=======")} c() </script> -->
								        						<c:choose>
																	<c:when test="${not empty boxList }">											
																			<c:set var="comCount" value="0"/>										
																			<c:forEach var="boxdto" items="${boxList}">
																			<!-- <script>function c(){console.log("======tableNo:"+${boxdto.tableNo}+"=======")} c() </script> -->
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
								        						<c:choose>																					        						
									        						<c:when test="${(dto.subTableTag eq '�Ϲ�') }">
									        							<c:set var="count" value="${count+1}"/>
									        							 	<li>
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
																					</c:when>
																				</c:choose>									        							
										        							 	<a href="view.do?no=${dto.contentNo }">  [${dto.extraTag }] ${ dto.title} (${comCount }) <br> ��ȸ�� ${dto.readCnt}</a>
									        							 	</li>
									        						</c:when> 
									        					</c:choose>
								        					</c:if>
								        				</c:forEach>
		        					     	</c:if>			            
                                   </ul> 
            </div>
       <%--  <div id="table_video">   <ul> <c:out value="���� �Խ���"></c:out>
                                        <li> title 1</li>
                                        <li> title 2</li>
                                        <li> title 3</li>
                                 </ul> 
            </div>
        <div id="table_tempCategory1"> <ul><c:out value="�α� ��"></c:out>
                                            <li> title 1</li>
                                            <li> title 2</li>
                                            <li> title 3</li>   
                                       </ul> 
            </div>       --%>  
    </section>
    
    <div style="clear:left"></div>
    
    <!-- <footer> -->
        <!-- ī�Ƕ���Ʈ. ī�� �ּ� ��. -->
        <!-- copyrights jm -->
    <!-- </footer> -->

    <script src="./js/cafe_pro_cafeMain.js" charset="utf-8"></script>
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
    		/* alert("���̺� ������ ������ ����"); */
    		location.href="showKindList.jsp";
    	}    	
    
    	function quitToCafe_member(){
    	  	let input=confirm("������ Ż���Ͻðڽ��ϱ�?");
    	  	if(input){
    			  let pwInput = prompt("����Ͻô� ���̵�[${id}]�� ���̿��� �Ұ����մϴ�. "
    					  	+"��й�ȣ�� �Է��ϼ���.");
    			  if(pwInput){    				  
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
    			error: function(){
    				alert("Ȯ�� ������ ���� ����");
    			}
    			
    		})
    	}
    </script>
</body>
</html>