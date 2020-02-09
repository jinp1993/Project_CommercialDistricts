package com.suc.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.suc.DAO.BoardDAO;

@Service
public class BListALLServiceImpl implements BoardService{
	@Autowired
	public BoardDAO dao;
	
	@Override
	public void execute(Model model) {
		model.addAttribute("ImportantNotice",dao.list("Important_Notice"));
		model.addAttribute("PublicityActivities",dao.list("Publicity_Activities"));
		model.addAttribute("Tip",dao.list("Tip"));
		model.addAttribute("FreeBoard",dao.list("Free_Board"));
		
	}
	
}
