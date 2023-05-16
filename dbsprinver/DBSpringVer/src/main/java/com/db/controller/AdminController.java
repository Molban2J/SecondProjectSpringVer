package com.db.controller;



import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.db.model.AuctionVO;
import com.db.model.BrandVO;
import com.db.model.ProductVO;
import com.db.model.UserVO;
import com.db.service.AdminService;
import com.db.service.ProductService;
import com.db.service.UserService;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	ProductService productService;
	@Autowired
	UserService userService;
	@Autowired
	AdminService adminService;
	
	//옥션 시작
	
	@GetMapping("auctionPage")
	public void AuctionPage() {
		System.out.println("auctionPage 접속");
	}
	
	@GetMapping("adminAuctionBrandList")
	public void AdminAuctionBrandListGET(Model model) throws Exception {
		System.out.println("adminAuctionBrandList 접속");
		ArrayList<BrandVO> list = productService.brandList();
		System.out.println("list: "+list);
		model.addAttribute("list",list);
	}
	
	@GetMapping("adminAuctionBrandProductList")
	public void AdminAuctionBrnadProductListGET(Model model, String bname) throws Exception {
		System.out.println("adminAuctionBrandProductList 접속");
		ArrayList<ProductVO> list = productService.brandProductList(bname);
		model.addAttribute("list",list);
	}
	
	@GetMapping("auctionBrandProductDetail")
	public void AuctionBrandProductDetailGET(String pname,String bname, Model model) throws Exception {
		System.out.println("auctionBrandProductDetail 접속");
		ProductVO pVo = productService.productDetailByPname(pname);
		List<ProductVO> sList = productService.productSizeList(pname);
		model.addAttribute("product" ,pVo);
		model.addAttribute("pSize", sList);
	}
	
	@PostMapping("addAuction.do")
	public String addAuctionPOST(AuctionVO vo,RedirectAttributes rttr) throws Exception {
//		LocalDateTime dateTime = LocalDateTime.parse(end, DateTimeFormatter.ISO_LOCAL_DATE_TIME);
//		Timestamp endTime = Timestamp.valueOf(dateTime);
//		vo.setEndTime(endTime);
		
		int result = adminService.insertAuction(vo);
		if(result>0) {
			rttr.addFlashAttribute("result", 1);
		} else {
			rttr.addFlashAttribute("result", 0);
		}
		
		return "redirect:/";
	}
	//옥션 끝
	
	
	//회원관리 시작
	//회원관리 페이지
	@GetMapping("userManagementPage")
	public void userManagementpageGET(Model model) throws Exception {
		System.out.println("userManagementPage 접속");
		ArrayList<UserVO> user = adminService.getUserList();
		model.addAttribute("shopUser",user);
	}
	
	//회원정보 수정
	@GetMapping("userManagementEdit")
	public void userManagementEditGET(String userid, Model model) throws Exception {
		System.out.println("userManagementEdit 접속");
		UserVO user = adminService.getUser(userid);
		model.addAttribute("shopUser", user);
	}
	
	//회원 삭제
	@GetMapping("userDelete")
	public String userDeleteGET(String shopUserid) throws Exception {
		System.out.println("userDelete 접속");
		adminService.deleteUser(shopUserid);
		return "redirect:/admin/userManagementPage";
	}
	
	//회원 수정 완료
	@PostMapping("userEditComplete.do")
	public String userEditCompletePOST(UserVO vo) throws Exception {
		System.out.println("userEditComplete.do 접속");
		userService.userUpdate(vo);
		System.out.println("userupdate: " + userService.userUpdate(vo));
		return "/admin/userEditComplete";
	}
	//회원관리 끝
	
	//상품 관리 시작
	//상품관리 페이지
	@GetMapping("productManagementPage")
	public void productManageGET() {
		System.out.println("productManagementPage 접속");
	}
	//브랜드 리스트
	@GetMapping("adminBrandList")
	public void adminBrandListGET(Model model) throws Exception {
		System.out.println("adminBrandList 접속");
		List<BrandVO> bList = productService.brandList();
		model.addAttribute("brand",bList);
	}
	//브랜드 등록페이지
	@GetMapping("adminbrandWriteForm")
	public void adminBrandWriteFormGET() {
		System.out.println("adminbrandWriteForm 접속");
	}
	
	//상품관리 끝
}
