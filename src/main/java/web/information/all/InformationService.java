package web.information.all;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;


import web.information.all.InformationDAO;
import web.information.all.InformationModel;
import web.plan.all.PlanModel;


@Service
public class InformationService {

	@Resource(name="informationDAO")
	private InformationDAO informationDAO;
	
/*private PlanDao planDao;*/



	/*public void setPlanDao(InformationDAO informationDAO) {
		this.informationDAO = informationDAO;
	}*/

public List<InformationModel> getInformationList(){
	return informationDAO.getInformationList();
	//System.out.println();
}


public InformationModel getInformationListOne(int num){
	return informationDAO.getInformationListOne(num);
}

public void insert(InformationModel informationModel){
	informationDAO.insert(informationModel);

}

public void update(InformationModel informationModel) {
	informationDAO.update(informationModel);
   }

public void delete(int num) {
	informationDAO.delete(num);
}
public void WriteReply(InformationComModel informationComModel){
	informationDAO.WriteReply(informationComModel);
}

public void deleteReply(InformationComModel informationComModel){
	informationDAO.deleteReply(informationComModel);
}
	 
public List<InformationComModel> selectReplyAll(InformationComModel informationComModel){
	return informationDAO.selectReplyAll(informationComModel);
}
public List<InformationModel> getSelectSearch(Map map){
	return informationDAO.getSelectSearch(map);
}
public void readhit(int num) {
	informationDAO.readhit(num);
 }
public void like(int num) {
	informationDAO.like(num);
}

	  
}
