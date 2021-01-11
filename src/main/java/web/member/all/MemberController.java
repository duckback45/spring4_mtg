package web.member.all;

import java.util.ArrayList;
import java.util.List;
import java.io.PrintWriter;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import web.common.all.pagingAction;

@Controller
public class MemberController {

	@Resource(name = "memberService")
	private MemberService memberService;

	ModelAndView mav = new ModelAndView();
	List<MemberModel> list = new ArrayList<MemberModel>();
	private int currentPage = 1;
	private int totalCount;
	private int blockCount = 10;
	private int blockPage = 5;
	private String pagingHtml;
	private pagingAction page;

	// 로그인
	@RequestMapping(value = "/login.mtg", method = RequestMethod.POST)
	public ModelAndView memberLogin(HttpServletRequest request, MemberModel mem,HttpServletResponse response)throws Exception  {
		MemberModel result = memberService.memberLogin(mem);

		if (result != null) {
			HttpSession session = request.getSession();

			session.setAttribute("mem", result);
			session.setAttribute("session_member_id", result.getMem_id());
			session.setAttribute("session_member_name", result.getMem_nickname());
			mav.setViewName("main");
			return mav;
		}
		response.setContentType("text/html; charset=UTF-8"); 

        PrintWriter out = response.getWriter();  

        out.println("<script>alert('아이디와 비밀번호가 일치하지 않습니다'); history.go(-1);</script>"); 

        out.flush(); 

		mav.setViewName("main");
		return mav;

	}

	// 로그아웃
	@RequestMapping("/logout.mtg")
	public ModelAndView memberLogout(HttpServletRequest request, MemberModel mem) {

		HttpSession session = request.getSession(false);

		if (session != null) {
			session.invalidate();
		}

		mav.setViewName("redirect:/main.mtg");
		return mav;
	}

	// 회원가입
	@RequestMapping("/memberend.mtg")
	public ModelAndView memberStep3(@ModelAttribute("member") MemberModel member) {
		memberService.insertMember(member);
		mav.setViewName("main");
		return mav;
	}

	// 관리자 회원목록 조회
	@RequestMapping("memList.mtg")
	public ModelAndView memberList(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();

		list = memberService.getMemberList();
		if (request.getParameter("currentPage") == null || request.getParameter("currentPage").trim().isEmpty()
				|| request.getParameter("currentPage").equals("0")) {
			currentPage = 1;
		} else {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}

		totalCount = list.size();
		page = new pagingAction(currentPage, totalCount, blockCount, blockPage, "memList");
		pagingHtml = page.getPagingHtml().toString();
		int lastCount = totalCount;

		if (page.getEndCount() < totalCount)
			lastCount = page.getEndCount() + 1;

		list = list.subList(page.getStartCount(), lastCount);

		mav.addObject("pagingHtml", pagingHtml);
		mav.addObject("currentPage", currentPage);
		mav.addObject("list", list);
		mav.setViewName("memList");
		return mav;
	}

	// 관리자 회원탈퇴
	@RequestMapping("/adminDelete.mtg")
	public ModelAndView adminDelete(HttpServletRequest request) {

		String nickname = request.getParameter("nickname");
		System.out.println(nickname);
		memberService.memberDelete(nickname);

		return new ModelAndView("redirect: memList.mtg");
	}

	// 아이디찾기
	@RequestMapping("idfind.mtg")
	public ModelAndView memberIdFind(@ModelAttribute("member") MemberModel member, HttpServletRequest request) {

		int memberFindChk;

		String nickname = request.getParameter("mem_nickname");
		String email = request.getParameter("mem_email");

		member.setMem_nickname(nickname);
		member.setMem_email(email);

		member = memberService.idFindByNickname(member);
		if (member == null) {
			memberFindChk = 0; // 가입되어 있는 사람 X;
			mav.addObject("memberFindChk", memberFindChk);
			mav.setViewName("idFindError");
			return mav;

		} else {
			if (member.getMem_nickname().equals(nickname) && member.getMem_email().equals(email)) {
				memberFindChk = 1; // 회원가입되어 있음, 이메일 일치
				mav.addObject("member", member);
				mav.addObject("memberFindChk", memberFindChk);
				mav.setViewName("idFindOk");
				return mav;
			} else {
				memberFindChk = -1; // 이름 , 이메일 틀림
				mav.addObject("memberFindChk", memberFindChk);
				mav.setViewName("idFindError");
				return mav;
			}
		}
	}

	// 비밀번호찾기
	@RequestMapping("pwfind.mtg")
	public ModelAndView memberPwFind(@ModelAttribute("member") MemberModel member, HttpServletRequest request) {

		int memberFindChk;

		String id = request.getParameter("mem_id");
		String email = request.getParameter("mem_email");

		member.setMem_id(id);
		member.setMem_email(email);

		member = memberService.pwFindById(member);
		if (member == null) {
			memberFindChk = 0; // 가입되어 있는 사람 X;
			mav.addObject("memberFindChk", memberFindChk);
			mav.setViewName("idFindError");
			return mav;

		} else {
			if (member.getMem_id().equals(id) && member.getMem_email().equals(email)) {
				memberFindChk = 1; // 회원가입되어 있음, 이메일 일치
				mav.addObject("member", member);
				mav.addObject("memberFindChk", memberFindChk);
				mav.setViewName("pwFindOk");
				return mav;
			} else {
				memberFindChk = -1; // 이름 , 이메일 틀림
				mav.addObject("memberFindChk", memberFindChk);
				mav.setViewName("idFindError");
				return mav;
			}
		}
	}

	//회원정보수정
	@RequestMapping("/memberModify.mtg")
	public ModelAndView memberModify(MemberModel member, BindingResult result, HttpSession session) {
		if (session.getAttribute("session_member_id")==null){ 
			mav.setViewName("loginConfirm");
			return mav;
		} 	
		    memberService.memberModify(member);
			mav.addObject("MemberModel", member);
			mav.setViewName("redirect:main.mtg");
			return mav;
	
	}

@RequestMapping(value="/memberDelete.mtg")
public ModelAndView memberDelete(@RequestParam(value = "mem_nickname", required = true) String mem_nickname,HttpServletRequest request) {
	
	
	System.out.println(mem_nickname);
	memberService.memberDelete(mem_nickname);
	HttpSession session = request.getSession(false);

	if (session != null) {
		session.invalidate();
	}


	return new ModelAndView("redirect: main.mtg");
}
}