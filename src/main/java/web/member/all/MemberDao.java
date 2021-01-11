package web.member.all;

import java.util.List;
import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import web.member.all.MemberModel;

@Repository
public class MemberDao {
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	public MemberModel memberLogin(MemberModel mem) {
		return sqlSessionTemplate.selectOne("member.login",mem);
	}
	public MemberModel getMember(String id) {
		return sqlSessionTemplate.selectOne("member.getMember", id);
	}

	public Object insertMember(MemberModel mem) {
		return sqlSessionTemplate.selectOne("member.insertMember", mem);
	}

	public List<MemberModel> getMemberList() {
		return sqlSessionTemplate.selectList("member.selectAll");
	}

	public MemberModel idFindByNickname(MemberModel member) {
		return sqlSessionTemplate.selectOne("member.idfind", member);
	}
	
	public MemberModel pwFindById(MemberModel member) {
		return sqlSessionTemplate.selectOne("member.pwfind", member);
	}
	
	public void memberModify(MemberModel member) {
		sqlSessionTemplate.update("member.updateMember", member);
	}

	public Object memberDelete(String mem_nickname) {
		return sqlSessionTemplate.selectOne("member.deleteMember", mem_nickname);
	}
}
