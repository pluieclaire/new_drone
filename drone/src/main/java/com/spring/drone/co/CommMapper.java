package com.spring.drone.co;

import java.util.ArrayList;
import java.util.Map;


public interface CommMapper {
	public ArrayList<AlbumVO> getAlbumList();
	public void saveImage(Map<String, Object> hmap);
	public AlbumVO getAlbum(int num);
	public void insertAuction(AuctionVO auction);
	public ArrayList<AuctionVO> getAuctionList();
	public void deleteAuction(String id);
	public AuctionVO getAuction(String id);
	public void updateAuction(AuctionVO auction);
	public int getAlbumCount();
	public void insertAlbum(AlbumVO albumVO);
	public ArrayList<AlbumReplyVO> getAlbumReplyList(AlbumVO albumVO);
	public int getAlbumReplyCount();
	public void updateStepAndLevel(AlbumReplyVO albumReplyVO);
	public int insertAlbumReply(AlbumReplyVO albumReplyVO);
	public int getAlbumReplyRefCount(AlbumReplyVO albumReplyVO);
	public int deleteAlbumReply(AlbumReplyVO albumReplyVO);
	public int modifyAlbumReply(AlbumReplyVO albumReplyVO);

}
