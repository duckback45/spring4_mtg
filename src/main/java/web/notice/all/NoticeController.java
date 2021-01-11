package web.notice.all;

import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import web.common.all.pagingAction;
import web.member.all.MemberModel;

@Controller
public class NoticeController {

	List<NoticeModel> list = new ArrayList<NoticeModel>();
	private int searchN;
	private String search;
	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 10;
	private int blockPage = 5;
	private String pagingHtml;
	private pagingAction page;
	private Date regdate;

	@Resource(name = "noticeService")
	private NoticeService noticeService;

	ModelAndView mav = new ModelAndView();

	@RequestMapping("noticeForm.mtg")
	public ModelAndView noticeForm(HttpServletRequest request, HttpSession session) {

		mav.setViewName("noticeForm");
		return mav;
	}

	@RequestMapping(value = "/noticeWrite.mtg", method = RequestMethod.POST)
	public ModelAndView noticeWrite(NoticeModel notice, HttpSession session) throws Exception {
		// �꽭�뀡�뿉�꽌 濡쒓렇�씤�맂 �쉶�썝�쓽 �땳�꽕�엫�쓣 諛쏆븘�꽌 String 蹂��닔�뿉 ���옣�븳�떎
		MemberModel member = (MemberModel) session.getAttribute("mem");
		
		System.out.println("�꽭�뀡�뿉�꽌 �삩 �땳�꽕�엫 : " + member.getMem_nickname());
		
		// notice�쓽 湲��벖�씠�뿉 諛쏆븘�삩 �땳�꽕�엫�쓣 �뀑�똿
		notice.setWriter(member.getMem_nickname());
		System.out.println("湲��벐�뒗 �깉�겮 : " + notice.getWriter() + " , 湲� �젣紐� : " + notice.getTitle() + " , 湲� �궡�슜 : "
				+ notice.getContent());
		// 諛쏆븘�삩 �젙蹂대뱾�쓣 db濡� �꽦 �꽦 �뀉
		noticeService.insertNotice(notice);
		mav.setViewName("redirect:noticeList.mtg");
		return mav;
	}

	@RequestMapping("/noticeModifyForm.mtg")
	public ModelAndView noticeModifyForm(@ModelAttribute("noticeview") NoticeModel notice, BindingResult result,
			HttpServletRequest request) {

		ModelAndView mav = new ModelAndView();
		int num = Integer.parseInt(request.getParameter("num"));
		notice = noticeService.getNoticeView(num);

		mav.addObject("notice", notice);
		mav.setViewName("noticeModify");

		return mav;
	}

	@RequestMapping(value = "/noticeModify.mtg", method = RequestMethod.POST)
	public ModelAndView noticeModify(@ModelAttribute("noticeModel") NoticeModel notice, BindingResult result,
			HttpServletRequest request) throws ParseException {
		noticeService.updateNotice(notice);
		int num = notice.getNum();
		mav.addObject("num", num);
		mav.addObject("notice", notice);
		mav.setViewName("redirect:noticeView.mtg");
		return mav;
	}

	@RequestMapping("/noticeList.mtg")
	public ModelAndView noticeList(HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView();

		if (session.getAttribute("session_member_id") == null) {
			mav.setViewName("loginConfirm");
			return mav;
		}
		
		list = noticeService.getNoticeList();
		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		totalCount = list.size();
		page = new pagingAction(currentPage, totalCount, blockCount, blockPage, "noticeList");
		pagingHtml = page.getPagingHtml().toString();
		int lastCount = totalCount;

		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;

		list = list.subList(page.getStartCount(), lastCount);

		mav.addObject("pagingHtml", pagingHtml);
		mav.addObject("currentPage", currentPage);
		mav.addObject("list", list);
		mav.setViewName("noticeList");
		return mav;
	}

	@RequestMapping(value = "/noticeList.mtg", method = RequestMethod.POST)
	public ModelAndView noticeListSearch(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		search = request.getParameter("search");
		System.out.println("--------");
		System.out.println(search);

		if (search != null) {
			searchN = Integer.parseInt(request.getParameter("searchN"));
			System.out.println(searchN);
			if (searchN == 0)
				list = noticeService.getNoticeSearchByTitle(search);
			else if (searchN == 1)
				list = noticeService.getNoticeSearchByContent(search);

			totalCount = list.size();
			page = new pagingAction(currentPage, totalCount, blockCount, blockPage, search);
			pagingHtml = page.getPagingHtml().toString();

			int lastCount = totalCount;

			if (page.getEndCount() < totalCount)
				lastCount = page.getEndCount() + 1;

			list = list.subList(page.getStartCount(), lastCount);
			mav.addObject("pagingHtml", pagingHtml);
			mav.addObject("currentPage", currentPage);
			mav.addObject("list", list);
			mav.setViewName("noticeList");
			return mav;
		}

		list = noticeService.getNoticeList();

		totalCount = list.size();
		page = new pagingAction(currentPage, totalCount, blockCount, blockPage, "noticeList");
		pagingHtml = page.getPagingHtml().toString();
		int lastCount = totalCount;

		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;

		list = list.subList(page.getStartCount(), lastCount);

		mav.addObject("pagingHtml", pagingHtml);
		mav.addObject("currentPage", currentPage);
		mav.addObject("list", list);
		mav.setViewName("noticeList");
		return mav;
	}

	@RequestMapping("/noticeView.mtg")
	public ModelAndView noticeView(HttpServletRequest request) {

		ModelAndView mav = new ModelAndView();
		int num = Integer.parseInt(request.getParameter("num"));
		NoticeModel notice = noticeService.getNoticeView(num);
		noticeService.updateNoticeReadHit(num);
		mav.addObject("currentPage", currentPage);
		mav.addObject("notice", notice);
		mav.setViewName("noticeView");
		return mav;
	}

	@RequestMapping("/noticeDelete.mtg")
	public ModelAndView noticeDelete(@ModelAttribute("noticeview") NoticeModel notice, BindingResult result,
			HttpServletRequest request) {

		ModelAndView mav = new ModelAndView();
		int num = Integer.parseInt(request.getParameter("num"));
		noticeService.deleteNotice(num);

		mav.setViewName("redirect:noticeList.mtg");

		return mav;
	}
}
