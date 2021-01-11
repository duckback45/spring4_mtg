package web.plan.all;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import web.member.all.MemberModel;






@Controller
public class PlanController {

	List<PlanModel> list = new ArrayList<PlanModel>();
	private static final Logger logger = LoggerFactory.getLogger(PlanController.class);
	@Resource(name = "planService") 
	private PlanService planService;
	

	@Resource(name="messageSource")
	private MessageSource messageSource;
		
	
	 @RequestMapping(value = "/planReg.mtg", method = RequestMethod.GET)
	    public ModelAndView planlist(HttpServletRequest request, HttpServletResponse respond, Model model) {
	        logger.info("display view Plan list");
	     // 野껓옙占쎄퉳占쎌뱽 占쎌맄占쎈립
	        String sch_type = request.getParameter("sch_type");
	        String sch_value = request.getParameter("sch_value");
	        String idx = request.getParameter("idx");
	        Map mapSearch = new HashMap();
	        mapSearch.put("sch_type", sch_type);
	        mapSearch.put("sch_value", sch_value);
	        System.out.println(mapSearch);
	        // 野껓옙占쎄퉳 揶쏅�れ뱽 �뀎怨쀫퓠 占쎄퐜野꺿뫁夷�
	        model.addAttribute("mapSearch", mapSearch);

	        list = planService.getSelectSearch(mapSearch);
	        /*model.addAttribute("list", list);*/
	        System.out.println(list);
	        logger.info("totcal count" + list.size() );
	        ModelAndView mav = new ModelAndView();
		     mav.addObject("list", list);
		     mav.setViewName("planreg");
	        return mav;
	    }
	
	  @RequestMapping(value="/planview.mtg",  method = RequestMethod.GET)
	    public ModelAndView dispBbsView(HttpServletResponse response, HttpServletRequest request,@RequestParam(value="idx", defaultValue="0") int idx, Model model) {
	        logger.info("display view Plan view idx = {}", idx);
	        Cookie cookies[] = request.getCookies();
		     Map mapCookie = new HashMap();
		     if(request.getCookies() != null){
			      for (int i = 0; i < cookies.length; i++) {
			        Cookie obj = cookies[i];
			        mapCookie.put(obj.getName(),obj.getValue());
			      }
			    }
		     // 占쏙옙占쎌삢占쎈쭆 �뜎醫뤾텕餓λ쵐肉� read_count 筌랃옙 �겫�뜄�쑎占쎌궎疫뀐옙
		     String cookie_read_count = (String) mapCookie.get("read_count");
		     // 占쏙옙占쎌삢占쎈쭍 占쎄퉱嚥≪뮇�뒲 �뜎醫뤾텕揶쏉옙 占쎄문占쎄쉐
		    String new_cookie_read_count = "|" + idx;
		 // 占쏙옙占쎌삢占쎈쭆 �뜎醫뤾텕占쎈퓠 占쎄퉱嚥≪뮇�뒲 �뜎醫뤾텕揶쏅�れ뵠 鈺곕똻�삺占쎈릭占쎈뮉 筌욑옙 野껓옙占쎄텢
		     if ( StringUtils.indexOfIgnoreCase(cookie_read_count, new_cookie_read_count) == -1 ) {
		          // 占쎈씨占쎌뱽 野껋럩�뒭 �뜎醫뤾텕 占쎄문占쎄쉐
		          Cookie cookie = new Cookie("read_count", cookie_read_count + new_cookie_read_count);
		          //cookie.setMaxAge(1000); // �룯�뜄�뼊占쎌맄
		          response.addCookie(cookie);

		          // 鈺곌퀬�돳占쎈땾 占쎈씜占쎈쑓占쎌뵠占쎈뱜
		          planService.updateReadCount(idx);
		     }
		     request.getParameter("idx");
		     PlanModel object = planService.getPlanListOne(idx);
		     
	        /*model.addAttribute("object", object);*/
		     ModelAndView mav = new ModelAndView();
		     mav.addObject("object", object);
		     mav.setViewName("planview");
	        return mav;
	  }
	 

	   @RequestMapping(value = "write.mtg", method = RequestMethod.GET)
	    public ModelAndView dispBbsWrite(@RequestParam(value="idx", defaultValue="0") int idx, Model model, HttpServletRequest request,HttpSession session) {
	       logger.info("display view Plan write");
	       ModelAndView mav = new ModelAndView();
	       if(session.getAttribute("session_member_id")==null){
	    	   mav.setViewName("loginConfirm");
				return mav;
	       }
	        if (idx > 0) {
	        	PlanModel object = planService.getPlanListOne(idx);
	        	
			     mav.addObject("object", object);
			     
	      }
	   
	        mav.setViewName("planwrite");
	        return mav;
	    }
	   

	 @RequestMapping(value = "/write_ok.mtg", method = RequestMethod.POST)
	   public ModelAndView procBbsWrite(HttpServletRequest request, PlanModel planModel) {
		   	
	    	planService.insert(planModel);
	        ModelAndView mav = new ModelAndView("redirect:/planReg.mtg");
	        return mav;
	    } 
	
	 @RequestMapping(value="/planUpdate.mtg", method = RequestMethod.POST)
		public ModelAndView openupdate(HttpServletRequest request, PlanModel planModel) throws Exception{
		
			 planService.update(planModel);
			 ModelAndView mav = new ModelAndView("redirect:/planReg.mtg");
			return mav;
		}
	   
	    @RequestMapping(value ="/delete.mtg", method = RequestMethod.POST)
	    public ModelAndView procBbsDelete(@RequestParam(value = "idx", required = true) int idx, Model model) {
	    	planService.delete(idx);
	    	ModelAndView mav = new ModelAndView("redirect:/planReg.mtg");
	        return mav;
	    }
	    @RequestMapping(value ="/like.mtg", method = RequestMethod.POST)
	    public ModelAndView procBbslike(@RequestParam(value = "idx", required = false, defaultValue="0") int idx) {
	    	planService.updatelike(idx);
	    	ModelAndView mav = new ModelAndView("redirect:/planReg.mtg");
	        return mav;
	    }
	
	    @RequestMapping("submit.mtg")
	    public ModelAndView submit(HttpServletRequest request, PlanModel planModel){
	    	Integer idx = planModel.getIdx();
	    	 if (idx == null || idx == 0) {
	    	planService.insert(planModel);
	        ModelAndView mav = new ModelAndView("redirect:/planReg.mtg");
	        return mav;
	    } else {
        	planService.update(planModel);
       	 ModelAndView mav = new ModelAndView("redirect:/planReg.mtg");
           
           return mav;
       }
   }

	    
	    @RequestMapping(value = "/file_upload.mtg", method = RequestMethod.POST)
	    public String procFileUpload(FileBean fileBean,HttpServletRequest request, Model model) {

	         HttpSession session = request.getSession();
	         String root_path = session.getServletContext().getRealPath("/"); // 占쎌럲占쎄퐣�뜮袁⑸뮞 root野껋럥以�
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
	                logger.info(root_path + attach_path + filename);
	                upload.transferTo(file);
	            } catch (IOException e) {
	                e.printStackTrace();
	            }
	        }

	        String file_path = "/mtg/" + attach_path + filename;
	        model.addAttribute("file_path", file_path);
	        model.addAttribute("CKEditorFuncNum", CKEditorFuncNum);

	         return "/plan/planfileupload";
	    }
	   
		
			}



