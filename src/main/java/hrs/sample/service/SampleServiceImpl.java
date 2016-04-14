package hrs.sample.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import hrs.sample.dao.SampleDAO;
//Cotroller 에 등록한 sampleService 를 Service Bean 으로 등록한다.
@Service("sampleService")
public class SampleServiceImpl implements SampleService{
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="sampleDAO")
	private SampleDAO sampleDAO;
	
	@Override
	public List<Map<String, Object>> selectBoardList(Map<String, Object> commandMap) throws Exception {
		return sampleDAO.selectBoardList(commandMap);
		
	}

	@Override
	public void insertSampleList(Map<String, Object> commandMap) throws Exception {
		sampleDAO.insertSampleList(commandMap);
	}
    
	
}
