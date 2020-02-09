package com.suc.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.suc.DTO.commercial_salesDTO;
import com.suc.DAO.DataDAO;
@Service
public class commercialTypeServiceImpl implements commercial_type_service{

	
	@Autowired
	private DataDAO dao;
		
	@Override
	public List<commercial_salesDTO> execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		/*
		System.out.println("service ��� üũ meal : " + request.getParameter("meal"));
		System.out.println("service ��� üũ service : " + request.getParameter("service"));
		System.out.println("service ��� üũ retail : " + request.getParameter("retail"));
		*/
		List<commercial_salesDTO> list = new ArrayList<commercial_salesDTO>();
				
		if(request.getParameter("meal") != null) {		
			//System.out.println("meal print : " + dao.commercial_type1());			
			list = dao.commercial_type1();
			
		}else if(request.getParameter("service") != null) {
			//System.out.println("service print : " + dao.commercial_type2());
			list = dao.commercial_type2();
			
		}else if(request.getParameter("retail") != null) {
			//System.out.println("retail print : " + dao.commercial_type3());
			list = dao.commercial_type3();
			
		} else {
			list = null;
		}
		//System.out.println("���񽺿��� ��Ʈ�ѷ��� �ѱ�� �� : " + list);
		return list;
	}
}
