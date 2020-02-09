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
public class commercialAnalysisServiceImpl2 implements commercialDataResultService{
	@Autowired
	DataDAO dao = new DataDAO();
	
	public void execute(Model model) {
		commercial_analysisDTO dto = new commercial_analysisDTO();
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		

		dto.setSales(request.getParameter("sales"));//매출
		dto.setNumber_of_market(request.getParameter("number_of_market"));//점포 수
		dto.setLiving_population(request.getParameter("living_population"));//주거인구
		dto.setCommercial_change_rate(request.getParameter("commercial_change_rate"));//상권변화지표
		dto.setMarket_on_business(request.getParameter("market_on_business"));//운영 영업 개월 평균
		dto.setMarket_closed_business(request.getParameter("market_closed_business"));//폐업 영업 개월 평균
		dto.setOffice_furniture(request.getParameter("office_furniture"));//직장인구
		dto.setFloating_population(request.getParameter("floating_population"));//유동인구
		dto.setRisk_level(request.getParameter("risk_level"));//창업위험도
		dto.setLongitude(request.getParameter("longitude")); //경도
		dto.setLatitude(request.getParameter("latitude")); //위도
		dto.setAnalysis_list(request.getParameter("analysis_list")); //도로명	
		dto.setAnalysis_type(request.getParameter("analysis_type")); //상권유형
		model.addAttribute("analysis_dto", dto);
			
	}
}
