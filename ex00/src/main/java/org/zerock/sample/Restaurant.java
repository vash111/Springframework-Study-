package org.zerock.sample;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import lombok.Data;

@Component
@Data
public class Restaurant {
	
	@Autowired
	private Chef chef;
}
