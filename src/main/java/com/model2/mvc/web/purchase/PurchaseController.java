package com.model2.mvc.web.purchase;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.purchase.PurchaseService;
//==> 구매관리 Controller
@Controller
@RequestMapping("/purchase/*")
public class PurchaseController {

	/// Field
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;

	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	// setter Method 구현 않음

	public PurchaseController() {
		System.out.println(this.getClass());
	}

	// ==> classpath:config/common.properties , classpath:config/commonservice.xml
	// 참조 할것
	// ==> 아래의 두개를 주석을 풀어 의미를 확인 할것
	@Value("#{commonProperties['pageUnit']}")
	// @Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;

	@Value("#{commonProperties['pageSize']}")
	// @Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;

	@RequestMapping(value ="addPurchaseView", method = RequestMethod.GET)
	public String addPurchaseView(@RequestParam("prod_no") int prodNo, HttpSession session, Model model)
			throws Exception {

		System.out.println("/addPurchaseView");

		Product product = productService.getProduct(prodNo);
		User user = (User) session.getAttribute("user");

		model.addAttribute("product", product);
		model.addAttribute("user", user);

		return "forward:/purchase/addPurchaseView.jsp";
	}

	@RequestMapping(value ="addPurchase", method = RequestMethod.POST)
	public String addPurchase(@ModelAttribute("purchase") Purchase purchase) throws Exception {

		System.out.println("/addPurchase");	
		purchase.setTranCode("1");
	
		purchaseService.addPurchase(purchase); 
	 	
		return "forward:/purchase/addPurchase.jsp";
	}	

	@RequestMapping(value ="listPurchase")
	public String listPurchase(@ModelAttribute("search") Search search, Model model, HttpSession session) throws Exception {
				
		System.out.println("/listPurchase");

		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		User user = (User) session.getAttribute("user");

		Map<String, Object> inputParam = new HashMap<String, Object>();
		
		inputParam.put("search", search);
		inputParam.put("buyerId", user.getUserId());
		
		// Business logic 수행
		Map<String, Object> map = purchaseService.getPurchaseList(inputParam);

		Page resultPage = new Page(search.getCurrentPage(), ((Integer) map.get("totalCount")).intValue(), pageUnit,	pageSize);
		System.out.println(resultPage);
		
		// Model 과 View 연결
		model.addAttribute("list", map.get("list"));		
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
	
		return "forward:/purchase/listPurchase.jsp";
	
	}
	
	@RequestMapping(value ="getPurchase", method = RequestMethod.GET)
	public String getPurchase(@RequestParam("tranNo") String tranNo, Model model) throws Exception {
			
		System.out.println("/getPurchase");	
			
		Purchase purchase = purchaseService.getPurchaseByTran(Integer.parseInt(tranNo));
		model.addAttribute("purchase", purchase);
		
		return "forward:/purchase/getPurchaseView.jsp";
	}
	
	@RequestMapping(value ="updatePurchaseView", method = RequestMethod.GET)
	public String updatePurchaseView(@RequestParam("tranNo") int tranNo, Model model) throws Exception {
		
		System.out.println("/updatePurchaseView");	
		
		Purchase purchase = purchaseService.getPurchaseByTran(tranNo);
		model.addAttribute("purchase", purchase);		
		
		return "forward:/purchase/updatePurchaseView.jsp";
	}
	
	
	@RequestMapping(value ="updatePurchase", method = RequestMethod.POST)
	public String updatePurchase(@ModelAttribute("purchase") Purchase purchase)  throws Exception {
		
		System.out.println("/updatePurchase");	
		System.out.println("/////////////////////////////"+purchase);	
		purchaseService.updatePurchase(purchase);	
		
		return "redirect:/purchase/getPurchase?tranNo="+purchase.getTranNo();
	}

	@RequestMapping(value ="updateTranCodeByProd", method = RequestMethod.GET)
	public String updateTranCodeByProd(@RequestParam("prodNo") int prodNo, @RequestParam("tranCode") String tranCode) throws Exception {
		
		System.out.println("/updateTranCodeByProd");	
				
		Purchase purchase = purchaseService.getPurchaseByProd(prodNo);
		
		purchase.setTranCode(tranCode);
		purchaseService.updateTranCode(purchase);		
		
		return "forward:/product/listProduct?menu=manage";
	}
	
	@RequestMapping(value ="updateTranCodeByTran", method = RequestMethod.GET)
	public String updateTranCodeByTran(@RequestParam("tranNo") int tranNo, @RequestParam("tranCode") String tranCode) throws Exception {
		
		System.out.println("/updateTranCodeByTran");
		
		Purchase purchase = purchaseService.getPurchaseByTran(tranNo);
		
		purchase.setTranCode(tranCode);
		purchaseService.updateTranCode(purchase);		
		
		return "forward:/purchase/listPurchase";
	}

}