package com.suc.Service;

import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.suc.DAO.MemberDAO;
import com.suc.DTO.MemberDTO;

@Service
public class MemberService {
	
	@Autowired
	private MemberDAO dao;
	
	public int login(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");

		System.out.println("1 : " + request.getParameter("id"));

		MemberDTO dto = null;
		HttpSession session = null;
		int res = 0;


		if(request.getParameter("id") != null) {
			dto = dao.login(request.getParameter("id"));
			if(dto != null && dto.getPw().equals(request.getParameter("pw"))) {
				System.out.println("로그인 성공!!");
				session = request.getSession();
				session.setAttribute("userId", request.getParameter("id"));
				res = 1;
			}
		}
		
		return res;
	}
	
	public int test(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");

		String data = request.getParameter("userId");

		dao.test(data);

		if(dao.test(data) == 0) {
			if(data.length() < 5) return 0;
			else return 1;
		} else {
			return 2;
		}

	}

	public int test2(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		String data = request.getParameter("userPw");

		// 鍮꾨�踰덊샇 �젙洹쒖떇(�쁺臾� ���냼臾몄옄 + �닽�옄 + �듅�닔臾몄옄)
		Pattern p = Pattern.compile("^(?=.*[A-Za-z])(?=.*\\d)(?=.*[$@$!%*#?&/^])[A-Za-z\\d$@$!%*#?&/^]{8,16}$");
		Matcher m = p.matcher(data);

		if(m.matches()){
			return 1;
		} else {
			return 0;			
		}	
	}

	public int test4(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");

		String data = request.getParameter("year");
		Pattern p = Pattern.compile("[0-9]{4}+$");
		Matcher m = p.matcher(data);

		if(m.matches()) {
			return 1;
		} else {
			return 0;			
		}
	}

	public int test6(Model model) { // �젙洹쒖떇 �닔�젙
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");

		String data = request.getParameter("day");
		Pattern p = Pattern.compile("[0-9]{1,2}+$");
		Matcher m = p.matcher(data);

		if(m.matches()) {
			System.out.println("day - success");
			return 1;
		} else {
			return 0;			
		}
	}

	public int inputPhoneNum(Model model) { // �젙洹쒖떇 �닔�젙
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");

		String data = request.getParameter("value");
		Pattern p = Pattern.compile("^\\d{3}\\d{3,4}\\d{4}$");
		Matcher m = p.matcher(data);

		if(m.matches()) {
			System.out.println("phone-num - success");
			return 1;
		} else {
			return 0;			
		}
	}

	public int register(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		MemberDTO dto = new MemberDTO();
		dto.setId(request.getParameter("id"));
		dto.setPw(request.getParameter("pw"));
		dto.setName(request.getParameter("name"));
		dto.setBirthdate(Integer.parseInt(request.getParameter("birthdate")));
		dto.setEmail(request.getParameter("email"));
		dto.setTel(request.getParameter("tel"));
		dto.setMembership_type(request.getParameter("membership_type"));
		dto.setBusiness_interests(request.getParameter("business_interests"));
		dto.setRegion_of_interest(request.getParameter("region_of_interest"));

		System.out.println(dto.toString());

		return dao.register(dto);
	}
	
	public List<String> find_id(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");

		MemberDTO dto = new MemberDTO();
		dto.setName(request.getParameter("name"));
		dto.setEmail(request.getParameter("email"));
		dto.setTel(request.getParameter("tel"));

		return dao.find_id(dto);
	}

	public String find_pw(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");

		// String res = "�엯�젰�븯�떊 �젙蹂닿� �옒紐삳릺�뿀嫄곕굹 �븘�씠�뵒媛� 議댁옱�븯吏� �븡�뒿�땲�떎.";

		MemberDTO dto = new MemberDTO();
		dto.setId(request.getParameter("id"));
		dto.setName(request.getParameter("name"));
		dto.setTel(request.getParameter("tel"));


		//System.out.println(dto.toString());

		MemberDTO db = dao.find_pw(dto);
		if(dto.getName().equals(db.getName()) && dto.getTel().equals(db.getTel())) {
			return db.getPw();
		}

		//System.out.println(db.toString());

		return null;
	}

	public MemberDTO mypage(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		MemberDTO dto = new MemberDTO();
		dto.setId(request.getParameter("id"));
		dto.setPw(request.getParameter("pw"));

		return dao.mypage(dto);
	}

	public int memberDel(String data) {
		System.out.println("session : " + data);
		int res = dao.memberDel(data);
		if(res == 1) {
			System.out.println("탈퇴 완료");
		}
		
		return res;
	}

	public MemberDTO userInfo(String data) {
		return dao.userInfo(data);
	}

	public int modify_a(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		MemberDTO dto = new MemberDTO();
		dto.setId(request.getParameter("id"));
		dto.setPw(request.getParameter("pw"));
		dto.setName(request.getParameter("name"));
		dto.setBirthdate(Integer.parseInt(request.getParameter("birthdate")));
		dto.setEmail(request.getParameter("email"));
		dto.setTel(request.getParameter("tel"));
		dto.setMembership_type(request.getParameter("membership_type"));
		dto.setBusiness_interests(request.getParameter("business_interests"));
		dto.setRegion_of_interest(request.getParameter("region_of_interest"));

		System.out.println(dto.toString());

		return dao.modify_a(dto);
	}

}
