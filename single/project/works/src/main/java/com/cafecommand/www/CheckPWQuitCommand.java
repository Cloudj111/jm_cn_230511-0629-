package com.cafecommand.www;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.cafeprojF.www.CafememberInfoDAO;

public class CheckPWQuitCommand implements Command{

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("utf-8");
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		
		HttpSession session = request.getSession();
		CafememberInfoDAO infodao = CafememberInfoDAO.getBoardDAO();
		
		session.removeAttribute("ispwOK");
		String idInput = (String)session.getAttribute("id");
		String pwInput = (String)request.getParameter("pwInput");
		
		if((idInput!=null) && !(idInput.equals("")) ) {
			if( (pwInput!=null) && !(pwInput.equals("")) ) {
				int checkResult = 0;
				checkResult = infodao.checkInputIdAndPW(idInput, pwInput);
				if(checkResult == 1) {
					int quitResult = 0;
					quitResult = infodao.deleteMember(idInput);
					if(quitResult==5) {
						session.removeAttribute("id");									
						/* session.setAttribute("ispwOK", "yes"); */
						PrintWriter out = response.getWriter();
						out.println("<script language='javascript'>alert('탈퇴되었습니다.');</script>");
						out.println("<script>location.href='startMain.jsp'</script>)");
						
					}
					else {
						/* session.setAttribute("ispwOK", "no"); */
						PrintWriter out = response.getWriter();
						out.println("<script language='javascript'>alert('일치하는 정보가 없습니다.')</script>");
						
					}
				}
				else {
					PrintWriter out = response.getWriter();
					
					System.out.println("checkInfoQuit: 일치하는 정보가 없습니다.");
					System.out.println("out:"+out);					
					
					out.println("<script>alert('일치하는 정보가 없습니다.');</script>");
				
					
					/* session.setAttribute("ispwOK", "no"); */
					
				}
			}
			else {
				PrintWriter out = response.getWriter();
				out.println("<script language='javascript'>alert('비밀번호를 입력해주세요.');</script>");
				
				
			}
		}
		else {
			System.out.println("빈 아이디 입력 불가.");	
			
		}
		
		
	}
	
	

}
