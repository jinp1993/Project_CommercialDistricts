package com.suc.Service;

import java.util.List;

import org.springframework.ui.Model;

import com.suc.DTO.commercial_salesDTO;

public interface commercial_type_service {
	public List<commercial_salesDTO> execute(Model model);
}
