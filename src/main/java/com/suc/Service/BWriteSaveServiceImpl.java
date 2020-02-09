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
public class BWriteSaveServiceImpl implements BoardService {
	@Autowired
	private BoardDAO dao;
	
	@Override
	public void execute(Model model) {
		Map<String,Object>map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		BoardDTO dto = new BoardDTO();
		HttpSession session = request.getSession();
		dto.setName(((String)session.getAttribute("userId")));
		dto.setTitle(request.getParameter("title"));	
		dto.setContent(request.getParameter("content"));
		dto.setBoard(request.getParameter("menuid"));
		dao.reg_save(dto);
	}
}