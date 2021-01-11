package web.member.all;

import java.util.List;
import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import web.member.all.MemberModel;
import web.member.all.MemberDao;

@Service
public class MemberService {
	@Resource(name = "memberDao")
	private MemberDao memberDao;

	public MemberModel memberLogin(MemberModel mem) {
		return memberDao.memberLogin(mem);
	}

	public MemberModel getMember(String id) {

		return memberDao.getMember(id);
	}

	public Object insertMember(MemberModel memberModel) {
		return memberDao.insertMember(memberModel);
	}

	public List<MemberModel> getMemberList() {
		return memberDao.getMemberList();
	}

	public MemberModel idFindByNickname(MemberModel member) {
		return memberDao.idFindByNickname(member);
	}

	public MemberModel pwFindById(MemberModel member) {
		return memberDao.pwFindById(member);
	}

	public void memberModify(MemberModel member) {
		 memberDao.memberModify(member);
	}

	public Object memberDelete(String mem_nickname) {
		return memberDao.memberDelete(mem_nickname);
	}

}