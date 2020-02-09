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
public class commercialAnalysisServiceImpl implements commercialAnalysisService{
	
	
	@Autowired
	DataDAO dao = new DataDAO();
	
	public commercial_analysisDTO execute(Model model) {
		commercial_analysisDTO dto = new commercial_analysisDTO();
		commercial_analysis_indexDTO indexdto = new commercial_analysis_indexDTO();
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		String analysis_area = request.getParameter("area");
		String analysis_type = request.getParameter("type");
		String analysis_list = request.getParameter("analysis_list");
		String analysis_city = request.getParameter("index");
		indexdto.setAnalysis_area(analysis_area);
		indexdto.setAnalysis_list(analysis_list);
		indexdto.setAnalysis_type(analysis_type);
		indexdto.setAnalysis_city(analysis_city);
		/*
		System.out.println("서비스 indexdto_area :" + indexdto.getAnalysis_area());
		System.out.println("서비스 indexdto_list :" + indexdto.getAnalysis_list());
		System.out.println("서비스 indexdto_type :" + indexdto.getAnalysis_type());
		System.out.println("서비스 indexdto_city :" + indexdto.getAnalysis_city());
		System.out.println("점포 수 : " + dao.number_of_market(indexdto));
		*/
		dto.setSales(dao.sales(indexdto));//매출
		dto.setNumber_of_market(dao.number_of_market(indexdto));//점포 수
		dto.setLiving_population(dao.living_population(indexdto));//주거인구
		dto.setCommercial_change_rate(dao.commercial_change_rate(indexdto));//상권변화지표
		dto.setMarket_on_business(dao.market_on_business(indexdto));//운영 영업 개월 평균
		dto.setMarket_closed_business(dao.market_closed_business(indexdto));//폐업 영업 개월 평균
		dto.setOffice_furniture(dao.office_furniture(indexdto));//직장인구
		dto.setFloating_population(dao.floating_population(indexdto));//유동인구
		dto.setRisk_level(dao.risk_level(indexdto));//창업위험도
		dto.setLongitude(dao.getLongitude(indexdto)); //경도
		dto.setLatitude(dao.getLatitude(indexdto)); //위도
		dto.setAnalysis_list(analysis_list); //도로명
		dto.setAnalysis_type(analysis_type);
		//dto.setMarket_on_business(dao.market_on_business(indexdto));
		//dto.setNumber_of_market(dao.market_on_business(indexdto)); //점포 수 구하기	
		model.addAttribute("dto", dto);
		return dto;		
	}
}
