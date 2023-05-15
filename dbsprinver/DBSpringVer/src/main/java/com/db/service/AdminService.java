package com.db.service;

import java.util.ArrayList;

import com.db.model.AuctionVO;
import com.db.model.UserVO;

public interface AdminService {
	
	//<옥션 관리>
	public int insertAuction(AuctionVO aVo) throws Exception; //옥션 등록
	
	
	// <유저 관리>
	public ArrayList<UserVO> getUserList() throws Exception; //유저 목록
	
	public void deleteUser(String userid) throws Exception; // 유저 삭제
	
	public UserVO getUser(String userid) throws Exception; //유저 정보
}
