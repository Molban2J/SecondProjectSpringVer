package com.db.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.db.model.AuctionVO;
import com.db.model.BrandVO;
<<<<<<< HEAD
<<<<<<< HEAD
=======
import com.db.model.OrderVO;
>>>>>>> kyudong
=======
import com.db.model.Criteria;
>>>>>>> Jongmin2
import com.db.model.UserVO;

public interface AdminService {

	// <옥션 관리>
	public int insertAuction(AuctionVO aVo) throws Exception; // 옥션 등록

	// <유저 관리>
	public ArrayList<UserVO> getUserList() throws Exception; // 유저 목록

	public void deleteUser(String userid) throws Exception; // 유저 삭제
<<<<<<< HEAD
<<<<<<< HEAD
	
	public UserVO getUser(String userid) throws Exception; //유저 정보
	
	public void adminUserUpdate(UserVO uVo) throws Exception; //유저 수정
	
	public void brandEnroll(BrandVO bVo) throws Exception; //브랜드 추가
	
	public void deleteBrand(String bname) throws Exception; //브랜드 삭제
=======
=======
>>>>>>> Jongmin2

	public UserVO getUser(String userid) throws Exception; // 유저 정보

	public void adminUserUpdate(UserVO uVo) throws Exception; // 유저 수정

	public void brandEnroll(BrandVO bVo) throws Exception; // 브랜드 추가

	public void deleteBrand(String bname) throws Exception; // 브랜드 삭제

<<<<<<< HEAD
	// 신규주문 가져오기
	public ArrayList<OrderVO> getNewOrder() throws Exception;

	// 처리주문 가져오기
	public ArrayList<OrderVO> getProcessOrder() throws Exception;

	// 취소주문 가져오기
	public ArrayList<OrderVO> getWithdrawOrder() throws Exception;

	// 판매된주문 가져오기
	public ArrayList<OrderVO> getSalesOrder() throws Exception;

	// 주문 확인처리 result -> 2 로 변경
	public int checkOrderChangeResult(@Param("ordernumber") int ordernumber);

	// 주문 발송처리 result -> 3 으로 변경
	public int shipmentChangeResult(@Param("ordernumber") int ordernumber);

	// 주문 취소처리 result -> 5 으로 변경
	public int withdrawOrderChangeResult(@Param("ordernumber") int ordernumber);
>>>>>>> kyudong
=======
	// 게시판 목록(페이징)
	public List<UserVO> getUserListPaging(Criteria cri) throws Exception;

	// 게시판 총 갯수
	public int getUserTotal(Criteria cri) throws Exception;
>>>>>>> Jongmin2
}
