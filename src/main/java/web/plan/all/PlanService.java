package web.plan.all;

import java.util.List;
import java.util.Map;
import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import web.mypage.all.MypageModell;



@Service
public class PlanService {

	@Resource(name="planDao")
	private PlanDao planDao;
	
/*private PlanDao planDao;*/

public List<PlanModel> getPlanList(){
	return planDao.getPlanList();
	//System.out.println();
}

public PlanModel getPlanListOne(int idx){
	return planDao.getPlanListOne(idx);
}

public void insert(PlanModel planModel){
	planDao.insert(planModel);

}

public void update(PlanModel planModel) {
	   planDao.update(planModel);
   }
public List<PlanModel> myTourList(String session_member_name) {
	return planDao.myTourList(session_member_name);
}
public void delete(int idx) {
	 planDao.delete(idx);
}
public List<PlanModel> getSelectSearch(Map map){
	return planDao.getSelectSearch(map);
}
public void updateReadCount(int idx) {
	   planDao.updateReadCount(idx);
 }
public void updatelike(int idx) {
	   planDao.updatelike(idx);
}
}