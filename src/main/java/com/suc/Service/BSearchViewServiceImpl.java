package com.suc.Service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.suc.DAO.BoardDAO;

@Service
public class BSearchViewServiceImpl implements BoardService {

	@Autowired
	public BoardDAO dao;
	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String search =request.getParameter("search");
		String sel = request.getParameter("sel");
		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("sel", sel);
		map2.put("search", search);
		PageMaker pk = (PageMaker)map.get("pageMaker");
		int end =	pk.getCriteria().getPage()*10;
		map2.put("end", end);	
		model.addAttribute("list",dao.searchView(map2));		
		model.addAttribute("map",map2);
	}
}
