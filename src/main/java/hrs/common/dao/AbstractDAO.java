package hrs.common.dao;

import java.util.List;
<<<<<<< HEAD

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

/*
 * 쿼리는 sqlSession.메서드를 호출하면 되는데, 여기서는 앞으로 개발할때, 
 * 좀 더 보기편하게 로그를 남기기위해서 여기에서 insert, delete, update, select 메서드를 재정의 하여 사용하기로 함.
 */

public class AbstractDAO {
	protected Log log = LogFactory.getLog(AbstractDAO.class);
	// "/src/main/resources/config/spring/context-mapper.xml" 에 sqlSessionTemplate 선언한걸 annotation 으로 자동매칭
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	protected void printQueryId(String queryId) {
		if(log.isDebugEnabled()){
			log.debug("\t QueryId  \t:  " + queryId);
		}
	}
	
	public Object insert(String queryId, Object params){
		printQueryId(queryId);
		return sqlSession.insert(queryId, params);
	}
	
	public Object update(String queryId, Object params){
		printQueryId(queryId);
		return sqlSession.update(queryId, params);
	}
	
	public Object delete(String queryId, Object params){
		printQueryId(queryId);
		return sqlSession.delete(queryId, params);
	}
	
	public Object selectOne(String queryId){
		printQueryId(queryId);
		return sqlSession.selectOne(queryId);
	}
	
	public Object selectOne(String queryId, Object params){
		printQueryId(queryId);
		return sqlSession.selectOne(queryId, params);
	}
	
	@SuppressWarnings("rawtypes")
	public List selectList(String queryId){
		printQueryId(queryId);
		return sqlSession.selectList(queryId);
	}
	
	@SuppressWarnings("rawtypes")
	public List selectList(String queryId, Object params){
		printQueryId(queryId);
		return sqlSession.selectList(queryId,params);
=======
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.codehaus.plexus.util.StringUtils;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

/*
 * 쿼리는 sqlSession.메서드를 호출하면 되는데, 여기서는 앞으로 개발할때, 
 * 좀 더 보기편하게 로그를 남기기위해서 여기에서 insert, delete, update, select 메서드를 재정의 하여 사용하기로 함.
 */

public class AbstractDAO {
	protected Log log = LogFactory.getLog(AbstractDAO.class);
	// "/src/main/resources/config/spring/context-mapper.xml" 에 sqlSessionTemplate 선언한걸 annotation 으로 자동매칭
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	protected void printQueryId(String queryId) {
		if(log.isDebugEnabled()){
			log.debug("\t QueryId  \t:  " + queryId);
		}
	}
	
	public Object insert(String queryId, Object params){
		printQueryId(queryId);
		return sqlSession.insert(queryId, params);
	}
	
	public Object update(String queryId, Object params){
		printQueryId(queryId);
		return sqlSession.update(queryId, params);
	}
	
	public Object delete(String queryId, Object params){
		printQueryId(queryId);
		return sqlSession.delete(queryId, params);
	}
	
	public Object selectOne(String queryId){
		printQueryId(queryId);
		return sqlSession.selectOne(queryId);
	}
	
	public Object selectOne(String queryId, Object params){
		printQueryId(queryId);
		return sqlSession.selectOne(queryId, params);
	}
	
	@SuppressWarnings("rawtypes")
	public List selectList(String queryId){
		printQueryId(queryId);
		return sqlSession.selectList(queryId);
	}
	
	@SuppressWarnings("rawtypes")
	public List selectList(String queryId, Object params){
		printQueryId(queryId);
		return sqlSession.selectList(queryId,params);
	}
	
	@SuppressWarnings("unchecked")
	public Object selectPagingList(String queryId, Object params){
		printQueryId(queryId);
		Map<String, Object> map = (Map<String, Object>)params;
		String pageIndex = (String)map.get("PAGE_INDEX");
		String pageRow = (String)map.get("PAGE_ROW");
		int nPageIndex = 0;
		int nPageRow   = 20;
		
		if(StringUtils.isEmpty(pageIndex) == false){
			nPageIndex = Integer.parseInt(pageIndex)-1;
		}
		if(StringUtils.isEmpty(pageRow) == false){
			nPageRow    = Integer.parseInt(pageIndex);
		}
		map.put("START", (nPageIndex * nPageRow) + 1);
		map.put("END", (nPageIndex * nPageRow) + nPageRow);
		
		return sqlSession.selectList(queryId, map);
>>>>>>> refs/heads/develop_bakup
	}
}
