package com.suc.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.suc.DTO.commercial_areaDTO;
import com.suc.DAO.DataDAO;

@Service
public class commercialTypeServiceImpl2 implements commercial_type_area_service{

	
	@Autowired
	DataDAO dao;
	
	@Override
	public List<commercial_areaDTO> execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		List<commercial_areaDTO> list_dong = new ArrayList<commercial_areaDTO>();
		
		String city = request.getParameter("index");
		
		list_dong = dao.select_dong(city);
		System.out.println(list_dong);
		
		return list_dong;
	}

}
