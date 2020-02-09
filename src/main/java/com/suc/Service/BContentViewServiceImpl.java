package com.suc.Service;


import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.suc.DAO.BoardDAO;


@Service
public class BContentViewServiceImpl implements BoardService {

	@Autowired
	public BoardDAO dao;
	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		
		

		model.addAttribute("list",dao.contentView(request.getParameter("id")));
		
		
		
	}

}
