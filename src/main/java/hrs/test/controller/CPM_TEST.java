package hrs.test.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import hrs.test.service.CPM_Service;


@Controller
public class CPM_TEST {
//Log 를 찍어줄 객체를 생성
	Logger log = Logger.getLogger(this.getClass());
	
	// interface 할 Service 객체를 지정한다
	@Resource(name="cpm_Service")
	private CPM_Service cpm_Service;
	
	@RequestMapping(value="/test/getJsonData.do")
	public ModelAndView testJsonParsingResolver(Map<String,Object> commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/test/getJsonData");
		List<Map<String,Object>> jsonData = cpm_Service.getCallback(commandMap);
		mv.addObject("json",jsonData);
		
		return mv;
	}
}
