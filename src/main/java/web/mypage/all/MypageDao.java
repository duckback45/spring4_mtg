package web.mypage.all;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import web.mypage.all.MypageModel;
import web.member.all.MemberModel;

@Repository
public class MypageDao {
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<MypageModel> myArticleList(String session_member_name) {
		return sqlSessionTemplate.selectList("mypage.mypage",session_member_name);
	}

	public List<MypageModell> myInforList(String session_member_name) {
		return sqlSessionTemplate.selectList("mypage.mypage1",session_member_name);
	}

	
	
	
	public MemberModel getMemberModel(int member_name) {
		return sqlSessionTemplate.selectOne("mypage.memberOne",member_name);
	}
	
	

	
	
	
}
