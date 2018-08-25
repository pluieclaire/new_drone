package com.spring.drone.news;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NewsDAOService implements NewsDAO {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public ArrayList<NewsVO> getNewsList(int startRow, int endRow) {
//@RequestParam(value = "startRow", required = false) Integer startRow, @RequestParam(value = "endRow", required = false) Integer endRow
		ArrayList<NewsVO> newsList = new ArrayList<NewsVO>();
		NewsMapper newsMapper = sqlSession.getMapper(NewsMapper.class);
		//占식띰옙占쏙옙庫占� 占쏙옙占쏙옙占쏙옙占쏙옙占신э옙占쏙옙占�..
		//MemberMapper.class占쏙옙 MemberMapper.java(占쏙옙占쏙옙占쏙옙占싱쏙옙)占쏙옙 占쏙옙占쏙옙킨占쏙옙.
		//MemberMapper.java占쏙옙 占쌍댐옙 占쌨소듸옙占쏙옙 MemberMapper.xml占쏙옙 占쌍댐옙 占쌨소듸옙占쏙옙 占쏙옙占쏙옙占쌔억옙
		//占쏙옙 占쌨소듸옙占쏙옙占� 호占쏙옙占쌔쇽옙 占쏙옙占쏙옙構占� 占싫댐옙.
		//getMembers()占쏙옙 占쌨소듸옙占쏙옙 mapper.xml占쏙옙 id占쏙옙 占쏙옙占쏙옙占쌔억옙 占싼댐옙.
		newsList = newsMapper.getNewsList(startRow, endRow);
	
		//memberList = memberMapper.getMembers("tab_mybatis");
		//MemberMapper.xml占쏙옙 占쏙옙占쏙옙占쏙옙占쌔댐옙.
		return newsList;
	}


	@Override
	public void insertNews(ArrayList<NewsVO> newsVOList) {
		NewsMapper newsMapper = sqlSession.getMapper(NewsMapper.class);
		int res;
		int count = 0;
		for (NewsVO x : newsVOList) {
			res = newsMapper.insertNews(x);
			count += res;
		}
		//int res = newsMapper.insertNews(newsVOList);
		System.out.println("inserted articles count =" + count);
	}


	
	@Override
	public NewsVO getNews(int num) {
		NewsVO news = new NewsVO();
		NewsMapper newsMapper = sqlSession.getMapper(NewsMapper.class);
		news = newsMapper.getNews(num);
		return news;
	}
	
	@Override
	public int getCount() {
		NewsMapper newsMapper = sqlSession.getMapper(NewsMapper.class);
		int count = newsMapper.getCount();
		return count;
	}

	@Override
	public void updateNews(NewsVO news) {
		NewsMapper newsMapper = sqlSession.getMapper(NewsMapper.class);
		newsMapper.updateNews(news);
	}

	@Override
	public void deleteNews(int num) {
		NewsMapper newsMapper = sqlSession.getMapper(NewsMapper.class);
		newsMapper.deleteNews(num);
	}

	@Override
	public void addReadcount(int num, int readcount) {
		NewsMapper newsMapper = sqlSession.getMapper(NewsMapper.class);
		newsMapper.addReadcount(num, readcount);
		
	}


	@Override
	public int insertReply(ReplyVO replyVO) {
		NewsMapper newsMapper = sqlSession.getMapper(NewsMapper.class);
		int res = newsMapper.insertReply(replyVO);
		return res;
		
	}
	
	@Override
	public List<ReplyVO> getReplyJSON(int num) {
		List<ReplyVO> newsReplyList = null;
		NewsMapper newsMapper = sqlSession.getMapper(NewsMapper.class);
		newsReplyList = newsMapper.getReplyList(num);
		return newsReplyList;
	}

	@Override
	public int getMaxReplyNum(int news_ref_num) {
		int maxReplyNum = 0;
		NewsMapper newsMapper = sqlSession.getMapper(NewsMapper.class);
		maxReplyNum = newsMapper.getMaxReplyNum(news_ref_num);
		return maxReplyNum;
	}

	@Override
	public void updateStepAndLevel(ReplyVO rvo) {
		NewsMapper newsMapper = sqlSession.getMapper(NewsMapper.class);
		newsMapper.updateStepAndLevel(rvo);
		
	}

	@Override
	public int getReNum(int news_ref_num) {
		int getReNum = 0;
		NewsMapper newsMapper = sqlSession.getMapper(NewsMapper.class);
		getReNum = newsMapper.getReNum(news_ref_num);
		return getReNum;
	}


	





}
