package web.plan.all;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import web.mypage.all.MypageModell;


@Repository
public class PlanDao {

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
/*	 @Autowired private SqlSessionTemplate sqlSessionTemplate;*/
	
	
	public List<PlanModel> getPlanList() {
	        return sqlSessionTemplate.selectList("plan.planList");
	       // System.out.println(sqlSessionTemplate);
	    }
	 
	
	 public PlanModel getPlanListOne(int idx) {
	        return sqlSessionTemplate.selectOne("plan.planListOne", idx);
	    }
	 
	 public void insert(PlanModel planModel){
		 sqlSessionTemplate.insert("plan.insert", planModel);
	 
	 }
	 
	 public void update(PlanModel planModel) {
		   sqlSessionTemplate.update("plan.update", planModel);
	    }
	 public void delete(int idx) {
		 sqlSessionTemplate.delete("plan.delete", idx);
	 
	 }
	 public List<PlanModel> myTourList(String session_member_name) {
			return sqlSessionTemplate.selectList("plan.myplanList",session_member_name);
		}
	 public List<PlanModel> getSelectSearch(Map map) {
	        return sqlSessionTemplate.selectList("plan.selectSearch", map);
	      
	    }
	 public void updateReadCount(int idx) {
		   sqlSessionTemplate.update("plan.updateReadCount", idx);
	    }
	 public void updatelike(int idx) {
		   sqlSessionTemplate.update("plan.updatelike", idx);
	    }

}
