package web.review.all;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import web.notice.all.NoticeModel;

@Service
public class ReviewService {
	
	@Resource(name = "reviewDao")
	private ReviewDao reviewDao;

	// 게시판의 모든 글을 조회
	public List<ReviewModel> getReviewList() {
		return reviewDao.getReviewList();
	}
	
	// 여행기 작성
	public void insertReview(ReviewModel review) {
		reviewDao.insertReview(review);
	}
	
	// 게시판 상세보기 
	public ReviewModel getReviewView(int num) {
		return reviewDao.getReviewView(num);
	}
	
	// 게시판 상세보기 : 조회수 1 증가
	public void updateReviewReadhit(int num) {
		reviewDao.updateReadhit(num);
	}
	
	//게시판 수정
	public void updateReview(ReviewModel reviewModel) {
		reviewDao.reviewUpdate(reviewModel);
	}

	public void deleteReview(int num) {
		reviewDao.deleteReview(num);
	}

}
