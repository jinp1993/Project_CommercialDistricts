package com.suc.Service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.suc.DAO.BoardDAO;
import com.suc.DTO.BoardDTO;

@Service
public class BReplyServiceImpl implements BoardService{
	
	@Autowired
	private BoardDAO dao;
	public void execute(Model model) {
	
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		HttpSession session = request.getSession();
		BoardDTO dto = new BoardDTO();
		dto.setName((String)session.getAttribute("userId"));		
		dto.setContent(request.getParameter("content"));
		dto.setIdgroup(Integer.parseInt(request.getParameter("id")));
		

		dao.reply_save(dto);
	}
}