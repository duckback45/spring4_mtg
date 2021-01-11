package web.notice.all;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

@Service
public class NoticeService {

	@Resource(name = "noticeDao")
	private NoticeDao noticeDao;

	public void insertNotice(NoticeModel noticeModel) {
		noticeDao.insertNotice(noticeModel);
	}

	public List<NoticeModel> getNoticeList() {
		return noticeDao.getNoticeList();
	}

	public NoticeModel getNoticeView(int num) {
		return noticeDao.getNoticeView(num);
	}

	public List<NoticeModel> getNoticeSearchByTitle(String search) {
		return noticeDao.getNoticeSearchByTitle(search);
	}

	public List<NoticeModel> getNoticeSearchByContent(String search) {
		return noticeDao.getNoticeSearchByContent(search);
	}

	public void updateNoticeReadHit(int num) {
		noticeDao.updateReadHit(num);
	}

	public void updateNotice(NoticeModel noticeModel) {
		noticeDao.noticeUpdate(noticeModel);
	}

	public int deleteNotice(int num) {
		return noticeDao.deleteNotice(num);
	}
}
