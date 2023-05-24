package com.db.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.db.mapper.AdminMapper;
import com.db.model.AuctionVO;
import com.db.model.BrandVO;
import com.db.model.UserVO;

@Service
public class AdminServiceImpl implements AdminService{
	
	@Autowired
	AdminMapper mapper;

	@Override
	public int insertAuction(AuctionVO aVo) throws Exception {
		return mapper.insertAuction(aVo);
	}

	@Override
	public ArrayList<UserVO> getUserList() throws Exception {
		return mapper.getUserList();
	}

	@Override
	public void deleteUser(String userid) throws Exception {
		mapper.deleteUser(userid);
	}

	@Override
	public UserVO getUser(String userid) throws Exception {
		return mapper.getUser(userid);
	}

	@Override
	public void adminUserUpdate(UserVO uVo) throws Exception {
		mapper.adminUserUpdate(uVo);
	}

	@Override
	public void brandEnroll(BrandVO bVo) throws Exception {
		mapper.brandEnroll(bVo);		
	}

	@Override
	public void deleteBrand(String bname) throws Exception {
		mapper.deleteBrand(bname);
	}
	
}
