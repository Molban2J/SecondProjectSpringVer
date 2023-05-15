package com.db.mapper;

import java.util.ArrayList;

import com.db.model.AuctionVO;
import com.db.model.UserVO;


public interface AdminMapper {
	
	public int insertAuction(AuctionVO aVo); //옥션 등록
	
	public ArrayList<UserVO> getUserList(); //유저 목록
	
	public void deleteUser(String userid); //유저 삭제
	
	public UserVO getUser(String userid); //유저 정보
	
}
