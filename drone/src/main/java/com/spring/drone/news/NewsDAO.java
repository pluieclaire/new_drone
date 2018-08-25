package com.spring.drone.news;

import java.util.ArrayList;
import java.util.List;

public interface NewsDAO {
	public ArrayList<NewsVO> getNewsList(int startRow, int endRow);
	public NewsVO getNews(int num);
	public void insertNews(ArrayList<NewsVO> newsVOList);
	public int insertReply(ReplyVO replyVO);
	public void updateNews(NewsVO news);
	public void deleteNews(int num);
	public int getCount();
	public List<ReplyVO> getReplyJSON(int num);
	public int getMaxReplyNum(int news_ref_num);
	public void addReadcount(int num, int readcount);
	public void updateStepAndLevel(ReplyVO rvo);
	public int getReNum(int news_ref_num);
	
}
