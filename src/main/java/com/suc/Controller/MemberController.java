package com.suc.Controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.suc.Service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService mService;
	
	@RequestMapping(value = "login", produces = "application/json", method = RequestMethod.POST)
	@ResponseBody
	public int login(HttpServletRequest request, Model model) {
		System.out.println("id : " + request.getParameter("id") + " / pw : " + request.getParameter("pw"));
		model.addAttribute("request", request);
		// mService.login(model);

		//ModelAndView mv = new ModelAndView();
		//mv.setViewName("redirect:/");
		return mService.login(model);
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		if(session.getAttribute("userId") != null) {
			session.invalidate();
		}
		return "redirect:/";
	}
	
	@RequestMapping("memberDel")
	public String memberDel(HttpSession session) {
		System.out.println("ȸ��Ż�� ����");
		String data = (String)session.getAttribute("userId");
		// System.out.println(data);
		int res = mService.memberDel(data);
		if(res == 1) {
			session.invalidate();
		}
		return "redirect:/";
	}
	
	@RequestMapping("modify")
	public String modify(HttpSession session, Model model) {
		System.out.println("ȸ���������� ����");
		String data = (String)session.getAttribute("userId");
		//mService.userInfo(data);
		model.addAttribute("user", mService.userInfo(data));
		return "member/modify";
	}

	@RequestMapping(value = "modify_a", produces = "application/json", method = RequestMethod.POST)
	@ResponseBody
	public int modify_a(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);	
		System.out.println("1 : " + request.getParameter("uname"));
		int res = mService.modify_a(model);

		if(res == 1) {
			System.out.println("ȸ�� ���� ����");
			return 1;
		}

		return 0;
	}
	
	@RequestMapping(value = "agreeChk", produces = "application/json", method = RequestMethod.POST)
	@ResponseBody
	public int agreeChk(HttpServletRequest request) throws Exception {
		System.out.println("required1 : " + request.getParameter("required1") + " / required2 : " + request.getParameter("required2"));
		if(request.getParameter("required1").equals("true") && request.getParameter("required2").equals("true")) {
			return 1;
		}
		return 0;
	}

	// find-id
	@RequestMapping(value = "find_id", produces = "application/json", method = RequestMethod.POST)
	@ResponseBody
	public List<String> find_id(HttpServletRequest request, Model model) {
		System.out.println(request.getParameter("name"));
		System.out.println(request.getParameter("email"));
		System.out.println(request.getParameter("tel"));

		model.addAttribute("request", request);
		List<String> list = mService.find_id(model);

		for (String string : list) {
			System.out.println("��� : " + string);
		}


		return list;
	}

	@RequestMapping("find_pw")
	@ResponseBody
	public String find_pw(HttpServletRequest request, Model model) {
		System.out.println(request.getParameter("id"));
		System.out.println(request.getParameter("name"));
		System.out.println(request.getParameter("tel"));
		model.addAttribute("request", request);
		String res = mService.find_pw(model);
		System.out.println(res);
		return res;
	}
	
	@RequestMapping("register1")
	public String register1() {
		return "member/register1";
	}

	@RequestMapping("register2")
	public String register2(HttpServletRequest request, Model model) {		
		return "member/register2";
	}
	
	@RequestMapping("mypage")
	public String mypage() {
		return "member/myPage";
	}
	
	@RequestMapping("forgotidpw")
	public String forgotidpw(){
		return "member/forgot-id-pw";
	}
	
	@RequestMapping(value = "register", produces = "application/json", method = RequestMethod.POST)
	@ResponseBody
	public int register(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);	
		System.out.println("1 : " + request.getParameter("uname"));
		int res = mService.register(model);

		if(res == 1) {
			System.out.println("ȸ�� ���� ����");
			return 1;
		}

		return 0;
	}

	// �Է� ���� ��ȿ�� �˻�
	@RequestMapping(value = "isInput", produces = "application/json", method = RequestMethod.POST)
	@ResponseBody
	public int isInput(HttpServletRequest request) {

		String test = request.getParameter("value");
		System.out.println("value : " + test);

		if(!test.equals("")) {
			return 1;
		} else {
			return 0;
		}			
	}

	// ���̵� ��ȿ�� �˻�
	@RequestMapping(value = "chk", produces = "application/json", method = RequestMethod.POST)
	@ResponseBody
	public int chk(HttpServletRequest request) {
		int res = Integer.parseInt(request.getParameter("value"));
		System.out.println(res);
		return res;
	}
	@RequestMapping(value = "test", produces = "application/json", method = RequestMethod.POST)
	@ResponseBody
	public int test(HttpServletRequest request, Model model) {
		String test = request.getParameter("userId");
		System.out.println("controller : " + test);
		model.addAttribute("request", request);		
		return mService.test(model);		
	}

	// ��й�ȣ ��ȿ�� �˻�
	@RequestMapping(value = "test2", produces = "application/json", method = RequestMethod.POST)
	@ResponseBody
	public int test2(HttpServletRequest request, Model model) {
		String test = request.getParameter("userPw");
		System.out.println("controller : " + test);
		model.addAttribute("request", request);		
		return mService.test2(model);		
	}

	// ��й�ȣ �ߺ� ��ȿ�� �˻�
	@RequestMapping(value = "test3", produces = "application/json", method = RequestMethod.POST)
	@ResponseBody
	public int test3(HttpServletRequest request) {

		String check1 = request.getParameter("userPw");
		String check2 = request.getParameter("userPwChk");


		if(check1.equals(check2)) {
			return 1;
		} else {
			return 0;
		}		
	}	

	// ������� ��ȿ�� �˻�(year)
	@RequestMapping(value = "test4", produces = "application/json", method = RequestMethod.POST)
	@ResponseBody
	public int test4(HttpServletRequest request, Model model) {
		String test = request.getParameter("year");
		System.out.println("controller-year : " + test);
		model.addAttribute("request", request);				
		return mService.test4(model);
	}	

	// ������� ��ȿ�� �˻�(month)
	@RequestMapping(value = "test5", produces = "application/json", method = RequestMethod.POST)
	@ResponseBody
	public int test5(HttpServletRequest request) {
		String test = request.getParameter("month");
		System.out.println("controller-month : " + test);
		if(!test.equals("MM")) { return 1; }
		else { return 0; }
	}	

	// ������� ��ȿ�� �˻�(day)
	@RequestMapping(value = "test6", produces = "application/json", method = RequestMethod.POST)
	@ResponseBody
	public int test6(HttpServletRequest request, Model model) {
		String test = request.getParameter("day");
		System.out.println("controller-day : " + test);
		model.addAttribute("request", request);				
		return mService.test6(model);
	}	

	// �ڵ��� ��ȿ�� �˻�
	@RequestMapping(value = "input-phone-num.do", produces = "application/json", method = RequestMethod.POST)
	@ResponseBody
	public int inputPhoneNum(HttpServletRequest request, Model model) {
		String test = request.getParameter("value");
		System.out.println("controller-day : " + test);
		model.addAttribute("request", request);				
		return mService.inputPhoneNum(model);
	}
}
