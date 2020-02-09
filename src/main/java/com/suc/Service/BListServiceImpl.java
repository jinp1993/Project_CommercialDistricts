package com.suc.Service;

import java.util.HashMap;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.suc.DAO.BoardDAO;



//각 게시판 사이트 목록출력
@Service
public class BListServiceImpl implements BoardService{
	@Autowired
	public BoardDAO dao;
	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		int end =0;
		String board=(String) map.get("board");
		PageMaker pk= (PageMaker)map.get("pageMaker");
		
		if(pk.getTotalCount()>0) {
		end =	pk.getCriteria().getPage()*10;
		}
		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("board", board);
		map2.put("end", end);
		
		model.addAttribute("list",dao.boardView(map2));
	
		
		
	}
}