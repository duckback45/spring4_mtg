package web.qna.all;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import web.qna.all.QnaDao;
import web.qna.all.QnaModel;

@Service
public class QnaService{
	
	@Resource(name="qnaDao")
	private QnaDao qnaDao;
	
	public List<QnaModel> getQnaList(){
    	return qnaDao.getQnaList();
    }
	
    public QnaModel getQnaView(int no){
    	return qnaDao.getQnaView(no);
    }
    
    public List<QnaModel> getQnaSearchBySubject(String search){
		return qnaDao.getQnaSearchBySubject(search);
	 }
	 
    public List<QnaModel> getQnaSearchByContent(String search){
    	return qnaDao.getQnaSearchByContent(search);
    }
	 
    public List<QnaModel> getQnaSearchBySubjectOrContent(String search){
    	return qnaDao.getQnaSearchBySubjectOrContent(search);
    }
	 
    public List<QnaModel> getQnaSearchByWriter(String search){
    	return qnaDao.getQnaSearchByWriter(search);
    }
    
	 public void updateQnaReadHit(int no){
		 qnaDao.updateQnaReadHit(no);
	 }

	 public void Write(QnaModel qnaModel){
		 qnaDao.Write(qnaModel);
	 }
	 
	 public void modify(QnaModel qnaModel){
		 qnaDao.modify(qnaModel);
	 }
	 
	 public void WriteReply(QnaReplyModel qnaReplyModel){
		 qnaDao.WriteReply(qnaReplyModel);
	 }
	
	 public void deleteReply(QnaReplyModel qnaReplyModel){
		 qnaDao.deleteReply(qnaReplyModel);
	 }
		 
	 public void delete(QnaModel qnaModel){
		 qnaDao.delete(qnaModel);
	 }
	
	
	public List<QnaReplyModel> selectReplyAll(QnaReplyModel qnaReplyModel){
		return qnaDao.selectReplyAll(qnaReplyModel);
	}



	 
	 
	 
	 
		
		
}
