package com.spring.drone.co;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommDAOServiceImpl implements CommDAOService {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public ArrayList<AlbumVO> getAlbumList() {
		ArrayList<AlbumVO> albumList = new ArrayList<AlbumVO>();
		CommMapper commMapper = sqlSession.getMapper(CommMapper.class);
		albumList = commMapper.getAlbumList();
		return albumList;
	}


	@Override
	public AlbumVO getAlbum(int num) {
		CommMapper commMapper = sqlSession.getMapper(CommMapper.class);
		AlbumVO albumVO = commMapper.getAlbum(num);
		return albumVO;
	}
	
	@Override
	public int getAlbumCount() {
		CommMapper commMapper = sqlSession.getMapper(CommMapper.class);
		int count = commMapper.getAlbumCount();
		return count;
	}
	
	@Override
	public void insertAlbum(AlbumVO albumVO) {
		CommMapper commMapper = sqlSession.getMapper(CommMapper.class);
		commMapper.insertAlbum(albumVO);
	}
	
	
	
	@Override
	public void insertAuction(AuctionVO auctionVO) {
		
		CommMapper commMapper = sqlSession.getMapper(CommMapper.class);
		commMapper.insertAuction(auctionVO);
		
	}

	@Override
	public ArrayList<AuctionVO> getAuctionList() {
		
		ArrayList<AuctionVO> auctionList = new ArrayList<AuctionVO>();
		CommMapper commMapper = sqlSession.getMapper(CommMapper.class);
		auctionList = commMapper.getAuctionList();
		
		return auctionList;
	}

	@Override
	public void deleteAuction(String id) {
		CommMapper commMapper = sqlSession.getMapper(CommMapper.class);
		commMapper.deleteAuction(id);
		
	}

	@Override
	public void updateAuction(AuctionVO auctionVO) {
		CommMapper commMapper = sqlSession.getMapper(CommMapper.class);
		commMapper.updateAuction(auctionVO);
		
	}
	
	@Override
	public AuctionVO getAuction(String id) {
		AuctionVO auction = new AuctionVO();
		CommMapper commMapper = sqlSession.getMapper(CommMapper.class);
		auction = commMapper.getAuction(id); 
				
		return auction;
	}

	@Override
	public ArrayList<AlbumReplyVO> getAlbumReplyList(AlbumVO albumVO) {
		ArrayList<AlbumReplyVO> replyList = new ArrayList<AlbumReplyVO>();
		CommMapper commMapper = sqlSession.getMapper(CommMapper.class);
		replyList = commMapper.getAlbumReplyList(albumVO);
		return replyList;
	}

	@Override
	public int getAlbumReplyCount() {
		CommMapper commMapper = sqlSession.getMapper(CommMapper.class);
		int count = commMapper.getAlbumReplyCount();
		return count;
	}

	@Override
	public void updateStepAndLevel(AlbumReplyVO albumReplyVO) {
		CommMapper commMapper = sqlSession.getMapper(CommMapper.class);
		commMapper.updateStepAndLevel(albumReplyVO);
		
	}

	@Override
	public int insertAlbumReply(AlbumReplyVO albumReplyVO) {
		System.out.println(albumReplyVO.getRef());
		CommMapper commMapper = sqlSession.getMapper(CommMapper.class);
		int res = commMapper.insertAlbumReply(albumReplyVO);
		return res;
	}

	@Override
	public int getAlbumReplyRefCount(AlbumReplyVO albumReplyVO) {
		CommMapper commMapper = sqlSession.getMapper(CommMapper.class);
		int ref_count = commMapper.getAlbumReplyRefCount(albumReplyVO);
		System.out.println("ref_count :  " + ref_count);
		return ref_count;
	}

	@Override
	public int deleteAlbumReply(AlbumReplyVO albumReplyVO) {
		CommMapper commMapper = sqlSession.getMapper(CommMapper.class);
		int res = commMapper.deleteAlbumReply(albumReplyVO);
		return res;
	}

	@Override
	public int modifyAlbumReply(AlbumReplyVO albumReplyVO) {
		CommMapper commMapper = sqlSession.getMapper(CommMapper.class);
		int res = commMapper.modifyAlbumReply(albumReplyVO);
		return res;
	}



	

	
	
	
}
