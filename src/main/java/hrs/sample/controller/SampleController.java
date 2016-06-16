package hrs.sample.controller;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import hrs.common.common.CommandMap;
import hrs.sample.service.SampleService;

// 현재 이 클래스가 비즈니스 로직을 담당하는 Controller 라는것을 명명
@Controller
public class SampleController {
<<<<<<< HEAD
	Logger log = Logger.getLogger(this.getClass());
	
	//interface 인 sammpleService 객체를 사용하겠다는 의미, service package 에 만들어져 있음.
	@Resource(name="sampleService")
	private SampleService sampleService;
	
    //RequestMapping annotation 에 매핑한 URI 은 현재 클래스가 작동될 URI 를 의미합니다.
	@RequestMapping(value="/sample/sampleList.do")
	//ex> http://Hostname/root context/sample/sampleList.do 가 실행되면 아래 코드가 실행됩니다.
    public ModelAndView openSampleBoardList(Map<String,Object> commandMap) throws Exception{
		List<Map<String,Object>> list = sampleService.selectBoardList(commandMap);	 //servive package의 serviceimpl 에서 구현한 로직을 수행  
    	ModelAndView mv = new ModelAndView("/sample/sampleList"); 					// 화면에 보여줄 jsp 파일 지정 합니다. 
    	mv.addObject("list", list);	//지정한 jsp 에 결과 리스트를 전달한다.
    	return mv;
    }
	
	@RequestMapping(value="/sample/testMapArgumentResolver.do")
	public ModelAndView testMapArgumentResolver(CommandMap commandMap) throws Exception{
	    ModelAndView mv = new ModelAndView("");
	     
	    if(commandMap.isEmpty() == false){
	        Iterator<Entry<String,Object>> iterator = commandMap.getMap().entrySet().iterator();
	        Entry<String,Object> entry = null;
	        while(iterator.hasNext()){
	            entry = iterator.next();
	            log.debug("key : "+entry.getKey()+", value : "+entry.getValue());
	        }
	    }
	    return mv;
	}
=======
	// 이 클래스의 request, response 통신 관련 로그가 LoggerInterceptor 를 통해서 처리 되고 log를 출력합니다.
	Logger log = Logger.getLogger(this.getClass());
		
	//interface 인 sammpleService 객체를 사용하겠다는 의미, service package 에 만들어져 있음.
	@Resource(name="sampleService")
	private SampleService sampleService;
	
    //RequestMapping annotation 에 매핑한 URI 은 현재 클래스가 작동될 URI 를 의미합니다.
	@RequestMapping(value="/sample/sampleList.do")
	//ex> http://Hostname/root context/sample/sampleList.do 가 실행되면 아래 코드가 실행됩니다.
    public ModelAndView openSampleBoardList(Map<String,Object> commandMap) throws Exception{
		List<Map<String,Object>> list = sampleService.selectBoardList(commandMap);	 //servive package의 serviceimpl 에서 구현한 로직을 수행  
    	ModelAndView mv = new ModelAndView("/sample/sampleList2"); 					// 화면에 보여줄 jsp 파일 지정 합니다. 
    	mv.addObject("list", list);	//지정한 jsp 에 결과 리스트를 전달한다.
    	return mv;
    }
	
	// test 용으로 제작한 기능, session parameter map 에 들어있는 key, value 를 보기 위함이다.
	@RequestMapping(value="/sample/testMapArgumentResolver.do")
	public ModelAndView testMapArgumentResolver(CommandMap commandMap) throws Exception{
	    ModelAndView mv = new ModelAndView("");
	     
	    if(commandMap.isEmpty() == false){
	        Iterator<Entry<String,Object>> iterator = commandMap.getMap().entrySet().iterator();
	        Entry<String,Object> entry = null;
	        while(iterator.hasNext()){
	            entry = iterator.next();
	            log.debug("key : "+entry.getKey()+", value : "+entry.getValue());
	        }
	    }
	    return mv;
	}
	//작성 화면 샘플 페이지
	@RequestMapping(value="/sample/sampleWrite.do")
	public ModelAndView openSampleWrite(CommandMap commandMap) throws Exception{
	    ModelAndView mv = new ModelAndView("/sample/sampleWrite");
	    return mv;
	}
	//db insert 로직
	@RequestMapping(value="/sample/insertSampleList.do")
	public ModelAndView insertSampleRow(CommandMap commandMap) throws Exception{
		sampleService.insertSampleList(commandMap.getMap()); // 쿼리 작성 안되어 있음.
	    ModelAndView mv = new ModelAndView("redirect:/sample/sampleList.do");
	    return mv;
	}
	
	@RequestMapping(value="/sample/updateBoard.do")
	public ModelAndView updateSampleRow(CommandMap commandMap) throws Exception{
		ModelAndView mv = new ModelAndView("/sample/updateSampleList");
		//sampleService.updateSampleRow
		
		return mv;
	}
	
>>>>>>> refs/heads/develop_bakup
}
