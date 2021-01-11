package web.information.all;

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
import org.apache.catalina.Session;
import org.apache.commons.lang.StringUtils;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import web.plan.all.PlanModel;
import web.qna.all.QnaReplyModel;



@Controller
public class InformationController {

	List<InformationModel> list = new ArrayList<InformationModel>();
	private static final Logger logger = LoggerFactory.getLogger(InformationController.class);
	@Resource(name = "informationService") 
	private InformationService informationService;
	private InformationComModel informationComModel ;
	

	@Resource(name="messageSource")
	private MessageSource messageSource;
	
	 @RequestMapping(value = "/InformationList.mtg", method = RequestMethod.GET)
	    public ModelAndView informationlist(Model model, HttpServletRequest request, HttpServletResponse response) {
	        logger.info("display view information list");
	        String sch_type = request.getParameter("sch_type");
	        String sch_value = request.getParameter("sch_value");
	        String num = request.getParameter("num");
	        Map mapSearch = new HashMap();
	        mapSearch.put("sch_type", sch_type);
	        mapSearch.put("sch_value", sch_value);
	        System.out.println(mapSearch);
	        // 野껓옙占쎄퉳 揶쏅�れ뱽 �뀎怨쀫퓠 占쎄퐜野꺿뫁夷�
	        model.addAttribute("mapSearch", mapSearch);
	        list = informationService.getSelectSearch(mapSearch);
	        
	        
	        ModelAndView mav = new ModelAndView();
		     mav.addObject("list", list);
		     mav.setViewName("infoList");
	        return mav;
	    }
	 
	  @RequestMapping("/information{num}.mtg")
	    public String informationView(@PathVariable int num, Model model, HttpServletRequest request, HttpSession session, InformationModel informationModel) {
	        logger.info("display view information view num = {}", num);
	        InformationComModel informationComModel= new InformationComModel();
	        /*int num = Integer.parseInt(request.getParameter("num"));*/
	        InformationModel object = informationService.getInformationListOne(num);
	        informationComModel.setNum(num);
	        informationService.readhit(num);
	        List<InformationComModel> infoCom = informationService.selectReplyAll(informationComModel);
	       model.addAttribute("object", object);
	        model.addAttribute("infoCom",infoCom);
	        return "infoView";
	    }


	   @RequestMapping(value = "/InformationWrite.mtg", method = RequestMethod.GET)
	    public String WriteForm(@RequestParam(value="num", defaultValue="0") int num, Model model, HttpSession session) {
	        logger.info("display view information write");
	        
	        session.getAttribute("session_member_name");
	      

	        if (num > 0) {
	            InformationModel object = informationService.getInformationListOne(num);
	            model.addAttribute("object", object);
	        }
	        
	        if (session.getAttribute("session_member_id")==null){ 
				
				return "loginConfirm";
			} 		
			
			
	
			
		
	        

	        return "infowrite";
	        
	    }
	   

	 @RequestMapping(value="/InformationWrite_ok.mtg", method = RequestMethod.POST)
	   public ModelAndView oneInformationWrite(HttpServletRequest request, InformationModel informationModel, HttpSession session, Object object) {
	        Integer num = informationModel.getNum();
	        
	       

	        
	        	
	        	
	        	String nickname = (String) session.getAttribute("session_member_name");
	        	informationModel.setWriter(nickname);
	        	
	        	informationService.insert(informationModel);
	        	 ModelAndView mav = new ModelAndView("redirect:/InformationList.mtg");
	            
	            return mav;
	       
	    	
	        
	    }

	   
	 @RequestMapping(value="/InformationWrite_ok1.mtg")
		public ModelAndView twoInformationWrite(HttpServletRequest request, InformationModel informationModel) throws Exception{
		    Integer num = informationModel.getNum();
		    ModelAndView mv = new ModelAndView("/information/InformationList");
			return mv;
		}
	 @RequestMapping(value="/infoUpdate.mtg", method = RequestMethod.POST)
		public ModelAndView openupdate(HttpServletRequest request, InformationModel informationModel ) throws Exception{
		
		 informationService.update(informationModel);
			 ModelAndView mav = new ModelAndView("redirect:/InformationList.mtg");
			return mav;
		}
	    @RequestMapping(value = "/IndformationDelete.mtg", method = RequestMethod.POST)
	    public String informationDelete(@RequestParam(value = "num", required = true) int num, Model model) {
	    	informationService.delete(num);
	    	
	        return "redirect:/InformationList.mtg";
	    }
	
	    /*占쎄쉭占쎈�∽옙�몵嚥≪뮆彛� 占쎈씜嚥≪뮆諭� */
	    @RequestMapping(value = "/InformatioFile_upload.mtg", method = RequestMethod.POST)
	    public String FileUpload(FileBean fileBean,HttpServletRequest request, Model model) {

	         HttpSession session = request.getSession();
	         String root_path = session.getServletContext().getRealPath("/"); // 占쎌럲占쎄퐣�뜮袁⑸뮞 root野껋럥以�
	         String attach_path = "resources/files/attach/informationImg/";

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

	         return "/information/InformationUpload";
	    }
	    /*댓글*/

		@RequestMapping("/infomationComWrite.mtg")
		public String infomationComWrite(HttpServletRequest request, HttpSession session, Model model){
		      int num;
	
			   
		
			InformationComModel informationComModel = new InformationComModel();
			informationComModel.setContent(request.getParameter("content").replaceAll("\r\n", "<br />"));
			String nickname = (String) session.getAttribute("session_member_name");
			informationComModel.setWriter(nickname);
			
			informationComModel.setNum(Integer.parseInt(request.getParameter("num")));
			num = Integer.parseInt(request.getParameter("num"));
			 if (session.getAttribute("session_member_id")==null){ 
					
					return "loginConfirm";
				} 
			
			informationService.WriteReply(informationComModel);
				
		
				model.addAttribute("num", num);
				return "redirect:./information{num}.mtg";
		}
		
		
		@RequestMapping(value = "/InformationComDelete.mtg", method = RequestMethod.GET)
	    public String informationComDelete(HttpServletRequest request, Model model) {
			InformationComModel informationComModel = new InformationComModel();
			int num = Integer.parseInt(request.getParameter("num"));
			int comment_num = Integer.parseInt(request.getParameter("comment_num"));
	    	
	    	informationComModel.setNum(num);
	    	informationComModel.setComment_num(comment_num);
	    	
	    	informationService.deleteReply(informationComModel);
	    	model.addAttribute("num", num);
	        return "redirect:./information{num}.mtg";
	    }
	    @RequestMapping(value ="/informationLike.mtg", method = RequestMethod.POST)
	    public ModelAndView informationlike(@RequestParam(value = "num", required = false, defaultValue="0") int num) {
	    	informationService.like(num);
	    	ModelAndView mav = new ModelAndView("redirect:/InformationList.mtg");
	       return mav;
	    }
	
			
		}
		
	   

