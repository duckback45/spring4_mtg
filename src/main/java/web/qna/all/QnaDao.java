package web.qna.all;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import web.qna.all.QnaModel;

@Repository
public class QnaDao {
	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<QnaModel> getQnaList() {
		return sqlSessionTemplate.selectList("qna.selectAll-n");
}
	public void updateQnaReadHit(int no) {
		sqlSessionTemplate.update("qna.updateReadhit-n", no);
	}
	
	public QnaModel getQnaView(int no) {
		return sqlSessionTemplate.selectOne("qna.selectOne-n", no);
	}
	public List<QnaModel> getQnaSearchBySubject(String search) {
		return sqlSessionTemplate.selectList("qna.selectSearch0-n",search);
}
	public List<QnaModel> getQnaSearchByContent(String search) {
		return sqlSessionTemplate.selectList("qna.selectSearch1-n",search);
}
	public List<QnaModel> getQnaSearchBySubjectOrContent(String search) {
		return sqlSessionTemplate.selectList("qna.selectSearch2-n",search);
}
	public List<QnaModel> getQnaSearchByWriter(String search) {
		return sqlSessionTemplate.selectList("qna.selectSearch3-n",search);
}
	
	
	public void Write(QnaModel qnaModel) {
		 sqlSessionTemplate.insert("qna.inserQna",qnaModel);
}
	
	public void modify(QnaModel qnaModel) {
		 sqlSessionTemplate.update("qna.update",qnaModel);
}
	
	public void WriteReply(QnaReplyModel qnaReplyModel) {
		 sqlSessionTemplate.insert("qna.insertReply",qnaReplyModel);
}
	 
	public void deleteReply(QnaReplyModel qnaReplyModel) {
		 sqlSessionTemplate.delete("qna.deleteReply",qnaReplyModel);
}
	public void delete(QnaModel qnaModel) {
		 sqlSessionTemplate.delete("qna.deleteQna-n",qnaModel);
}

	public List<QnaReplyModel> selectReplyAll(QnaReplyModel qnaReplyModel) {
		return sqlSessionTemplate.selectList("qna.selectReplyAll", qnaReplyModel);
}

	
	 
	}
