package com.cafeprojF.www;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

public class CafememberInfoDAO extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	/*
	 * private final String sId = "root"; private final String sPw = "1234"; private
	 * final String url = "jdbc:mysql://localhost:3306/nicedb?serverTimezone=UTC";
	 * private final String driver = "com.mysql.cj.jdbc.Driver";
	 */
	
	private static CafememberInfoDAO  cmiDAO = new CafememberInfoDAO();
	private String Connecion_pool_resourse_name="jdbc/nicedb";
	private final String Table_name = "CafememberInfo";
	private DataSource dataSource;
	
    public CafememberInfoDAO() {    	
        try {
        	Context context = new InitialContext();
        	dataSource = (DataSource)context.lookup("java:comp/env/"
        				+Connecion_pool_resourse_name);
        }
        catch(NamingException e) {
        	System.out.println("멤버 DAO : 드라이버 로드 실패");
        	e.printStackTrace();
        }        
    }
    public static CafememberInfoDAO getBoardDAO(){
    	return cmiDAO;
    }
	public ArrayList<CafememberInfoDTO> selectBoard(){
		ArrayList<CafememberInfoDTO> list = new ArrayList<>();
		String query = "select * from "+Table_name;			
			try 
				(
					Connection conn = dataSource.getConnection();
					PreparedStatement pstmt = conn.prepareStatement(query);
					ResultSet rs = pstmt.executeQuery();
				)			
			{
				System.out.println("멤버DAO select : 커넥션 객체 생성 성공");
				
				while(rs.next()) {
					CafememberInfoDTO cmiDTO = new CafememberInfoDTO();
					cmiDTO.setId(rs.getString("id"));				
					cmiDTO.setPw(rs.getString("pw"));
					cmiDTO.setNickname(rs.getString("nickname"));
					cmiDTO.setHobby(rs.getString("hobby"));
					cmiDTO.setRegDate(rs.getString("regDate"));
					cmiDTO.setLastComeDate(rs.getString("lastComeDate"));
					cmiDTO.setAcntFindQuestion(rs.getString("acntFindQuestion"));
					cmiDTO.setAnctFindAnswer(rs.getString("acntFindAnswer"));
					cmiDTO.setIsStaff(rs.getInt("isStaff"));				
					list.add(cmiDTO);
				}
			
			} catch (SQLException e) {
				e.printStackTrace();
			}
			return list;
	}
	
	//내 정보 보기
	public CafememberInfoDTO selectBoard(String id){
			
		if( id!=null )
		{		
			String query = "select * from cafememberInfo where id='"+id+"'";
			CafememberInfoDTO cmiDTO = new CafememberInfoDTO();
		try 
		(
				Connection conn = dataSource.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(query);
				ResultSet rs = pstmt.executeQuery();
				)			
		{
			System.out.println("멤버DAO select info : 커넥션 객체 생성 성공");			
			while(rs.next()) {
							
				System.out.println("멤버DAO select : 정보 불러오기1");
				cmiDTO.setNickname(rs.getString("nickname"));
				cmiDTO.setHobby(rs.getString("hobby"));
				cmiDTO.setRegDate(rs.getString("regDate"));
				cmiDTO.setLastComeDate(rs.getString("lastComeDate"));
				cmiDTO.setAcntFindQuestion(rs.getString("acntFindQuestion"));
				cmiDTO.setAnctFindAnswer(rs.getString("acntFindAnswer"));
				String is = rs.getString("isStaff");
				cmiDTO.setVisitCnt(rs.getInt("visitCnt"));
				//'none', 'manager', 'submanager', 'event', 'table', 'design'
				if(is.equals("none")) {
					cmiDTO.setIsStaff(1);
				}
				else if(is.equals("manager")) {
					cmiDTO.setIsStaff(2);
				}
				else if(is.equals("submanager")) {
					cmiDTO.setIsStaff(4);
				}
				else if(is.equals("event")) {
					cmiDTO.setIsStaff(8);
				}
				else if(is.equals("table")) {
					cmiDTO.setIsStaff(16);
				}
				else if(is.equals("design")) {
					cmiDTO.setIsStaff(32);
				}				
				System.out.println("멤버DAO select info: 정보 불러오기2");				
			}
			return cmiDTO;
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
		return null;
}

	//Pwchk 0, Cafe_logInOK 1, postModify 2, postDel 3 
	public CafememberInfoDTO selectLog(String inId, String inPw, int on){
		String query = "select * from "+Table_name;
		CafememberInfoDTO cmiDTO = new CafememberInfoDTO();
		boolean result = false;
		
		try 
			(
				Connection conn = dataSource.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(query);
				ResultSet rs = pstmt.executeQuery();
			)			
		{
			System.out.println("inId:"+inId);
			System.out.println("inPw:"+inPw);
			System.out.println("멤버DAO select login: 커넥션 객체 생성 성공");
			//비밀번호 확인 - 정보 수정 모드
			if(on==0)
			{
				while(rs.next()) {				
					cmiDTO.setId(rs.getString("id"));
					cmiDTO.setPw(rs.getString("pw"));
					
					if( (cmiDTO.getId().equals(inId))&& (cmiDTO.getPw().equals(inPw)) ) {					
						result=true;					
						System.out.println("멤버DAO select chkPw : 일치하는 회원 정보 확인, "+result);
						
						cmiDTO.setNickname(rs.getString("nickname"));
						cmiDTO.setHobby(rs.getString("hobby"));
						cmiDTO.setAcntFindQuestion(rs.getString("acntFindQuestion"));
						cmiDTO.setAnctFindAnswer(rs.getString("acntFindAnswer"));									

						return cmiDTO;
					}
				}
			}
			//로그인 정보 확인
			else if(on==1)
			{
				System.out.println("select pw mode 1");
				while(rs.next()) {				
					cmiDTO.setId(rs.getString("id"));
					cmiDTO.setPw(rs.getString("pw"));
					cmiDTO.setNickname(rs.getString("nickname"));					
					cmiDTO.setLastComeDate(rs.getString("lastComeDate"));
					cmiDTO.setAcntFindQuestion(rs.getString("acntFindQuestion"));
					cmiDTO.setVisitCnt(rs.getInt("visitCnt"));
					String priv = rs.getString("isStaff");
					int chkPriv=0;  //기본 값
					
					if( (cmiDTO.getId().equals(inId))&& (cmiDTO.getPw().equals(inPw)) ) {
						
						result=true;
						String tempId = cmiDTO.getId();
						System.out.println("멤버DAO select login : 일치하는 회원 정보 확인, "+result);
						
						if(priv.equals("none")){
							chkPriv=1;  //일반 회원
						}
						else {
							chkPriv=2;	//스태프
						}
						cmiDTO.setIsStaff(chkPriv);				
						
						//방문일 업데이트					
						query = "update CafememberInfo set lastComeDate=current_timestamp where id='"+tempId+"'";
						int up = 0;
							
						up = pstmt.executeUpdate(query);
						if(up!=0)
							System.out.println("cmiDAO영역 : 방문일 업데이트");
						
						//방문 수 업데이트
						
						int cnt = cmiDTO.getVisitCnt();
						cnt +=1;
						query = "update CafememberInfo set visitCnt='"+cnt+"' where id='"+tempId+"'";
						up = 0;
						up = pstmt.executeUpdate(query);
						if(up!=0)
							System.out.println("cmiDAO영역 : 방문횟수 업데이트");
						
						return cmiDTO;
					}				
				}
				return null;
			}			
			//게시글 수정
			else if(on==2) {
				
				System.out.println("select pw mode 2");
				while(rs.next()) {				
					cmiDTO.setId(rs.getString("id"));
					cmiDTO.setPw(rs.getString("pw"));
					if( (cmiDTO.getId().equals(inId))&& (cmiDTO.getPw().equals(inPw)) ) {					
						result=true;					
						System.out.println("멤버DAO select chkPw : 일치하는 회원 정보 확인, "+result);
						return cmiDTO;
					}					
				}				
					cmiDTO.setVisitCnt(-1);
					return cmiDTO;
			}
			//게시글 삭제(일반)
			else if(on==3) {
				boolean flag = false;
				System.out.println("select pw mode 3");
				while(rs.next()) {				
					cmiDTO.setId(rs.getString("id"));
					cmiDTO.setPw(rs.getString("pw"));
					
					if( (cmiDTO.getId().equals(inId))&& (cmiDTO.getPw().equals(inPw)) ) {					
						result=true;					
						System.out.println("멤버DAO select chkPw : 일치하는 회원 정보 확인, "+result);
						flag = true;
						
							if(flag) {
								cmiDTO.setId("checkOK");
								return cmiDTO; 
							}
							else
								return null; //빈 박스
						}
					}
				}				
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println("멤버DAO select : 일치하는 회원 정보 없음, "+result);
		return cmiDTO;		
	}
	
	//계정 찾기용 정보 대조 메소드 mode=1이면 아이디 찾기, mode=2이면 비밀번호 찾기
	public String selectLog(String ques, String ans, String nName, String id, String mode){
		String query = "select * from cafememberInfo";
		/* CafememberInfoDTO cmiDTO = new CafememberInfoDTO(); */
		boolean result = false;
		System.out.println("selectLog : input question:"+ques);
		System.out.println("selectLog : input answer:"+ans);
		System.out.println("selectLog : input nName:"+nName);
		System.out.println("selectLog : input id:"+id);
		System.out.println("selectLog : input mode:"+mode);
		
		System.out.println("멤버 DAO : 계정 찾기 메소드 작동");
		try 
			(
				Connection conn = dataSource.getConnection();
				PreparedStatement pstmt = conn.prepareStatement(query);
				ResultSet rs = pstmt.executeQuery();
			)		
			{
			if(mode.equals("1"))
			{
				while(rs.next())
				{
					String qusData = rs.getString("acntFindQuestion");
					String ansData = rs.getString("acntFindAnswer");
					String nData = rs.getString("nickname");
						
					System.out.println("selectLog : data Question:"+qusData);
					System.out.println("selectLog : data Answer:"+ansData);
					System.out.println("selectLog : data Nickname:"+nData);
					System.out.println("=================next===========");
					
					if((qusData.equals(ques))&&(ansData.equals(ans))&&(nData.equals(nName)) )
					{
						System.out.println("멤버 DAO select : 일치하는 계정 확인");
						return rs.getString("id");
					}
				}
			}
			else if(mode.equals("2"))
			{
				while(rs.next())
				{
					String idData = rs.getString("id");
					String qusData = rs.getString("acntFindQuestion");
					String ansData = rs.getString("acntFindAnswer");
					
					if( (idData.equals(id))&&(qusData.equals(ques))&& (ansData.equals(ans)) )
					{
						System.out.println("멤버 DAO select : 일치하는 계정 확인");
						return rs.getString("pw");
					}
				}
			}			
			
	} catch (SQLException e) {
		e.printStackTrace();
	}
	System.out.println("멤버DAO select : 일치하는 회원 정보 없음, "+result);
	return null;
}	
	//회원가입 정보 등록
    public int insertInfo(CafememberInfoDTO cmiDTO) {
    	String query = "select id, nickname from cafememberinfo";
    	    	
    	
    	String regQuery = "insert into cafememberinfo(id, pw, nickname,"+
    			"hobby, acntFindQuestion, acntFindAnswer, isStaff) value(?,?,?,?,?,?,?)";
    	int result=0;
    	try 
		(
			Connection conn = dataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(query);
    		PreparedStatement regPstmt = conn.prepareStatement(regQuery);
			ResultSet rs = pstmt.executeQuery();)
		{    		
    		while(rs.next())
    		{
    			String dataId = rs.getString("id");
    			String dataNickname = rs.getString("nickname");
    			
    			// 이후 ajax로 구현할 것.
    			if( dataId.equals(cmiDTO.getId()))
    			{
    				System.out.println("중복된 아이디가 존재합니다.");
    				return -1;
    			}
    			if(dataNickname.equals(cmiDTO.getNickname()))
    			{
    				System.out.println("중복된 별명이 존재합니다.");
    				return -2;
    			}
    		}
    		
    		System.out.println("멤버DAO : DB 입력 메소드");
    		regPstmt.setString(1, cmiDTO.getId());
    		regPstmt.setString(2, cmiDTO.getPw());
    		regPstmt.setString(3, cmiDTO.getNickname());
    		regPstmt.setString(4, cmiDTO.getHobby());
    		regPstmt.setString(5, cmiDTO.getAcntFindQuestion());
    		regPstmt.setString(6, cmiDTO.getAnctFindAnswer());
    		regPstmt.setInt(7, cmiDTO.getIsStaff());    		
    		result = regPstmt.executeUpdate();
    		System.out.println("멤버DAO : DB 입력 메소드2 execute : "+result);
    		
		}
    	catch (SQLException e) {
    		e.printStackTrace();
		}
		return result;    	
    }
    //회원 정보 수정
    public String updateInfo(String id, String nickname, String hobby, String qus, String ans) {
    	String query = "update cafeMemberInfo set nickname='"+nickname+"', hobby='"
    					+hobby+"', acntFindQuestion='"+qus+"', acntFindAnswer='"+ans+"' "
    					+"where id='"+id+"'";
    	int result = -1;
    	try {
    		Connection conn = dataSource.getConnection();
    		PreparedStatement pstmt = conn.prepareStatement(query);
    		result = pstmt.executeUpdate();
    		if(result != -1) {
    			System.out.println("멤버 DAO : 정보 업데이트 성공");
    			return nickname;
    		}
    		else
    			System.out.println("멤버 DAO : 정보 업데이트 실패");
    	}
    	catch(SQLException e){
    		e.printStackTrace();
    	}
    	
    	return nickname;
    }
    
    //카페 메인에 정보 전달(회원 수 세기 / 매니저 별명 가져오기)
    public String sendDataToMain() {
    	String query = "select count(*) from cafememberinfo where id is not null"
    			+ " and not pw='null'";
    	boolean result=false;
    	String count=null;
    	
    	try 
		(
			Connection conn = dataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(query);
    		ResultSet rs = pstmt.executeQuery();)    		
		{			
    		
    		if(rs !=null)
    		{
    			while(rs.next())
    			{
    				count=rs.getString("count(*)")+",";
    				System.out.println("멤버 DAO init: 회원 수 세기");
    			}
    			
    			query = "select nickname from cafeMemberInfo where isStaff='manager'";
    			try(ResultSet rs2=pstmt.executeQuery(query);)
    			{
    				while(rs2.next())
    				{
    					count +=rs2.getString("nickname");
    					System.out.println("멤버 DAO init: 매니저 별명 가져오기");
    					result=true;
    				}
    			}    			
    		}
    		else {
    			System.out.println("멤버 DAO init: 가져올 데이터가 없습니다.");
    		}
    		if(result)
    			return count;  		
    		
		} catch (SQLException e) {
			e.printStackTrace();
		}    	
    	
    	return "-1";
    }
    public int checkInputIdAndPW(String id, String pw) {
    	int result = 0;
    	String dataId = "";
    	String dataPw = "";
    	
    	String query = "select id, pw from "+Table_name
    			+" where id='"+id+"'"
    			+" and pw='"+pw+"'";
    	try(Connection conn = dataSource.getConnection();
    		PreparedStatement pstmt = conn.prepareStatement(query);
    		ResultSet rs = pstmt.executeQuery(query);)
    	{
    		while(rs.next()) {
    			dataId = rs.getString("id");
    			dataPw = rs.getString("pw");
    		}
    		if( (dataId.equals(id)) && (dataPw.equals(pw)) ) {    			
    			result = 1;
    			return result;
    		}
    		else {
    			result = -1;
    			return result;
    		}
    	}
    	catch(SQLException e) {
    		e.printStackTrace();
    	}
    	return result;
    }
    public int deleteMember(String id) {
    	int result = 0;
    	int ran = (int) (Math.random()*10000)+1;
    	String query = "update "+Table_name+
    			" set pw='null',"
    			+" nickname='null"+ran+"',"
    			+" hobby='del'," 			
    			+" acntFindQuestion='del',"
    			+" acntFindAnswer='del',"
    			+" profile_image='del',"
    			+" isStaff='none',"
    			+" visitCnt='-1'"
    			+" where id='"+id+"'";
    	try(Connection conn = dataSource.getConnection();
    		PreparedStatement pstmt = conn.prepareStatement(query))
    	{    		
    		result = pstmt.executeUpdate();
    		if(result!=0) {
    			System.out.println("quitMemberData update ok");
    			System.out.println("quitMemberData update:"+result);
    			return 5;
    		}
    		else {
    			System.out.println("quitMemberData update failed");
    			return -1;
    		}
    	}
    	catch(SQLException e) {
    		e.printStackTrace();
    	}
    	return result;
    }
}
