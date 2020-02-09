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
		String type = request.getParameter("type"); //업종 데이터 (ex:한식음식점)
		
		
		//행정구역 - 행정동에 있는 도로명 뽑기
		String dong = request.getParameter("area"); //지역 (ex:청량리동)
		System.out.println("service에서 받는 값 : " + request.getParameter("area"));
		list_road_name = dao.select_road_name(dong);	//행정동에 있는 도로명 list
		for(String road: list_road_name) {	//도로명 list를 반복문으로 String 타입으로 출력
			ResultDTO dto = new ResultDTO();	//결과값을 담는 dto 객체 생성 (도로명과 XX골목 의 변수가 있음)
			dto.setRoad(road);	//뽑아온 도로명을 dto에 set하는 과정(ex:선릉로 xx길)
			dto.setType(type); 	//업종 데이터를 dto에 set 하는 과정(ex:한식음식점)
			//업종 데이터를 받아 market_info_type DB에 해당하는 업종 및 뽑아온 도로명에 속한 도로명을 뽑기 
			list_type = dao.select_commercial_salesDTO_OfType(dto);	//resultDTO - 특정 행정동에서 뽑아온 도로명과 업종 데이터를 DAO로 전송 먼저 2분기의 한식음식점을 전부 뽑고 set된 도로명을 검색해서 한번 더 찾기
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
