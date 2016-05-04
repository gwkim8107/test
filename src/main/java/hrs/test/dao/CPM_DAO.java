package hrs.test.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import hrs.common.dao.AbstractDAO;

@Repository("cpmDAO")
public class CPM_DAO extends AbstractDAO{

	public List<Map<String, Object>> getCallback(Map<String, Object> map) throws Exception{
		// TODO Auto-generated method stub
		return (List<Map<String, Object>>)selectList("cpm.getResJsonData",map);
	}

}
