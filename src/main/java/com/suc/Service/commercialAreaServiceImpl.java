package com.suc.Service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.suc.DTO.commercial_areaDTO;
import com.suc.DAO.DataDAO;

@Service
public class commercialAreaServiceImpl implements commercial_type_area_service{

	@Autowired
	DataDAO dao;
	
	
	@Override
	public List<commercial_areaDTO> execute(Model model) {
		List<commercial_areaDTO> list_area = new ArrayList<commercial_areaDTO>();
		list_area = dao.select_area();
		//System.out.println("service : " + list_area);
		model.addAttribute("list_area",list_area);
		return list_area;
	}

}
