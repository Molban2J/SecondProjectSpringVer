package com.db.mapper;

import java.sql.Timestamp;
import java.time.LocalDateTime;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.db.model.AuctionVO;
import com.db.model.ProductVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class AdminMapperTests {
	@Autowired
	AdminMapper mapper;
	@Autowired
	ProductMapper pMapper;
	
	@Test
	public void testInsertAuction() {
		AuctionVO vo = new AuctionVO();
		ProductVO pVo = pMapper.productDetail(1);
		LocalDateTime currentDateTime = LocalDateTime.now();
	    Timestamp timestamp = Timestamp.valueOf(currentDateTime);
		vo.setBName(pVo.getBname());
		vo.setPName(pVo.getPname());
		vo.setPrice(pVo.getPrice());
		vo.setEndTime(timestamp);
		vo.setEndPrice(0);
		vo.setImgUrl(pVo.getImgUrl());
		vo.setPSize(pVo.getPsize());
		vo.setStartPrice(0);
		vo.setUserId("admin");
		mapper.insertAuction(vo);
	}
}
