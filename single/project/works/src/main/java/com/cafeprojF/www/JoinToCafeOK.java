package com.cafeprojF.www;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/JoinToCafeOK")
public class JoinToCafeOK extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public JoinToCafeOK() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		CafememberInfoDTO cmiDTO = new CafememberInfoDTO();
		CafememberInfoDAO cmiDAO = new CafememberInfoDAO();
		
		String id = request.getParameter("id").trim();
		String pw = request.getParameter("pw").trim();
		String nickname = request.getParameter("nickname").trim();
		String hobby = request.getParameter("hobby").trim();		
		String question = request.getParameter("question").trim();
		String answer = request.getParameter("answer").trim();
		int isStaff = 1;
		
		System.out.println("id="+id);
		cmiDTO.setId(id);
		cmiDTO.setPw(pw);
		cmiDTO.setNickname(nickname);
		cmiDTO.setHobby(hobby);
		cmiDTO.setAcntFindQuestion(question);
		cmiDTO.setAnctFindAnswer(answer);
		cmiDTO.setIsStaff(isStaff);
		
		int result = 0;
		result = cmiDAO.insertInfo(cmiDTO);
		System.out.println("RegMem result:"+result);
		if(result > 0)
		{
			System.out.println("회원가입 : DB 저장 성공");
			response.setCharacterEncoding("utf-8");
			 response.setContentType("text/html;charset=utf-8");
			 PrintWriter out = response.getWriter();
			 out.println("<!doctype>");
			 out.println("<html>");
			 out.println("<head></head>");
			 out.println("<body>");
			 out.println("<script>alert('가입되었습니다!')</script>");
			 out.println("<script>location.href='cafe_pro_logIn.html'</script>");
			 out.println("</body>");
			 out.println("</html>");
			 
		}
		else if(result==-1)
		{
			response.setCharacterEncoding("utf-8");
			 response.setContentType("text/html;charset=utf-8");
			 PrintWriter out = response.getWriter();
			 out.println("<!doctype>");
			 out.println("<html>");
			 out.println("<head></head>");
			 out.println("<body>");
			 out.println("<script>alert('중복된 아이디가 존재합니다.')</script>");
			 out.println("<script>history.go(-1)</script>");
			 out.println("</body>");
			 out.println("</html>");
		}
		else if(result==-2)
		{
			response.setCharacterEncoding("utf-8");
			 response.setContentType("text/html;charset=utf-8");
			 PrintWriter out = response.getWriter();
			 out.println("<!doctype>");
			 out.println("<html>");
			 out.println("<head></head>");
			 out.println("<body>");
			 out.println("<script>alert('중복된 별명이 존재합니다.')</script>");
			 out.println("<script>history.go(-1)</script>");
			 out.println("</body>");
			 out.println("</html>");
		}
		
	}

}
