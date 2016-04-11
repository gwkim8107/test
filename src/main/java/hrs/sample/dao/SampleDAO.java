package hrs.sample.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import hrs.common.dao.AbstractDAO;

//현재 이 클래스가 DAO( Data Access Object ) 라는것을 명명 해주는것. 쉽게 말해 Object 형태의 데이터를 저장하는 저장소이고 전달해주는 역활
@Repository("sampleDAO")  
public class SampleDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectBoardList(Map<String, Object> map) throws Exception{
		//Sample_SQL.xml 의 ( Name space : sample, query id : selectBoardList ) 결과를 리턴한다
		return (List<Map<String, Object>>)selectList("sample.selectBoardList", map);  
	}
	
	public void insertSampleList(Map<String, Object> commandMap) {
		insert("sample.insertSampleList", commandMap);
	}
}
