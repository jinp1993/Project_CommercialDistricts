package com.suc.Service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.suc.DAO.DataDAO;
import com.suc.DTO.commercial_analysisDTO;
import com.suc.DTO.commercial_analysis_indexDTO;

@Service
public class commercialCoordinateServiceImpl implements commercialAnalysisService{

	@Autowired
	DataDAO dao;
	
	@Override
	public commercial_analysisDTO execute(Model model) {
		
		commercial_analysisDTO dto = new commercial_analysisDTO();
		commercial_analysis_indexDTO indexdto = new commercial_analysis_indexDTO();
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		
		String analysis_list = request.getParameter("analysis_list");
		System.out.println("service 경도 위도 구하기 위치 값 : " + analysis_list);
		indexdto.setAnalysis_list(analysis_list);
		dto.setLongitude(dao.getLongitude(indexdto));
		dto.setLatitude(dao.getLatitude(indexdto));
		dto.setAnalysis_list(analysis_list);
		
		return dto;
	}

}
