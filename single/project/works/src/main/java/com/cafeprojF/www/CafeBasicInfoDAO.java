package com.cafeprojF.www;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Scanner;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.sql.DataSource;

public class CafeBasicInfoDAO extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	private static CafeBasicInfoDAO  cbiDAO = new CafeBasicInfoDAO();
	private String Connecion_pool_resourse_name="jdbc/nicedb";
	private final String Table_name = "CafeBasicInfo";
	private DataSource dataSource;
	
    public CafeBasicInfoDAO() {
    	  try {
          	Context context = new InitialContext();
          	dataSource = (DataSource)context.lookup("java:comp/env/"
          				+Connecion_pool_resourse_name);
          }
    	  catch(NamingException e) {
          	System.out.println("카페 정보 DAO : 드라이버 로드 실패");
          	e.printStackTrace();
          }      
    }
    
    public static CafeBasicInfoDAO getBoardDAO() {
    	return cbiDAO;
    }
    
    public ArrayList<CafeBasicInfoDTO> selectBoard(){
    	String query = "select * from CafeBasicInfo order by desc";
		ArrayList<CafeBasicInfoDTO> list = new ArrayList<>();
  
	    try 
		(
			Connection conn = dataSource.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
		)			
		{
	    	System.out.println("카페 정보 DAO select : 커넥션 객체 생성 성공");
	    	
	    		CafeBasicInfoDTO cbiDTO = new CafeBasicInfoDTO();
	    		cbiDTO.getManagersNickname();
	    		// cbiDTO.getCafeAddress();
	    		// cbiDTO.getCafeName();
	    		// cbiDTO.isCafeOpen();
	    		// cbiDTO.isConfirmSignMember();
	    		// cbiDTO.getCafeIntroduce();
	    		// cbiDTO.isOpenMemberListInfo();
	    		// cbiDTO.getCafeTheme();
	    		// cbiDTO.getCafeArea();
	    		// cbiDTO.getCafeWordForSearch();
	    		// cbiDTO.getEditCafeInfoDate(); 	    		
	    		
	    		list.add(cbiDTO);
	    	
		}
	    catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
    }
   
}
