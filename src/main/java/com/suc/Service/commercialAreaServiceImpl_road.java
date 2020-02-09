package com.suc.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.suc.DTO.ResultDTO;
import com.suc.DTO.commercial_areaDTO;
import com.suc.DTO.commercial_salesDTO;
import com.suc.DAO.DataDAO;

@Service
public class commercialAreaServiceImpl_road implements commercial_search_result{

	@Autowired
	DataDAO dao;
	
	@Override
	public List<String> execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		List<String> list_road_name = new ArrayList<String>();
		List<commercial_salesDTO> list_type = new ArrayList<commercial_salesDTO>();
		List<String> list = new ArrayList<String>();
		String type = request.getParameter("type"); //���� ������ (ex:�ѽ�������)
		
		
		//�������� - �������� �ִ� ���θ� �̱�
		String dong = request.getParameter("area"); //���� (ex:û������)
		System.out.println("service���� �޴� �� : " + request.getParameter("area"));
		list_road_name = dao.select_road_name(dong);	//�������� �ִ� ���θ� list
		for(String road: list_road_name) {	//���θ� list�� �ݺ������� String Ÿ������ ���
			ResultDTO dto = new ResultDTO();	//������� ��� dto ��ü ���� (���θ�� XX��� �� ������ ����)
			dto.setRoad(road);	//�̾ƿ� ���θ��� dto�� set�ϴ� ����(ex:������ xx��)
			dto.setType(type); 	//���� �����͸� dto�� set �ϴ� ����(ex:�ѽ�������)
			//���� �����͸� �޾� market_info_type DB�� �ش��ϴ� ���� �� �̾ƿ� ���θ� ���� ���θ��� �̱� 
			list_type = dao.select_commercial_salesDTO_OfType(dto);	//resultDTO - Ư�� ���������� �̾ƿ� ���θ�� ���� �����͸� DAO�� ���� ���� 2�б��� �ѽ��������� ���� �̰� set�� ���θ��� �˻��ؼ� �ѹ� �� ã��
			for(commercial_salesDTO result_dto : list_type) {
				System.out.println("=======================================");
				System.out.println(result_dto.getCommercial_road_type());
				System.out.println(result_dto.getCommercial_type());
				System.out.println("=======================================");
				list.add(result_dto.getCommercial_road_type());
				list.add(result_dto.getCommercial_type());
			}
		}
		model.addAttribute("result_search", list);
		return list;
	}
}
