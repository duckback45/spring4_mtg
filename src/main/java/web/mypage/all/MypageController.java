package web.mypage.all;

import java.util.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


import web.member.all.MemberModel;
import web.member.all.MemberService;

import web.mypage.all.MypageService;
import web.mypage.all.MypageModel;
import web.mypage.all.MypageDao;
import web.plan.all.PlanModel;
import web.plan.all.PlanService;
import web.common.all.pagingAction;

@Controller
public class MypageController {

	@Resource(name="mypageService") // 이거안하면 안됨.!
	private MypageService mypageService;
	
	@Resource(name="memberService")
	private MemberService memberService;
	
	@Resource(name="planService")
	private PlanService planService;

	private int currentPage = 1; // 현재 페이지
	private int totalCount;         // 총 게시물의 수
	private int blockCount = 5;  // 한 페이지의  게시물의 수
	private int blockPage = 5;    // 한 화면에 보여줄 페이지 수
	private String pagingHtml;   // 페이징을 구현한 HTML
	private pagingAction page;   // 페이징 클래스
	private String session_member_name; // 로그인한 회원의 회원번호
	
	private Calendar today = Calendar.getInstance(); // 시스템날짜

	ModelAndView mav = new ModelAndView(); // ModelAndView 객체
	
	
//질문 게시판
	@RequestMapping("/myArticleList.mtg")
	public ModelAndView myArticle(@ModelAttribute("mypageModel")MypageModel mypageModel, HttpSession session, HttpServletRequest request) throws Exception {
		
		session_member_name =  (String) session.getAttribute("session_member_name");
		
		if(session_member_name == null){
			mav.setViewName("loginConfirm");
			return mav;
		}

		if(request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty() || request.getParameter("currentPage").equals("0")) {
            currentPage = 1;
        } else {
            currentPage = Integer.parseInt(request.getParameter("currentPage"));
        }
		
		List<MypageModel> list;		
		list = mypageService.myArticleList(session_member_name);
		System.out.println(list);
		totalCount = list.size();
		
		page = new pagingAction(currentPage, totalCount, blockCount, blockPage, "myArticleList");
		pagingHtml = page.getPagingHtml().toString();
		
		int lastCount = totalCount;
		
		if(page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;
		
		list = list.subList(page.getStartCount(), lastCount);
		
		mav.addObject("list", list);
		mav.addObject("currentPage", currentPage);
        mav.addObject("pagingHtml", pagingHtml);
        mav.addObject("totalCount", totalCount);
		mav.setViewName("myArticleList");
		return mav;
	}
	
	
	
	@RequestMapping("/myInforList.mtg")
	public ModelAndView myInforList(@ModelAttribute("mypageModell")MypageModell mypageModell, HttpSession session, HttpServletRequest request) throws Exception {
		
		session_member_name =  (String) session.getAttribute("session_member_name");
		
		if(session_member_name == null){
			mav.setViewName("loginConfirm");
			return mav;
		}

		if(request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty() || request.getParameter("currentPage").equals("0")) {
            currentPage = 1;
        } else {
            currentPage = Integer.parseInt(request.getParameter("currentPage"));
        }
		
		List<MypageModell> list;		
		list = mypageService.myInforList(session_member_name);
		System.out.println(list);
		totalCount = list.size();
		
		page = new pagingAction(currentPage, totalCount, blockCount, blockPage, "myInforList");
		pagingHtml = page.getPagingHtml().toString();
		
		int lastCount = totalCount;
		
		if(page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;
		
		list = list.subList(page.getStartCount(), lastCount);
		
		mav.addObject("list", list);
		mav.addObject("currentPage", currentPage);
        mav.addObject("pagingHtml", pagingHtml);
        mav.addObject("totalCount", totalCount);
		mav.setViewName("myInforList");
		return mav;
	}
	//여행일정
	@RequestMapping("/myTourList.mtg")
	public ModelAndView myTour(@ModelAttribute("mypageModel")MypageModel mypageModel, HttpSession session, HttpServletRequest request) throws Exception {
		
		session_member_name =  (String) session.getAttribute("session_member_name");
		
		if(session_member_name == null){
			mav.setViewName("loginConfirm");
			return mav;
		}

		if(request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty() || request.getParameter("currentPage").equals("0")) {
            currentPage = 1;
        } else {
            currentPage = Integer.parseInt(request.getParameter("currentPage"));
        }
		
		List<PlanModel> list;		
		list = planService.myTourList(session_member_name);
		System.out.println(list);
		totalCount = list.size();
		
		page = new pagingAction(currentPage, totalCount, blockCount, blockPage, "myArticleList");
		pagingHtml = page.getPagingHtml().toString();
		
		int lastCount = totalCount;
		
		if(page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;
		
		list = list.subList(page.getStartCount(), lastCount);
		
		mav.addObject("list", list);
		mav.addObject("currentPage", currentPage);
        mav.addObject("pagingHtml", pagingHtml);
        mav.addObject("totalCount", totalCount);
		mav.setViewName("myTourList");
		return mav;
	}
	// 회원정보수정
	@RequestMapping(value="/MemberMypage.mtg")
	public ModelAndView memberMypage(@ModelAttribute("member") MemberModel member, BindingResult result, HttpSession session, HttpServletRequest request) {
		
		
		
		
		session.getAttribute("session_member_id");

		//미리 세션을 뛰우고, 해당 세션의 id값을 가져와 memberBean에 DB의 자료를 집어넣음
		if(session.getAttribute("session_member_id") != null){
			String id=(String)session.getAttribute("session_member_id");
			member = memberService.getMember(id);
		
			mav.addObject("member", member);
			mav.setViewName("memberModify");
			return mav;
		}
		else {
			mav.setViewName("loginConfirm");
			return mav;
		
		}
		
		
		
	

	}
	

	}

