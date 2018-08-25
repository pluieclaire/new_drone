package com.spring.drone.pl;

import java.io.IOException;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.drone.pl.PlaceVO;

/*
drop table place;
 吏��룄�젙蹂� 
CREATE TABLE Place (
	Place_Coord VARCHAR2(40 BYTE),  ?��?���? 
	Place_Add VARCHAR2(40 BYTE) NOT NULL,  二쇱?�� 
	Place_Name VARCHAR2(40 BYTE),  �씠?���? 
	Place_Desc VARCHAR2(40 BYTE),  �꽕紐� 
	Place_Cate VARCHAR2(40 BYTE),  ?��꾨쪟 
	User_Id VARCHAR2(40 BYTE)  �븘�씠�뵒 
);

desc place;
select * from place;

insert into place values('36.5500243,127.1205498',
'?��묐굹?���? 二쇱?��1',
'?��묐굹?���? �븳媛뺢?���썝1',
'�뱶濡좎?�� �궇?���? �닔 �엳�뒗 ?�듭?��1',
'�뱶濡좉?���썝1',
'源��븰嫄�1');
*/
@Controller
public class PlaceController {
	
	@Autowired
	private PlaceDAOService placeDAOService;
	
	@RequestMapping("/place.pl")
	// 1. place.pl�씠 ?��?��?��吏�硫� �샇?��?���?
	// 2. PlaceDAOService(�씤�꽣�럹�씠�뒪)�쓽 getPlaceList() �떎�뻾 -> �씠�룞
	public ModelAndView place_main(Locale locale, Model model) {
		System.out.println(">PlaceController, place_main(Locale locale, Model model), 泥ル쾲吏�?");
		ModelAndView result = new ModelAndView();
		ArrayList<PlaceVO> placeList = new ArrayList<PlaceVO>();
		placeList = placeDAOService.getPlaceList(); //placeDAOService �씠�룞
		result.addObject("placeList", placeList);
		result.setViewName("pl/place");

		System.out.println("<PlaceController, place_main(Locale locale, Model model), �몢踰덉?��, result: " + result);
		System.out.println("=============");
		return result;
	}

	@RequestMapping(value = "/placeRegister.pl", headers = {"Accept=text/xml, application/json"}, method = {RequestMethod.GET, RequestMethod.POST}, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public Object placeRegister(PlaceVO vo) throws IOException {
		System.out.println(">PlaceController, placeRegister(PlaceVO vo), 泥ル쾲吏�?: " + vo);
		System.out.println("PlaceController, placeRegister(PlaceVO vo), ��?��?���듃, vo.getUser_Id(): " + vo.getUser_Id());
		System.out.println("PlaceController, placeRegister(PlaceVO vo), ��?��?���듃, vo.getPlace_Coord(): " + vo.getPlace_Coord());
		System.out.println("PlaceController, placeRegister(PlaceVO vo), ��?��?���듃, vo.getPlace_Add(): " + vo.getPlace_Add());
		System.out.println("PlaceController, placeRegister(PlaceVO vo), ��?��?���듃, vo.getPlace_Name(): " + vo.getPlace_Name());
		System.out.println("PlaceController, placeRegister(PlaceVO vo), ��?��?���듃, vo.getPlace_Desc(): " + vo.getPlace_Desc());
		System.out.println("PlaceController, placeRegister(PlaceVO vo), ��?��?���듃, vo.getPlace_Cate(): " + vo.getPlace_Cate());

		Map<String, Object> retVal = new HashMap<String, Object>();//return value �빟�옄

		placeDAOService.placeRegister(vo);//placeDAOService �씠�룞
		
		retVal.put("res", "OK");
		
		System.out.println("<PlaceController, placeRegister(PlaceVO vo), �몢踰덉?��: " + retVal);
		return retVal;
	}
	
	@RequestMapping(value = "/getPlaceJSON.pl", method = RequestMethod.POST, produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String getPlaceJSON(PlaceVO vo) {
		List<PlaceVO> list = placeDAOService.getPlaceJSON();
		
		String str = "";
		ObjectMapper mapper = new ObjectMapper();
		try {
			str = mapper.writeValueAsString(list);
		}
		catch (Exception e) {
			System.out.println("getPlaceJSON: " + e.getMessage());
		}
		return str;
	}
	
	
}
