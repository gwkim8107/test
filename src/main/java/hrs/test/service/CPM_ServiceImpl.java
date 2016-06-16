package hrs.test.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import hrs.test.dao.CPM_DAO;
@Service("cpm_Service")
public class CPM_ServiceImpl implements CPM_Service {
	// Log 클래스 선언
	Logger log = Logger.getLogger(this.getClass());
	
	//DAO 선언
	@Resource(name="cpmDAO")
	private CPM_DAO cpmDAO;
	
	@Override
	public List<Map<String, Object>> getCallback(Map<String, Object> map) throws Exception {
		// TODO Auto-generated method stub
		// DB (hrs) 에서 callback table 의 res column 의 데이터를 가져오는 것이 목표 
		return cpmDAO.getCallback(map);
	}
}