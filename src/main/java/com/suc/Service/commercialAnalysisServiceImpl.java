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
		System.out.println("���� indexdto_area :" + indexdto.getAnalysis_area());
		System.out.println("���� indexdto_list :" + indexdto.getAnalysis_list());
		System.out.println("���� indexdto_type :" + indexdto.getAnalysis_type());
		System.out.println("���� indexdto_city :" + indexdto.getAnalysis_city());
		System.out.println("���� �� : " + dao.number_of_market(indexdto));
		*/
		dto.setSales(dao.sales(indexdto));//����
		dto.setNumber_of_market(dao.number_of_market(indexdto));//���� ��
		dto.setLiving_population(dao.living_population(indexdto));//�ְ��α�
		dto.setCommercial_change_rate(dao.commercial_change_rate(indexdto));//��Ǻ�ȭ��ǥ
		dto.setMarket_on_business(dao.market_on_business(indexdto));//� ���� ���� ���
		dto.setMarket_closed_business(dao.market_closed_business(indexdto));//��� ���� ���� ���
		dto.setOffice_furniture(dao.office_furniture(indexdto));//�����α�
		dto.setFloating_population(dao.floating_population(indexdto));//�����α�
		dto.setRisk_level(dao.risk_level(indexdto));//â�����赵
		dto.setLongitude(dao.getLongitude(indexdto)); //�浵
		dto.setLatitude(dao.getLatitude(indexdto)); //����
		dto.setAnalysis_list(analysis_list); //���θ�
		dto.setAnalysis_type(analysis_type);
		//dto.setMarket_on_business(dao.market_on_business(indexdto));
		//dto.setNumber_of_market(dao.market_on_business(indexdto)); //���� �� ���ϱ�	
		model.addAttribute("dto", dto);
		return dto;		
	}
}
