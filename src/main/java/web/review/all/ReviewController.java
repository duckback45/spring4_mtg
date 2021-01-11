package web.review.all;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import web.member.all.MemberModel;

@Controller
public class ReviewController {
	
	List<ReviewModel> list = new ArrayList<ReviewModel>();
	
	@Resource(name = "reviewService")
	private ReviewService reviewService;
	
	// 여행기 게시판 리스트
	@RequestMapping(value = "/reviewList.mtg", method = RequestMethod.GET)
	public ModelAndView reviewList() {
		list = reviewService.getReviewList();
		ModelAndView mav = new ModelAndView();
		mav.addObject("getReviewList", list);
		mav.setViewName("reviewList");
		return mav;
	}
	
	//  여행기 게시판 상세보기
	@RequestMapping("/reviewView.mtg")
	public ModelAndView reviewView(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		int num = Integer.parseInt(request.getParameter("num"));
		reviewService.updateReviewReadhit(num);
		ReviewModel review = reviewService.getReviewView(num);
		mav.addObject("review", review);
		mav.setViewName("reviewView");
		return  mav;
	}
	
	// 여행기 게시판 작성 폼으로 이동
	@RequestMapping(value = "/reviewWriteForm.mtg")
	public ModelAndView reviewWriteForm() {
		return  new ModelAndView("reviewWriteForm");
	}
	
	@RequestMapping(value = "reviewWrite.mtg", method = RequestMethod.POST)
	public ModelAndView reviewWrite(ReviewModel review, HttpSession session) {
		MemberModel mem = (MemberModel) session.getAttribute("mem");
		/*System.out.println("id : " + mem.getMem_id() + " , nickname : " + mem.getMem_nickname());*/
		review.setWriter(mem.getMem_nickname());
		 /* System.out.println("글 쓴애 : " + review.getWriter() + " , 글 내용 : " + review.getContent());*/
		reviewService.insertReview(review);
		return new ModelAndView("redirect:/reviewList.mtg");
	}
	
	//여행기 수정폼으로 이동
	@RequestMapping("/reviewUpdateForm.mtg")
	public ModelAndView reviewUpdateForm(ReviewModel review, BindingResult result,
			HttpServletRequest request) {

		ModelAndView mav = new ModelAndView();
		int num = Integer.parseInt(request.getParameter("num"));
		review = reviewService.getReviewView(num);

		mav.addObject("review", review);
		mav.setViewName("reviewUpdate");

		return mav;
	}

	//여행기 수정
	@RequestMapping(value = "/reviewUpdate.mtg", method = RequestMethod.POST)
	public ModelAndView reviewUpdate(ReviewModel review, BindingResult result,
			HttpServletRequest request) throws ParseException {
		ModelAndView mav = new ModelAndView();
		reviewService.updateReview(review);
		int num = review.getNum();
		/*System.out.println(num + " : 글번호");*/
		mav.addObject("num", num);
		mav.addObject("review", review);
		mav.setViewName("redirect:reviewView.mtg");
		return mav;
	}

	
	@RequestMapping(value = "/reviewfile_upload.mtg", method = RequestMethod.POST)
	public String reviewUpload(FileBean fileBean, HttpServletRequest request, Model model) {

		HttpSession session = request.getSession();
		String root_path = session.getServletContext().getRealPath("/"); // 웹서비스
																			// root경로
		String attach_path = "resources/files/attach/";

		MultipartFile upload = fileBean.getUpload();
		String filename = "";
		String CKEditorFuncNum = "";
		if (upload != null) {
			filename = upload.getOriginalFilename();
			fileBean.setFilename(filename);
			CKEditorFuncNum = fileBean.getCKEditorFuncNum();
			try {
				File file = new File(root_path + attach_path + filename);
				upload.transferTo(file);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		String file_path = "/mtg/" + attach_path + filename;
		model.addAttribute("file_path", file_path);
		model.addAttribute("CKEditorFuncNum", CKEditorFuncNum);

		return "/review/reviewfileupload";
	}
	
	@RequestMapping("/reviewDelete.mtg")
	public ModelAndView reviewDelete(ReviewModel review) {
		int num = review.getNum();
		reviewService.deleteReview(num);
		return new ModelAndView("redirect:reviewList.mtg");
	}
}
