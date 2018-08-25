package com.spring.drone.me;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {

	@Autowired
	private MemberDAOService memberDAOService;
	
	@RequestMapping("/login_form.me")
	public String login_form(){		
		System.out.println("=login_form.me ");
		return "login/login";
	}
	
	@RequestMapping("/login.me")
	public ModelAndView userCheck(MemberVO memberVO, HttpSession session, HttpServletResponse response,  HttpServletRequest request, Model model) throws Exception {
		System.out.println("=login.me ");
		ModelAndView result = new ModelAndView();
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; utf-8");
		PrintWriter writer = response.getWriter();
		
		String password = memberVO.getPassword();
		int res = memberDAOService.userCheck(memberVO);
		
		if (res == 1){
			memberVO = memberDAOService.selectMember(memberVO);
			if (password.equals(memberVO.getPassword())) {
				
				session.setAttribute("id", memberVO.getId());
				session.setAttribute("nickname", memberVO.getNickname());
				result.setViewName("login/login_success");
			}else {
			writer.write("<script>alert('login.me, 占쏙옙占쏙옙占� 占쌕몌옙占싹댐옙. 확占쏙옙占쏙옙 占쌍쇽옙占쏙옙.');</script>");
			}
		}else{
			writer.write("<script>alert('login.me, 占쏙옙占싱듸옙 占쏙옙占쏙옙占쏙옙占쏙옙 占십쏙옙占싹댐옙. 확占쏙옙占쏙옙 占쌍쇽옙占쏙옙');location.href='template.templ?page=login_form.me';</script>");
		}
		return result;
	}
	
	@RequestMapping("/logout.me")
	public ModelAndView logout(MemberVO memberVO, HttpSession session, HttpServletResponse response,  HttpServletRequest request, Model model) throws Exception {
		System.out.println("=logout.me ");
		ModelAndView result = new ModelAndView();
		session.removeAttribute("id");
		session.removeAttribute("password");
		result.setViewName("login/logout_success");
		
		return result;
	}
	
	@RequestMapping("/client_chat.me")
	public String selectMember(HttpServletRequest request, HttpSession session) throws Exception {
		System.out.println("=client_chat.me ");
		String nickname = request.getParameter("nickname");
		System.out.println("=client_chat.me, nickname : " + nickname);
		session.setAttribute("nickname", nickname);
		
		return "client_chat";
	}
	
	@RequestMapping("/joinprocess.me")
	public String insertMember(MemberVO memberVO, HttpServletResponse response) throws Exception {
		System.out.println("=joinprocess.me ");
		int res = memberDAOService.insertMember(memberVO);
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; utf-8");
		PrintWriter writer = response.getWriter();
		if (res != 0){
			writer.write("<script>alert('joinprocess, 회원가입 성겅!');" + 
						"location.href='./login/login.jsp';</script>");
		}else{
			writer.write("<script>alert('joinprocess, 회원가입 실패');" + 
						"location.href='./joinform.me';</script>");
		}
		return null;
	}
	
	//소샬로그인 후 DB 조회 후 아이디가 없으면 가입시키는 작업을 하고
	//소샬로그인 후 DB 조회 후 아이디가 있으면 바로 세션 저장하고 jsp로 보내는 메소드이다.
	@RequestMapping("/socialjoinprocess.me")
	public String insertSocialMember(MemberVO memberVO, HttpSession session, HttpServletResponse response) throws Exception {
		System.out.println("=socialjoinprocess.me ");
		PrintWriter writer = response.getWriter();
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; utf-8");
		//먼저 소샬로그인 후 DB 조회를 해서 아이디가 저장되어 있는지 확인한다.
		int res = memberDAOService.userCheck(memberVO);
		
		if (res == 0) {
			//아이디가 저장되어 있지 않다면 DB에 저장하는 작업을 한다
			int insert_res = memberDAOService.insertSocialMember(memberVO);
			if (insert_res != 1) {
				writer.write("<script>alert('socialjoinprocess, SNS회원가입 실패');" +
						"location.href='template.templ?page=login_form.me';</script>");
			}
			else {
				writer.write("<script>alert('socialjoinprocess, SNS회원가입 성공');" +
						"location.href='template.templ?page=login_form.me';</script>");
			}
		}
		else {
			//아이디가 저장되어 있다면 그 아이디로 멤버를 불러온 후 그 아이디와 닉네임을
			//세션에 저장해서 jsp로 보낸다!!
			memberVO = memberDAOService.selectMember(memberVO);
			session.setAttribute("id", memberVO.getId());
			session.setAttribute("nickname", memberVO.getNickname());
			//session.setAttribute("authority", 1);
		}
		return "login/login_success";
	}
/*	 @RequestMapping("/idcheck.me")
	    @ResponseBody
	    public Map<Object, Object> idCheck(@RequestBody String id) {
	        
	        int count = 0;
	        Map<Object, Object> map = new HashMap<Object, Object>();
	 
	        count = MemberDAOServiceImpl.idCheck(id);
	        map.put("cnt", count);
	        
	        return map;
	    }*/
}
