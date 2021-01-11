package web.qna.all;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import web.common.all.pagingAction;
import web.member.all.MemberModel;

@Controller
public class QnaController {

	@Resource(name = "qnaService") // �씠嫄곗븞�븯硫� �븞�맖.!
	private QnaService qnaService;
	private QnaReplyModel qnaReplyModel;
	private QnaModel qnaModel;
	List<QnaModel> list = new ArrayList<QnaModel>();
	private int searchN;
	private String search;

	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 10;
	private int blockPage = 5;
	private String pagingHtml;
	private pagingAction page;
	private Date regdate;

	@RequestMapping("/qnaList.mtg")
	public ModelAndView qnaList(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();

		list = qnaService.getQnaList();
		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		totalCount = list.size();
		page = new pagingAction(currentPage, totalCount, blockCount, blockPage, "qnaList");
		pagingHtml = page.getPagingHtml().toString();
		int lastCount = totalCount;

		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;

		list = list.subList(page.getStartCount(), lastCount);

		mav.addObject("pagingHtml", pagingHtml);
		mav.addObject("currentPage", currentPage);
		mav.addObject("list", list);
		mav.setViewName("qnaList");
		return mav;
	}

	@RequestMapping(value = "/qnaList.mtg", method = RequestMethod.POST)
	public ModelAndView qnaListSearch(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();

		search = request.getParameter("search");
		System.out.println("--------");
		System.out.println(search);

		if (search != null) {
			searchN = Integer.parseInt(request.getParameter("searchN"));
			System.out.println(searchN);

			if (searchN == 0)
				list = qnaService.getQnaSearchBySubject(search);
			else if (searchN == 1)
				list = qnaService.getQnaSearchByContent(search);
			else if (searchN == 2)
				list = qnaService.getQnaSearchBySubjectOrContent(search);
			else if (searchN == 3)
				list = qnaService.getQnaSearchByWriter(search);

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
			mav.setViewName("qnaList");
			return mav;
		}

		list = qnaService.getQnaList();

		totalCount = list.size();
		page = new pagingAction(currentPage, totalCount, blockCount, blockPage, "qnaList");
		pagingHtml = page.getPagingHtml().toString();
		int lastCount = totalCount;

		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;

		list = list.subList(page.getStartCount(), lastCount);

		mav.addObject("pagingHtml", pagingHtml);
		mav.addObject("currentPage", currentPage);
		mav.addObject("list", list);
		mav.setViewName("qnaList");
		return mav;
	}

	@RequestMapping("/qnaWriteForm.mtg")
	public ModelAndView qnaWriteForm() {

		ModelAndView mav = new ModelAndView();

		mav.setViewName("qnaWriteForm");
		return mav;

	}

	@RequestMapping(value = "/qnaWrite.mtg", method = RequestMethod.POST)
	public String qnaWrite(QnaModel qnaModel, HttpServletRequest request, HttpSession session) {

		MemberModel member = (MemberModel) session.getAttribute("mem");

		qnaModel.setContent(request.getParameter("content").replaceAll("\r\n", "<br />"));
		qnaModel.setWriter(member.getMem_nickname());

		qnaModel.setTitle(request.getParameter("title"));

		System.out.println(request.getParameter("content"));
		System.out.println(request.getParameter("writer"));

		System.out.println(request.getParameter("title"));
		/*
		 * String content = request.getParameter("content").replaceAll("\r\n",
		 * "<br />"); System.out.println(content);
		 */

		qnaService.Write(qnaModel);

		return "redirect:qnaList.mtg";
	}

	/* qnaWrite.mtg?qna_no=${qnaModel.no} */

	@RequestMapping("/qnaModifyForm.mtg")
	public ModelAndView qnaModifyForm(HttpServletRequest request, HttpSession session, QnaModel qnaModel) {
		ModelAndView mav = new ModelAndView();

		int no = qnaModel.getNum();

		/*System.out.println(no);*/

		qnaModel = qnaService.getQnaView(no);

		/*System.out.println(qnaModel.getContent());

		System.out.println(qnaModel);*/
		mav.addObject("qnaModel", qnaModel);
		mav.setViewName("qnaModify");
		return mav;

	}

	@RequestMapping("/qnaModify.mtg")
	public ModelAndView qnaModify(QnaModel qnaModel, HttpServletRequest request, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		int num = Integer.parseInt(request.getParameter("num"));
		System.out.println("수정하는 글번호 : " + num);
		qnaModel.setNum(num);
		/*qnaModel.setContent(request.getParameter("content").replaceAll("\r\n", "<br />"));
		qnaModel.setTitle(request.getParameter("title"));
		qnaModel.setNum(no);*/
	
		qnaService.modify(qnaModel);
		System.out.println("수정이완료되었습니다.... 젭라 ㅠㅠ");
		mav.addObject("num",num);
		mav.addObject("qnaModel", qnaModel);
		mav.setViewName("redirect:qnaView.mtg?no="+num);
		return mav;
	}

	@RequestMapping("/qnaView.mtg")
	public ModelAndView qnaView(HttpServletRequest request) {

		List<QnaReplyModel> listReply;
		QnaReplyModel qnaReplyModel = new QnaReplyModel();

		ModelAndView mav = new ModelAndView();
		int no = Integer.parseInt(request.getParameter("no"));
		// Befor
		System.out.println(no);

		QnaModel qnaModel = qnaService.getQnaView(no);
		qnaService.updateQnaReadHit(no);

		qnaReplyModel.setBoard_no(no);
		listReply = qnaService.selectReplyAll(qnaReplyModel);

		System.out.println(listReply);

		qnaModel.getContent();
		System.out.println(qnaModel);

		mav.addObject("qnaReply", listReply);
		mav.addObject("currentPage", currentPage);
		mav.addObject("qnaModel", qnaModel);
		mav.setViewName("qnaView");
		return mav;

	}

	@RequestMapping("/qnaDelete.mtg")
	public String delet(HttpServletRequest request) {

		ModelAndView mav = new ModelAndView();
		int no = Integer.parseInt(request.getParameter("num"));

		// Befor
		System.out.println(no);

		QnaModel qnaModel = qnaService.getQnaView(no);
		qnaService.delete(qnaModel);

		return "redirect:qnaList.mtg";

	}

	@RequestMapping("/qnaReplyInsert.mtg")
	public String qnaReplyWrite(HttpServletRequest request, HttpSession session) {
		MemberModel member = (MemberModel) session.getAttribute("mem");
		QnaReplyModel qnaReplyModel = new QnaReplyModel();
		qnaReplyModel.setReply_content(request.getParameter("content").replaceAll("\r\n", "<br />"));
		qnaReplyModel.setReply_id(member.getMem_nickname());
		qnaReplyModel.setBoard_no(Integer.parseInt(request.getParameter("board_no")));
		System.out.println(request.getParameter("content"));
		System.out.println(request.getParameter("writer"));
		System.out.println(request.getParameter("comment_num"));

		qnaService.WriteReply(qnaReplyModel);

		return "redirect:qnaList.mtg";
	}

	@RequestMapping("/qnaReplyDelete.mtg")
	public String replyDelete(HttpServletRequest request) {

		QnaReplyModel qnaReplyModel = new QnaReplyModel();

		ModelAndView mav = new ModelAndView();
		int board_no = Integer.parseInt(request.getParameter("num"));
		int reply_no = Integer.parseInt(request.getParameter("reply_no"));

		qnaReplyModel.setBoard_no(board_no);
		qnaReplyModel.setReply_no(reply_no);

		qnaService.deleteReply(qnaReplyModel);

		return "redirect:qnaList.mtg";

	}

}
