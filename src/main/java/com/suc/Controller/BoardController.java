package com.suc.Controller;




import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.suc.DAO.BoardDAO;

import com.suc.DTO.BoardDTO;
import com.suc.Service.*;

@Controller
public class BoardController {

	private BoardService board;
	@Autowired
	public BoardDAO dao;

	ApplicationContext applicationContext = 
			ApplicationContextprovider.getApplicationContext();
	@RequestMapping("/errors")
	public String defaultError() {
		return "404";
	}
	@RequestMapping("Free_Board")
	public String Free_Board(HttpServletRequest request,Model model,Criteria criteria) {
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(dao.count("Free_Board"));
		System.out.println(pageMaker.getTotalCount());
		model.addAttribute("pageMaker",pageMaker);
		model.addAttribute("board","Free_Board");
		
		board = 
				(BListServiceImpl)applicationContext.getBean("BListServiceImpl");
		board.execute(model);
		return "board/Free_Board";
	}
	@RequestMapping("Important_Notice")
	public String Important_Notice(HttpServletRequest request,Model model,Criteria criteria) {
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(dao.count("Important_Notice"));
		System.out.println(pageMaker.getTotalCount());
		model.addAttribute("pageMaker",pageMaker);
		model.addAttribute("board","Important_Notice");
	
		board = 
				(BListServiceImpl)applicationContext.getBean("BListServiceImpl");
		board.execute(model);
		return "board/Important_Notice";
	}
	@RequestMapping("Tip")
	public String Q_A_tip(HttpServletRequest request,Model model,Criteria criteria) {
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(dao.count("Tip"));
		System.out.println(pageMaker.getTotalCount());
		model.addAttribute("pageMaker",pageMaker);
		model.addAttribute("board","Tip");
		board = 
				(BListServiceImpl)applicationContext.getBean("BListServiceImpl");
		board.execute(model);
		return "board/Tip";
	}
	@RequestMapping("Publicity_Activities")
	public String Publicity_Activities(HttpServletRequest request,Model model,Criteria criteria) {
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCriteria(criteria);
		pageMaker.setTotalCount(dao.count("Publicity_Activities"));
		System.out.println(pageMaker.getTotalCount());
		model.addAttribute("pageMaker",pageMaker);
		model.addAttribute("board","Publicity_Activities");
		board = 
				(BListServiceImpl)applicationContext.getBean("BListServiceImpl");
		board.execute(model);
		return "board/Publicity_Activities";
	}

	@RequestMapping("board" )
	public String board(Model model) {
		board = 
				(BListALLServiceImpl)applicationContext.getBean("BListALLServiceImpl");
		board.execute(model);
		return "board/board";
	}
	@RequestMapping(value="reg_save",method=RequestMethod.POST)
	public ResponseEntity<String> reg_save(HttpServletRequest request,Model model) {
		

		model.addAttribute("request",request);
		board = (BWriteSaveServiceImpl)applicationContext.getBean("BWriteSaveServiceImpl");
		board.execute(model);
		
		return new ResponseEntity<>(HttpStatus.OK);
	}

	@RequestMapping("regForm")
	public String regForm() {
		return "board/regForm";
	}
	@RequestMapping("content_view")
	public String content_view(HttpServletRequest request,Model model) {
		model.addAttribute("request",request);


		board = 
				(BContentViewServiceImpl)applicationContext.getBean("BContentViewServiceImpl");
		board.execute(model);
		return "board/content_view";
	}
	@RequestMapping("search")
	public String search_view(HttpServletRequest request,Model model,Criteria criteria) {
		PageMaker pk = new PageMaker();
		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("sel", request.getParameter("sel"));
		map2.put("search",request.getParameter("search"));
		pk.setCriteria(criteria);
		pk.setTotalCount(dao.searchcount(map2));
		System.out.println(pk.getTotalCount()+":토탈값");
		
		model.addAttribute("pageMaker",pk);
		model.addAttribute("map", map2);
		model.addAttribute("request",request);

		board = 
				(BSearchViewServiceImpl)applicationContext.getBean("BSearchViewServiceImpl");
		board.execute(model);

		return "board/search";
	}
	@RequestMapping(value="revise")
	public String revise(HttpServletRequest request,Model model) {
		model.addAttribute("request",request);
		board = 
				(BReviseServiceImpl)applicationContext.getBean("BReviseServiceImpl");
		board.execute(model);
		return "board/revise";
	}
	@RequestMapping(value="revise_save",method=RequestMethod.POST)
	public String revise_save(HttpServletRequest request,Model model) {
		String boardname = request.getParameter("menuid");

		model.addAttribute("request",request);
		board = 
				(BReviseSaveServiceImpl)applicationContext.getBean("BReviseSaveServiceImpl");
		board.execute(model);
		return "redirect:"+boardname;
	}
	@RequestMapping("delete")
	public String delete(HttpServletRequest request,Model model) {
		String boardname = request.getParameter("menuid");
		model.addAttribute("request",request);
		board = 
				(BContentDeleteServiceImpl)applicationContext.getBean("BContentDeleteServiceImpl");
		board.execute(model);

		return "redirect:"+boardname;
	}

	@RequestMapping("reply_update")
	public ResponseEntity<Object> reply_update(HttpServletRequest request,Model model) {


		model.addAttribute("request",request);
		board = 
				(BReplyUpdateServiceImpl)applicationContext.getBean("BReplyUpdateServiceImpl");
		board.execute(model);
		return new ResponseEntity<>(HttpStatus.OK);
	}

	@RequestMapping("reply_delete")
	public ResponseEntity<Object> replydelete(HttpServletRequest request,Model model) {


		model.addAttribute("request",request);
		board = 
				(BReplyDeleteServiceImpl)applicationContext.getBean("BReplyDeleteServiceImpl");
		board.execute(model);

		return new ResponseEntity<>(HttpStatus.OK);
	}




	//댓글리스트를 호출할때 맵핑되는 메소드
	@RequestMapping(value="reply_list.do",method = RequestMethod.GET , produces="application/json; charset=utf8")
	public ResponseEntity<String> list(HttpServletRequest request,Model model )throws Exception {
		HttpHeaders responseHeaders = new HttpHeaders();

		List<BoardDTO> lists=dao.reply_view(request.getParameter("id")); //댓글 목록
		
		System.out.println(lists);
		


		JSONArray json = new JSONArray(lists);        
		return new ResponseEntity<String>(json.toString(), responseHeaders, HttpStatus.CREATED);



	}



	@RequestMapping(value="reply_insert.do",method=RequestMethod.POST) 
	public ResponseEntity<Object> insert(Model model,HttpServletRequest request) {
		model.addAttribute("request",request);
		//댓글이 테이블에 저장됨
		HttpSession session = request.getSession();
		BoardDTO dto = new BoardDTO();
		
		dto.setName((String)session.getAttribute("userId"));
		dto.setContent(request.getParameter("content"));
		dto.setIdgroups((request.getParameter("id")));
		dao.reply_save(dto);
		return new ResponseEntity<>(HttpStatus.OK);
	}
}
