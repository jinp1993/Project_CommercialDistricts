package com.suc.Controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.suc.DTO.addressDTO;
import com.suc.DTO.commercial_analysisDTO;
import com.suc.DTO.commercial_areaDTO;
import com.suc.DTO.commercial_salesDTO;
import com.suc.Service.addressService;
import com.suc.Service.addressServiceImpl;
import com.suc.Service.commercialAnalysisService;
import com.suc.Service.commercialAnalysisServiceImpl;
import com.suc.Service.commercialAnalysisServiceImpl2;
import com.suc.Service.commercialAreaServiceImpl;
import com.suc.Service.commercialAreaServiceImpl_road;
import com.suc.Service.commercialCoordinateServiceImpl;
import com.suc.Service.commercialDataResultService;
import com.suc.Service.commercialTypeServiceImpl;
import com.suc.Service.commercialTypeServiceImpl2;
import com.suc.Service.commercial_search_result;
import com.suc.Service.commercial_type_area_service;
import com.suc.Service.commercial_type_service;

@Controller
public class CommercialController {

	private addressService service;
	private commercial_type_service ct_service;
	private commercial_type_area_service cta_service;
	private commercial_search_result csr_service;
	private commercialAnalysisService analysis_service;
	private commercialDataResultService cdrs_service;
	@SuppressWarnings("unused")
	private ApplicationContext applicationContext = 
			ApplicationContextprovider.getApplicationContext();
	commercial_salesDTO ct_dto = new commercial_salesDTO();
	
	@RequestMapping("index") 
	public String index() {
		return "index";
	}
	@RequestMapping("commercialDistricts") 
	public String commercialDistricts(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();	
		if(session.getAttribute("longitude") == null || session.getAttribute("latitude") == null) {	
			System.out.println("���� ����");
			session.setAttribute("latitude", 37.5631473);
			session.setAttribute("longitude", 126.9747710);			
		}else if(session.getAttribute("longitude_analysis") == null || session.getAttribute("latitude_analysis") == null) {
			session.setAttribute("latitude_analysis", 37.5631473);
			session.setAttribute("longitude_analysis", 126.9747710);	
		}
		cta_service = (commercialAreaServiceImpl)applicationContext.getBean("commercialAreaServiceImpl");
		cta_service.execute(model);
			
		return "commercialDistricts";
	}
	@RequestMapping("header") 
	public String header() {
		return "public/header";
	}
	@RequestMapping("footer") 
	public String footer() {
		return "public/footer";
	}
	@RequestMapping("map") 
	public String map() {
		return "map";
	}
	@RequestMapping("map2") 
	public String map2() {
		return "map2";
	}
	@RequestMapping("map_analysis") 
	public String map_analysis() {
		return "map_analysis";
	}
	
	@RequestMapping("address")
	public String address(Model model, HttpServletRequest request) {
		model.addAttribute("request", request);
		System.out.println(request.getParameter("address"));
		service = (addressServiceImpl)applicationContext.getBean("addressServiceImpl");
		service.execute(model);
		cta_service = (commercialAreaServiceImpl)applicationContext.getBean("commercialAreaServiceImpl");
		cta_service.execute(model);
		return "commercialDistricts";
	}

	@RequestMapping(value="map_position", produces="application/text;charset=utf8", method=RequestMethod.POST)
	@ResponseBody //�̰� �־�� ajax_result���� �� ���� ó�����ȴ�.
	public String map_position(addressDTO dto, HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.setAttribute("longitude", dto.getLongitude());
		session.setAttribute("latitude", dto.getLatitude());
		//System.out.println("�浵 : " + dto.getLongitude());
		//System.out.println("���� : " + dto.getLatitude());
		return dto.getLatitude()+ "" + dto.getLongitude(); //cnt�� �޾Ƽ� �������·� ��ȯ�Ͽ� return�Ѵ�
	}
	
	@RequestMapping(value="map_getposition", produces="application/text;charset=utf8", method=RequestMethod.POST)
	@ResponseBody //�̰� �־�� ajax_result���� �� ���� ó�����ȴ�.
	public void map_getposition(addressDTO dto,HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.setAttribute("latitude", dto.getLatitude());
		session.setAttribute("longitude", dto.getLongitude());
		
	}
	@RequestMapping(value="commercial_type", produces="application/json", method=RequestMethod.POST)
	@ResponseBody 
	public List<commercial_salesDTO> commercial_type(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		ct_service = (commercialTypeServiceImpl)applicationContext.getBean("commercialTypeServiceImpl");	
		return ct_service.execute(model);
	}
	
	@RequestMapping(value="select_area_city", produces="application/json", method=RequestMethod.POST)
	@ResponseBody 
	public List<commercial_areaDTO> select_area_city(commercial_areaDTO dto,HttpServletRequest request,Model model) {
		model.addAttribute("request", request);
		//System.out.println("controller : " + request.getParameter("index"));
		cta_service = (commercialTypeServiceImpl2)applicationContext.getBean("commercialTypeServiceImpl2");
		return cta_service.execute(model);
	}
	
	//��Ȱ�������� �ߺз� ���� ajax�� ����
	@RequestMapping(value="selectBytype", produces="application/text;charset=utf8", method=RequestMethod.GET)
	@ResponseBody 
	public String selectBytype(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		//System.out.println("�ߺз� �� ������ controller : " + request.getParameter("selectBytype"));
		return request.getParameter("selectBytype");
	}
	
	//�˻���� ��Ʈ�ѷ�
	@RequestMapping(value="search_analysis", produces="application/json", method=RequestMethod.POST)
	@ResponseBody
	public List<String> search_analysis(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);
		csr_service = (commercialAreaServiceImpl_road)applicationContext.getBean("commercialAreaServiceImpl_road");		
		return csr_service.execute(model);
	}
	
	//analysis_list(���θ�) ���� �޾Ƽ� �浵, ���� ���� �� map_analysis.jsp�� �� ����
	@RequestMapping(value="analysis_list", method=RequestMethod.POST)
	@ResponseBody
	public commercial_analysisDTO analysis_list(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);	
		analysis_service = (commercialCoordinateServiceImpl)applicationContext.getBean("commercialCoordinateServiceImpl");
		return analysis_service.execute(model);
	}
	@RequestMapping(value="transmit_value", method=RequestMethod.POST)
	@ResponseBody
	public String transmit_value(HttpServletRequest request, Model model, addressDTO dto) {
		model.addAttribute("request", request);
		dto.setLatitude(request.getParameter("latitude_analysis"));
		dto.setLongitude(request.getParameter("longitude_analysis"));
		
		HttpSession session = request.getSession();
		session.setAttribute("longitude_analysis", dto.getLongitude());
		session.setAttribute("latitude_analysis", dto.getLatitude());
		return dto.getLatitude()+ "" + dto.getLongitude(); //cnt�� �޾Ƽ� �������·� ��ȯ�Ͽ� return�Ѵ�
	}
	
	@RequestMapping(value="analysis", method=RequestMethod.POST)
	@ResponseBody
	public commercial_analysisDTO analysis(HttpServletRequest request, Model model) {
		model.addAttribute("request", request);	
		analysis_service = (commercialAnalysisServiceImpl)applicationContext.getBean("commercialAnalysisServiceImpl");
		return analysis_service.execute(model);
	}
	
	@RequestMapping(value="commercial_analysis_result")
	public void analysis_cover(HttpServletRequest request, commercial_analysisDTO dto,Model model) {
		model.addAttribute("request",request);
		cdrs_service = (commercialAnalysisServiceImpl2)applicationContext.getBean("commercialAnalysisServiceImpl2");
		cdrs_service.execute(model);
		System.out.println("popâ ����");
		
	}
}
