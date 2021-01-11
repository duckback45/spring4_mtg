package web.information.all;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;


import web.information.all.InformationModel;
import web.plan.all.PlanModel;



@Repository
public class InformationDAO {

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
/*	 @Autowired private SqlSessionTemplate sqlSessionTemplate;*/
	
	
	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	public List<InformationModel> getInformationList() {
	        return sqlSessionTemplate.selectList("information.informationList");
	       // System.out.println(sqlSessionTemplate);
	    }
	 
	
	 public InformationModel getInformationListOne(int num) {
	        return sqlSessionTemplate.selectOne("information.informationListOne", num);
	    }
	 
	 public void insert(InformationModel informationModel){
		 sqlSessionTemplate.insert("information.informationInsert", informationModel);
	 
	 }
	 
	 public void update(InformationModel informationModel) {
		   sqlSessionTemplate.update("information.informationUpdate", informationModel);
	    }
	 public void delete(int num) {
		 sqlSessionTemplate.delete("information.informationDelete", num);
	 
	 }
	 public void WriteReply(InformationComModel informationComModel) {
		 sqlSessionTemplate.insert("information.insertInfomationCom",informationComModel);
}
	 
	public void deleteReply(InformationComModel informationComModel) {
		 sqlSessionTemplate.delete("information.deleteInfomationCom",informationComModel);
}
	

	public List<InformationComModel> selectReplyAll(InformationComModel informationComModel) {
		return sqlSessionTemplate.selectList("information.selectInfomationCom", informationComModel);
}
	public List<InformationModel> getSelectSearch(Map map) {
        return sqlSessionTemplate.selectList("information.selectSearch", map);
      
    }
	public void readhit(int num) {
	   sqlSessionTemplate.update("information.readhit", num);
    }
	public void like(int num) {
	   sqlSessionTemplate.update("information.like", num);
    }


}


	
	
	
	
	
	
	
	
	

