package com.suc.Service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.suc.DTO.addressDTO;
import com.suc.DAO.DataDAO;

@Service
public class addressServiceImpl implements addressService{

	@Autowired
	private DataDAO dao;
	
	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");		
		String address = request.getParameter("address");
		List<addressDTO> arr = dao.search_dong(address);
		model.addAttribute("address", dao.search_dong(address));
		model.addAttribute("address_size", arr.size());
		
		List<addressDTO> arr_agency = dao.search_agency(address);
		model.addAttribute("administrative_agency",dao.search_agency(address));
		model.addAttribute("agency_size", arr_agency.size());
		//System.out.println(dao.search_dong(address));
	}
}
