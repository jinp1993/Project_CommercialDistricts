package com.suc.Service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.suc.DAO.BoardDAO;

//게시글 삭제 
@Service
public class BReplyDeleteServiceImpl implements BoardService{
	@Autowired
	private BoardDAO dao;
	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		String id = request.getParameter("id");
		
		dao.reply_delete(dao.contentView(id));
	}
}