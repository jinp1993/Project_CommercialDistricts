package com.suc.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.suc.DTO.ResultDTO;
import com.suc.DTO.addressDTO;
import com.suc.DTO.commercial_analysis_indexDTO;
import com.suc.DTO.commercial_areaDTO;
import com.suc.DTO.commercial_salesDTO;

@Repository
public class DataDAO {
	private static final String namespace="com.suc.mybatis.myMapper";
	
	@Autowired
	private SqlSession sqlSession;

	public List<addressDTO> search_dong(String address){	
		List<addressDTO> dto = null;
		if(address.endsWith("��") || address.startsWith("����")) {
			dto = sqlSession.selectList(namespace+".search_si", address);
		}else if (address.endsWith("��")) {
			dto = sqlSession.selectList(namespace+".search_gu", address);
		}else if (address.endsWith("��")) {
			dto = sqlSession.selectList(namespace+".search_dong", address);
		}else if (address.contains(address)) {
			dto = sqlSession.selectList(namespace+".market", address);
		}
		return dto;
	}
	
	public List<addressDTO> search_agency(String address){	
		List<addressDTO> dto = null;		
		dto = sqlSession.selectList(namespace+".search_agency1", address);
		if (dto == null) {
			dto = sqlSession.selectList(namespace+".search_agency2", address);
		}else {
			dto = sqlSession.selectList(namespace+".search_agency3", address);
		}
		return dto;
	}
	
	public List<commercial_salesDTO> commercial_type1() {
		List<commercial_salesDTO> dto = sqlSession.selectList(namespace+".commercial_type_meal");		
		return dto;
	}
	public List<commercial_salesDTO> commercial_type2() {
		List<commercial_salesDTO> dto = sqlSession.selectList(namespace+".commercial_type_service");		
		return dto;
	}
	public List<commercial_salesDTO> commercial_type3() {
		List<commercial_salesDTO> dto = sqlSession.selectList(namespace+".commercial_type_retail");		
		return dto;
	}
	public List<commercial_areaDTO> select_area() {
		List<commercial_areaDTO> dto = sqlSession.selectList(namespace+".commercial_select_area");		
		return dto;
	}
	
	public List<commercial_areaDTO> select_dong(String city) {
		List<commercial_areaDTO> dto = sqlSession.selectList(namespace+".commercial_select_dong", city);		
		return dto;
	}
	
	public List<String> select_road_name(String dong) {
		List<String> dto = sqlSession.selectList(namespace+".commercial_select_road_name", dong);		
		return dto;
	}
	

	public List<commercial_salesDTO> select_commercial_salesDTO_OfType(ResultDTO rdto) {
		return sqlSession.selectList(namespace+".commercial_salesDTO_OfType", rdto);		
	}
	//���� �� ���ϱ�
	public String number_of_market(commercial_analysis_indexDTO indexdto) {
		return sqlSession.selectOne(namespace+".number_of_market", indexdto);		
	}
	//�ְ��α��� ���ϱ�
	public String living_population(commercial_analysis_indexDTO indexdto) {
		return sqlSession.selectOne(namespace+".living_population", indexdto);		
	}
	//��� ��ȭ��ǥ ���ϱ�
	public String commercial_change_rate(commercial_analysis_indexDTO indexdto) {
		return sqlSession.selectOne(namespace+".commercial_change_rate", indexdto);		
	}
	//� ���� ���� ��� 
	public String market_on_business(commercial_analysis_indexDTO indexdto) {
		return sqlSession.selectOne(namespace+".market_on_business", indexdto);		
	}
	//��� ���� ���� ���
	public String market_closed_business(commercial_analysis_indexDTO indexdto) {
		return sqlSession.selectOne(namespace+".market_closed_business", indexdto);		
	}
	//�����α��� ���ϱ�
	public String office_furniture(commercial_analysis_indexDTO indexdto) {
		return sqlSession.selectOne(namespace+".office_furniture", indexdto);		
	}
	//�����α��� ���ϱ�
	public String floating_population(commercial_analysis_indexDTO indexdto) {
		return sqlSession.selectOne(namespace+".floating_population", indexdto);		
	}
	//���� ���ϱ�
	public String sales(commercial_analysis_indexDTO indexdto) {
		return sqlSession.selectOne(namespace+".sales", indexdto);		
	}
	//â�� ���赵 ���ϱ�
	public String risk_level(commercial_analysis_indexDTO indexdto) {
		return sqlSession.selectOne(namespace+".risk_level", indexdto);		
	}
	//�浵���ϱ�
	public String getLongitude(commercial_analysis_indexDTO indexdto) {
		String result = null;
		if(indexdto.equals("����1,2,3,4��") || indexdto.equals(("����5,6��"))) {
			result = sqlSession.selectOne(namespace+".getLongitude_JongNo", indexdto);
		}else {
			result = sqlSession.selectOne(namespace+".getLongitude", indexdto);
		}
		return result;		
	}
	//�������ϱ�
	public String getLatitude(commercial_analysis_indexDTO indexdto) {
		String result = null;
		if(indexdto.equals("����1,2,3,4��") || indexdto.equals(("����5,6��"))) {
			result = sqlSession.selectOne(namespace+".getLatitude_JongNo", indexdto);
		}else {
			result = sqlSession.selectOne(namespace+".getLatitude", indexdto);
		}
		return result;		
	}
}
