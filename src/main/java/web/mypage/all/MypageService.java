package web.mypage.all;

import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import web.mypage.all.MypageModel;
import web.member.all.MemberModel;
import web.member.all.MemberDao;




@Service
public class MypageService {
	@Resource(name="mypageDao")
	private MypageDao mypageDao;
	
	public List<MypageModel> myArticleList(String session_member_id) {
		return mypageDao.myArticleList(session_member_id);
	}
	
	public List<MypageModell> myInforList(String session_member_id) {
		return mypageDao.myInforList(session_member_id);
	}
	

	public MemberModel getMemberModel(int member_id) {
		return mypageDao.getMemberModel(member_id);
	}
	
	
	
	
	
	
}
