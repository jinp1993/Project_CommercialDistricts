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
		

		dto.setSales(request.getParameter("sales"));//����
		dto.setNumber_of_market(request.getParameter("number_of_market"));//���� ��
		dto.setLiving_population(request.getParameter("living_population"));//�ְ��α�
		dto.setCommercial_change_rate(request.getParameter("commercial_change_rate"));//��Ǻ�ȭ��ǥ
		dto.setMarket_on_business(request.getParameter("market_on_business"));//� ���� ���� ���
		dto.setMarket_closed_business(request.getParameter("market_closed_business"));//��� ���� ���� ���
		dto.setOffice_furniture(request.getParameter("office_furniture"));//�����α�
		dto.setFloating_population(request.getParameter("floating_population"));//�����α�
		dto.setRisk_level(request.getParameter("risk_level"));//â�����赵
		dto.setLongitude(request.getParameter("longitude")); //�浵
		dto.setLatitude(request.getParameter("latitude")); //����
		dto.setAnalysis_list(request.getParameter("analysis_list")); //���θ�	
		dto.setAnalysis_type(request.getParameter("analysis_type")); //�������
		model.addAttribute("analysis_dto", dto);
			
	}
}
