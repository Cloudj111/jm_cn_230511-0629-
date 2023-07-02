package com.cafeprojF.www;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.cafecommand.www.CheckPWQuitCommand;
import com.cafecommand.www.ClearCommand;
import com.cafecommand.www.Command;
import com.cafecommand.www.CommentCommand;
import com.cafecommand.www.DeleteCommand;
import com.cafecommand.www.DeleteCommentCommand;
import com.cafecommand.www.DeletePrivCommand;
import com.cafecommand.www.HitDownCommand;
import com.cafecommand.www.HitUpCommand;
import com.cafecommand.www.ListCommand;
import com.cafecommand.www.ModifyCommand;
import com.cafecommand.www.ModifyCommentCommand;
import com.cafecommand.www.ModifyOKCommand;
import com.cafecommand.www.PostCommand;
import com.cafecommand.www.ReplyCommentCommand;
import com.cafecommand.www.ReplyPostCommand;
import com.cafecommand.www.ReplyPostSaveCommand;
import com.cafecommand.www.ViewCommand;

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public FrontController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request,response);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAction(request,response);
	}

	public void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		request.setCharacterEncoding("utf-8");
		String CommandName = request.getServletPath();
		String kindOfPage = null;		
		Command command = null;
		boolean flag = true;
		
		if(CommandName.equals("/showList.do")) {
			command = new ListCommand();
			command.excute(request, response);			
			flag=false;
			System.out.println("front - showList.do ok");			
		}
		else if(CommandName.equals("/showKindList.do")) {
			command = new ListCommand();
			command.excute(request, response);
			kindOfPage= "showKindList.jsp";
			flag=false;
		}
		else if(CommandName.equals("/postWriting.do")) {
			command = new PostCommand();
			command.excute(request, response);
			/* kindOfPage = "showList.do"; */
			flag=false;
			System.out.println("front - postWriting.do ok");
		}
		else if(CommandName.equals("/view.do")) {			
			command = new ViewCommand(); 
			command.excute(request, response);
			String no = request.getParameter("no");			 
			kindOfPage ="view.jsp";
			System.out.println("front = view.do ok");			  
		}
		else if(CommandName.equals("/modify.do")) {
			command = new ModifyCommand();
			command.excute(request, response);			
			flag = false;
		}
		else if(CommandName.equals("/modifyOK.do")) {
			command = new ModifyOKCommand();
			command.excute(request, response);
			flag = false;
		}
		else if(CommandName.equals("/delete.do")) {
			command = new DeleteCommand();
			command.excute(request, response);			
			flag = false;
		}
		else if(CommandName.equals("/deletePriv.do")) {
			command = new DeletePrivCommand();
			command.excute(request, response);			
			flag = false;
		}
		else if(CommandName.equals("/listClear.do")) {
			command = new ClearCommand();
			command.excute(request, response);
			flag = false;
		}
		else if(CommandName.equals("/comment.do")) {
			command = new CommentCommand();
			command.excute(request, response);
			flag = false;
		}
		else if(CommandName.equals("/replycomment.do")) {
			command = new ReplyCommentCommand();
			command.excute(request, response);
			flag = false;
		}
		else if(CommandName.equals("/modifycomment.do")) {
			command = new ModifyCommentCommand();
			command.excute(request, response);
			flag = false;
		}
		else if(CommandName.equals("/deletecomment.do")) {
			command = new DeleteCommentCommand();
			command.excute(request, response);
			flag = false;
		}
		else if(CommandName.equals("/hitup.do")) {
			command = new HitUpCommand();
			command.excute(request, response);
			flag = false;
		}
		else if(CommandName.equals("/hitdown.do")) {
			command = new HitDownCommand();
			command.excute(request, response);
			flag = false;
		}
		else if(CommandName.equals("/replyPost.do")) {
			command = new ReplyPostCommand();
			command.excute(request, response);
			flag = false;
		}
		else if(CommandName.equals("/replyPostSave.do")) {
			command = new ReplyPostSaveCommand();
			command.excute(request, response);
			kindOfPage = "showList.do";					
		}
		else if(CommandName.equals("/checkPWQuit.do")) {
			command = new CheckPWQuitCommand();
			command.excute(request, response);
			/* kindOfPage = "cafe_proj_cafeMain.jsp"; */
			flag = false;
		}
		if(flag) {
			RequestDispatcher dispatcher = request.getRequestDispatcher(kindOfPage);
			
			dispatcher.forward(request, response);			
		}
	}
}
