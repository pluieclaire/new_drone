package com.spring.drone.co;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.spring.drone.so.SomoimDAOService;
import com.spring.drone.so.SomoimVO;

@Controller
public class CommController {
	
	@Autowired
	private CommDAOService commDAOService;
	
	@Autowired
	private SomoimDAOService somoimDAOService;
	
	@RequestMapping("/main.co")
	public ModelAndView manager_main(SomoimVO somoimVO) {
		ModelAndView result = new ModelAndView();
		ArrayList<SomoimVO> sixSoList = somoimDAOService.getSixSoList();
		result.addObject("sixSoList", sixSoList);
		result.setViewName("comm/main");
		return result;
	}
	
	
	@RequestMapping("/co_p.co")
	public ModelAndView co_p(){
		ModelAndView result = new ModelAndView();
		ArrayList<AlbumVO> albumList = new ArrayList<AlbumVO>();
		albumList = commDAOService.getAlbumList();
		
		result.addObject("albumList", albumList);
		result.setViewName("comm/co_p");
		
		return result;
	}
	
	@RequestMapping("/co_p_write.co")
	public ModelAndView co_p_write(HttpSession session){
		ModelAndView result = new ModelAndView();
		//ArrayList<AlbumVO> albumList = new ArrayList<AlbumVO>();
		//albumList = albumDAOService.getAlbumList();
		
		//result.addObject("albumList", albumList);
		result.setViewName("comm/co_p_write");
		
		return result;
	}
	
	@RequestMapping("/co_p_view.co")
	public ModelAndView co_p_view(AlbumVO albumVO){
		ModelAndView result = new ModelAndView();
		int num = albumVO.getNum();
		albumVO = commDAOService.getAlbum(num);
		
		result.addObject("albumVO", albumVO);
		result.setViewName("comm/co_p_view");
		
		return result;
	}
	
	@RequestMapping("/co_p_modify_form.co")
	public ModelAndView co_p_modify_form(AlbumVO albumVO){
		ModelAndView result = new ModelAndView();
		int num = albumVO.getNum();
		albumVO = commDAOService.getAlbum(num);
		
		result.addObject("albumVO", albumVO);
		result.setViewName("comm/co_p_modify_form");
		
		return result;
	}
	
	
	@RequestMapping(value = "/insertAlbumReply.co", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public Map<String, Object> insertAlbumReply(AlbumVO albumVO, AlbumReplyVO albumReplyVO) {
		Map<String, Object> retVal = new HashMap<String, Object>();
		albumReplyVO.setRef_num(albumVO.getNum());
		int re_step = albumReplyVO.getRe_step();
		int re_level = albumReplyVO.getRe_level();
		int ref = albumReplyVO.getRef();
		int renum = albumReplyVO.getRenum();
		int count = commDAOService.getAlbumReplyCount() + 1;
		albumReplyVO.setRenum(count);
		if (ref == 0) {
			albumReplyVO.setRef(count);
			albumReplyVO.setRe_step(0);
			albumReplyVO.setRe_level(0);
		}
		else {
			System.out.println("ref : " + ref);
			albumReplyVO.setRef(ref);
			
			int ref_count = commDAOService.getAlbumReplyRefCount(albumReplyVO);
			
			System.out.println("ref_count + 1 : " + (ref_count));
			//commDAOService.updateStepAndLevel(albumReplyVO);
			albumReplyVO.setRe_step(ref_count + 1);
			albumReplyVO.setRe_level(re_level + 1);
		}
		
		
/*		우선 글을 쓴다. 1번이다. 1번의 글의 ref는 자기 자신이다. 
		ref번호를 가진 글이 하나도 없다면 스텝과 레벨은 가만히 둔다. 
		만약 ref번호를 가진 글이 하나 이상이라면 그 글의 스텝을 하나 올려야 한다.*/
		
		
		
		try {
		int res = commDAOService.insertAlbumReply(albumReplyVO);
		System.out.println("insert res: " + res);
		retVal.put("res", "OK");
			
			
		} catch (Exception e) {
			retVal.put("res", "FAIL");
			retVal.put("message", "Failure");
		}
		return retVal;
	}
	
	@RequestMapping(value = "/deleteAlbumReply.co", method = RequestMethod.GET, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public Map<String, Object> deleteAlbumReply(AlbumReplyVO albumReplyVO) {
		Map<String, Object> retVal = new HashMap<String, Object>();
		System.out.println("albumReplyVO.getRenum() : " + albumReplyVO.getRenum());
		try {
			int res = commDAOService.deleteAlbumReply(albumReplyVO);
			if (res != 0) {
				System.out.println("insert res: " + res);
				retVal.put("res", "OK");
			}
			else {
				retVal.put("res", "FAIL");
			}
			
		} catch (Exception e) {
			retVal.put("res", "FAIL");
			retVal.put("message", "Failure");
		}
		return retVal;
	}
	
	
	@RequestMapping(value = "/modifyAlbumReply.co", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public Map<String, Object> modifyAlbumReply(AlbumReplyVO albumReplyVO) {
		Map<String, Object> retVal = new HashMap<String, Object>();
		System.out.println("albumReplyVO.getRenum() : " + albumReplyVO.getRenum());
		try {
			int res = commDAOService.modifyAlbumReply(albumReplyVO);
			if (res != 0) {
				System.out.println("insert res: " + res);
				retVal.put("res", "OK");
			}
			else {
				retVal.put("res", "FAIL");
			}
			
		} catch (Exception e) {
			retVal.put("res", "FAIL");
			retVal.put("message", "Failure");
		}
		return retVal;
	}
	
	@RequestMapping(value = "/getAlbumReplyList.co", method = RequestMethod.GET, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String getAlbumReplyList(AlbumReplyVO albumReplyVO, AlbumVO albumVO) {
		List<AlbumReplyVO> list = commDAOService.getAlbumReplyList(albumVO);
		
		String str = "";
		ObjectMapper mapper = new ObjectMapper(); 
		try {
			str = mapper.writeValueAsString(list);
		}

		catch (Exception e) {
			System.out.println("first() mapper : " + e.getMessage());
		}
		
		return str;
	}
	@RequestMapping("/.co")
	public ModelAndView getAlbumReplyList(AlbumVO albumVO){
		ModelAndView result = new ModelAndView();
		ArrayList<AlbumReplyVO> replyList = commDAOService.getAlbumReplyList(albumVO);
		result.addObject("replyList", replyList);
		result.setViewName("comm/co_p_view");
		
		return result;
	}
	
	@RequestMapping("/auction_main.co")
	public String auction_main(){
		
		
		return "comm/auction_list";
	}
	
	@RequestMapping("/auction_detail.co")
	public String auction_detail(){
		
		
		return "comm/auction_detail";
	}
	
	@RequestMapping("/community_photo_main.co")
	public String community_photo_main(){
		
		
		return "comm/community_photo";
	}
	@RequestMapping("/auction_write.co")
	public String auction_write(){
		
		
		return "comm/auction_write";
	}
	
	@RequestMapping("/")
    public String main() {
        return "index";
    }
 
	

	@ResponseBody
    @RequestMapping(value="/album_upload.co", method=RequestMethod.POST, produces = "application/json; charset=UTF-8")
    public Map<String, Object> album_upload(AlbumVO albumVO,  @RequestParam(value = "title", required = false) String title, @RequestParam(value = "id", required = false) String id, @RequestParam(value = "nickname", required = false) String nickname, @RequestParam(value = "body", required = false) String body, @RequestParam(value = "category", required = false) String category, @RequestParam("files")List<MultipartFile> images) throws IllegalStateException, IOException {
        Map<String, Object> retVal = new HashMap<String, Object>();
        System.out.println("카테고리 : " + albumVO.getCategory());
        String uploadPath = "C:\\BigDeep\\upload\\album\\";
        
    	long sizeSum = 0;
    	
    	String storedFileNameCollection = "";
    	String originalNameCollection = "";
    	String fileSizeCollection = "";
    	
    	System.out.println("제목 : " + albumVO.getTitle());
    	System.out.println("바디 : " + albumVO.getBody());
        
        for(MultipartFile image : images) {
            String originalName = image.getOriginalFilename();
            System.out.println("originalName : " + originalName);
            
            if(!isValidExtension(originalName)){
            	System.out.println(isValidExtension(originalName));
                retVal.put("res", -1);
            	return retVal;
            }
            
            sizeSum += image.getSize();
            if(sizeSum >= 10048576) {
            	retVal.put("res", -2);
            	return retVal;
            }

            String originalFileExtension = image.getOriginalFilename().substring(image.getOriginalFilename().lastIndexOf("."));
            String storedFileName = UUID.randomUUID().toString().replaceAll("-", "") +
    				originalFileExtension;
            
            String StringFileSize = null;
            
            if(image.getSize() != 0) {
            	System.out.println(uploadPath+storedFileName);
            	image.transferTo(new File(uploadPath+storedFileName));
    			storedFileNameCollection += storedFileName + "///";
    			originalNameCollection += originalName +"///";
    			StringFileSize = String.valueOf(image.getSize());
    			fileSizeCollection += StringFileSize + "///";
    			System.out.println(fileSizeCollection);
    		}
        }
        int count = commDAOService.getAlbumCount() + 1;
        albumVO.setNum(count);
        albumVO.setPname("팬텀4");
        albumVO.setReadcount(6);
        albumVO.setLikecount(100);
        albumVO.setUploadPath(uploadPath);
        albumVO.setStoredFileName(storedFileNameCollection);
        albumVO.setOriginalName(originalNameCollection);
        albumVO.setFilesize(fileSizeCollection);
        commDAOService.insertAlbum(albumVO);
        
        retVal.put("res", count);
    	return retVal;
    }
	
    @ResponseBody
    @RequestMapping(value="/imageupload.co", method=RequestMethod.POST, produces = "application/json; charset=UTF-8")
    public Map<String, Object> multiImageUpload(AuctionVO auctionVO, @RequestParam(value = "title", required = false) String title, @RequestParam(value = "pname", required = false) String pname, @RequestParam(value = "price", required = false) int price, @RequestParam(value = "body", required = false) String body,  @RequestParam("files")List<MultipartFile> images) throws IllegalStateException, IOException {
        Map<String, Object> retVal = new HashMap<String, Object>();
    	long sizeSum = 0;
    	System.out.println(auctionVO.getTitle());
    	
        String uploadPath = "C:\\BigDeep\\upload\\";
        System.out.println("�젣紐� : " + title);
        System.out.println("�젣紐� : " + price);
        auctionVO.setTitle(title);
        auctionVO.setPname(pname);
        auctionVO.setBody(body);
        auctionVO.setPrice(price);
        
        for(MultipartFile image222 : images) {
            String originalName = image222.getOriginalFilename();
            System.out.println(originalName);
           
            if(!isValidExtension(originalName)){
            	System.out.println(isValidExtension(originalName));
                retVal.put("res", -1);
            	return retVal;
            }
            
            sizeSum += image222.getSize();
            if(sizeSum >= 10048576) {
            	retVal.put("res", -2);
            	return retVal;
            }
        
            String originalFileExtension = image222.getOriginalFilename().substring(image222.getOriginalFilename().lastIndexOf("."));
            String storedFileName = UUID.randomUUID().toString().replaceAll("-", "") +
    				originalFileExtension;
            if(image222.getSize() != 0) {
            	System.out.println(uploadPath+storedFileName);
    			image222.transferTo(new File(uploadPath+storedFileName));
    			
    			auctionVO.setUploadPath(uploadPath);
    			auctionVO.setStoredFileName(storedFileName);
    			
    		
    		}

        }
        commDAOService.insertAuction(auctionVO);
   
        retVal.put("res", 1);
    	return retVal;
    }
    
    //required above jdk 1.7 - switch(String)
    private boolean isValidExtension(String originalName) { 
        String originalNameExtension = originalName.substring(originalName.lastIndexOf(".")+1);
        System.out.println(originalNameExtension);
        if (originalNameExtension.equals("jpg") ||originalNameExtension.equals("png") ||originalNameExtension.equals("gif")||originalNameExtension.equals("jpeg")) {
            return true;
        }
        return false;
    }
    
    @RequestMapping("/delete.co")
	public ModelAndView delete(AuctionVO auction) {
		String id = auction.getId();
		commDAOService.deleteAuction(id);
		System.out.println("delete complete");
		
		ModelAndView result = new ModelAndView();
		List<AuctionVO> auctionList = commDAOService.getAuctionList();
		result.addObject("auctionList", auctionList);
		result.setViewName("comm/auction_list");
		return result;
	}
    
    @RequestMapping("/updateForm.co")
	public ModelAndView updateForm(AuctionVO auction) { 
		String id = auction.getId(); 
		auction = commDAOService.getAuction(id);
		System.out.println("updateForm complete");
		
		ModelAndView result = new ModelAndView();
		result.addObject("auction", auction);
		result.setViewName("comm/auction_updateForm");
		return result;
	}
    
    @RequestMapping("/update.co")
	public ModelAndView update(AuctionVO auction) { 
    	
    	commDAOService.updateAuction(auction);
		System.out.println("update complete"); 
		
		
		ModelAndView result = new ModelAndView();
		List<AuctionVO> auctionList = commDAOService.getAuctionList();
		result.addObject("auctionList", auctionList);
		result.setViewName("comm/auction_detail");
		return result;
	}
    
    
    
}
