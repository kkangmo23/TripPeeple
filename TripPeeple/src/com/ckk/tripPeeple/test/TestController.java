package com.ckk.tripPeeple.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class TestController {

	@RequestMapping(value = "/fileTest.do", method = RequestMethod.GET)
	public String fileTest() {
		return "test/fileTest2";
	}
	
	@RequestMapping(value = "/test.do", method = RequestMethod.GET)
	public String viewTest() {
		return "test/testHomeHardCode";
	}
}
