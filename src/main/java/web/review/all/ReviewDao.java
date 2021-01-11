package web.review.all;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ReviewDao {

	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;

	public void setSqlSessionTemplate(SqlSessionTemplate sqlSessionTemplate) {
		this.sqlSessionTemplate = sqlSessionTemplate;
	}

	// 여행기 게시판 테이블의 모든 내용을 불러온다 
	public List<ReviewModel> getReviewList() {
		return sqlSessionTemplate.selectList("review.reviewList");
	}
	
	// 게시판 상세보기 
	public ReviewModel getReviewView(int num) {
		return sqlSessionTemplate.selectOne("review.getReviewOne", num);
	}
	
	// 게시판의 조회수를 올려준다
	public void updateReadhit(int num) {
		sqlSessionTemplate.selectOne("review.updateReadhit", num);
	}
	
	// 여행기 게시판에 글 작성
	public void insertReview(ReviewModel review) {
		sqlSessionTemplate.insert("review.insertReview", review);
	}

	//게시판 수정
	public void reviewUpdate(ReviewModel review) {
		sqlSessionTemplate.update("review.updateReview", review);
	}

	public void deleteReview(int num) {
		sqlSessionTemplate.delete("review.deleteReview", num);
	}
}
