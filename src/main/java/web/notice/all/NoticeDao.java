package web.notice.all;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDao {

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;

	public void insertNotice(NoticeModel noticeModel) {
		sqlSessionTemplate.insert("notice.insertNotice", noticeModel);
	}

	public List<NoticeModel> getNoticeList() {
		return sqlSessionTemplate.selectList("notice.selectAll");
	}

	public void updateReadHit(int num) {
		sqlSessionTemplate.selectOne("notice.updateReadhit", num);
	}

	public NoticeModel getNoticeView(int num) {
		return sqlSessionTemplate.selectOne("notice.selectOne", num);
	}

	public List<NoticeModel> getNoticeSearchByTitle(String search) {
		return sqlSessionTemplate.selectList("notice.selectSearchT", search);
	}

	public List<NoticeModel> getNoticeSearchByContent(String search) {
		return sqlSessionTemplate.selectList("notice.selectSearchC", search);
	}

	public void noticeUpdate(NoticeModel noticeModel) {
		sqlSessionTemplate.update("notice.updateNotice", noticeModel);
	}

	public int deleteNotice(int num) {
		return sqlSessionTemplate.delete("notice.deleteNotice", num);
	}
}
