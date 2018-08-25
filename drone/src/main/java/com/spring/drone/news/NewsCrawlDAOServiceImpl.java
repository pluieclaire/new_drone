package com.spring.drone.news;

import java.io.IOException;
import java.util.ArrayList;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class NewsCrawlDAOServiceImpl implements NewsCrawlDAOService{

	@Override
	public ArrayList<NewsVO> crawlNews() {
		String BASE_URL_F = "https://search.naver.com/search.naver?&where=news&query=%EB%93%9C%EB%A1%A0&sm=tab_pge&sort=1&photo=0&field=1&reporter_article=&pd=0&ds=&de=&docid=&nso=so:dd,p:all,a:t&mynews=0&start=";
		int BASE_URL_PAGE = 1;
		String BASE_URL_B = "&refresh_start=0";
		String COMPLETE_URL = BASE_URL_F + BASE_URL_PAGE + BASE_URL_B;
		
		ArrayList<String> urlList = new ArrayList<String>();
		ArrayList<String> titleList = new ArrayList<String>();
		ArrayList<String> sourceList = new ArrayList<String>();
		ArrayList<String> bodyList = new ArrayList<String>();
		ArrayList<NewsVO> newsVOList = new ArrayList<NewsVO>();
		
		int page = 1;
		while (page <= 11) {
		Document naver_news;
		try {
			naver_news = Jsoup.connect(COMPLETE_URL)
			.header("Accept", "text/html, application/xhtml+xml, image/jxr, */*")
			.header("User-Agent", "Mozilla/5.0 (Windows NT 10.0; WOW64; Trident/7.0; rv:11.0) like Gecko")
			.header("Accept-Encoding", "gzip, deflate").header("Accept-Language", "ko-KR")
			.header("Connection", "Keep-Alive").get();
		
		Elements news_div = naver_news.select("li dl");
			
		Elements url = news_div.select("dt a[href]");
		for (Element x : url) {
			String geturl = x.attr("href");
			urlList.add(geturl);
			System.out.println(geturl);
		}
		Elements title = news_div.select("dt a[title]");
		for (Element x : title) {
			String gettitle = x.attr("title");
			titleList.add(gettitle);
			System.out.println(gettitle);
		}
		Elements source = news_div.select("dd span._sp_each_source");
		for (Element x : source) {
			String getsource = x.text();
			sourceList.add(getsource);
			System.out.println(getsource);
		}
		Elements body = news_div.select("dd:eq(2)");
		for (Element x : body) {
			String getbody = x.text();
			bodyList.add(getbody);
			System.out.println(getbody);
		}
		for (int i=0;i<urlList.size();i++) {
			
			NewsVO newsvo = new NewsVO();
			
			newsvo.setUrl(urlList.get(i));
			newsvo.setTitle(titleList.get(i));
			newsvo.setSource(sourceList.get(i));
			newsvo.setBody(bodyList.get(i));
			
			newsVOList.add(newsvo);
		}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println("ÆäÀÌÁö : " + page + "=====================");
		page = page + 10;
		BASE_URL_PAGE = page;
		COMPLETE_URL = BASE_URL_F + BASE_URL_PAGE + BASE_URL_B;
		}
		return newsVOList;
	}
}
