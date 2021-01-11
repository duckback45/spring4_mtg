package web.review.all;

import java.util.Date;

public class ReviewModel {
	private int num; // 글 번호
	private String writer; // 글 작성자 : 로그인한 사용자의 닉네임
	private String title; // 글 제목
	private String content; // 글 내용
	private int count; // 글 추천수
	private int readhit; // 글 조회수
	private Date regdate; // 글 등록 날짜
	private String main_img; // 리스트에 보여줄 대표 이미지
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getReadhit() {
		return readhit;
	}
	public void setReadhit(int readhit) {
		this.readhit = readhit;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getMain_img() {
		return main_img;
	}
	public void setMain_img(String main_img) {
		this.main_img = main_img;
	}
	
	
}
