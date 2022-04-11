package com.model2.mvc.web.purchase;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpRequest;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.product.ProductService;
import com.model2.mvc.service.purchase.PurchaseService;


//==> 회원관리 RestController
@RestController
@RequestMapping("/purchase/*")
public class PurchaseRestController {
	
	///Field
	@Autowired
	@Qualifier("purchaseServiceImpl")
	private PurchaseService purchaseService;
	//setter Method 구현 않음
		
	public PurchaseRestController(){
		System.out.println(this.getClass());
	}
	
	///Field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	//setter Method 구현 않음
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;			
	
	/*
	@RequestMapping( value="", method=RequestMethod.GET )
	public User addPurchaseView( @PathVariable String userId ) throws Exception{
		
		System.out.println("/purchase/json/addPurchaseView : GET");
		
		//Business Logic
		return null;
	}
	*/
	
	/*
	@RequestMapping( value="", method=RequestMethod.GET )
	public User addPurchase( @PathVariable String userId ) throws Exception{
		
		System.out.println("/purchase/json/addPurchase : GET");
		
		//Business Logic
		return null;
	}
	*/
	
	@RequestMapping( value="json/listPurchase")
	public Map listPurchase( @RequestBody Map map ) throws Exception{
		
		System.out.println("/purchase/json/listPurchase");
		
		Search search = null;
		User user = null;
		
		search = (Search) map.get("search");
		user = (User) map.get("user");		
		
		//Business Logic
		if (search.getCurrentPage() == 0) {
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		Map<String, Object> inputParam = new HashMap<String, Object>();
		
		inputParam.put("search", search);
		inputParam.put("buyerId", user.getUserId());
		
		// Business logic 수행
		Map<String, Object> resultmap = purchaseService.getPurchaseList(inputParam);

		Page resultPage = new Page(search.getCurrentPage(), ((Integer) resultmap.get("totalCount")).intValue(), pageUnit,	pageSize);
		System.out.println(resultPage);
		
		// Model 과 View 연결
		resultmap.put("list", resultmap.get("list"));		
		resultmap.put("resultPage", resultPage);
		resultmap.put("search", search);
	
		return map;
	}

	
	
	@RequestMapping( value="json/getPurchase/{tranNo}", method=RequestMethod.GET )
	public Purchase getPurchase( @PathVariable int tranNo ) throws Exception{
		
		System.out.println("/purchase/json/getPurchase : GET");
		
		//Business Logic
		return purchaseService.getPurchaseByTran(tranNo);
	}
	
	
	/*
	@RequestMapping( value="", method=RequestMethod.GET )
	public User updatePurchaseView( @PathVariable String userId ) throws Exception{
		
		System.out.println("/purchase/json/updatePurchaseView : GET");
		
		//Business Logic
		return null;
	}
	*/
	
	/*
	@RequestMapping( value="", method=RequestMethod.GET )
	public User updatePurchase( @PathVariable String userId ) throws Exception{
		
		System.out.println("/purchase/json/updatePurchase : GET");
		
		//Business Logic
		return null;
	}
	*/
	
	/*
	@RequestMapping( value="", method=RequestMethod.GET )
	public User updateTranCodeByProd( @PathVariable String userId ) throws Exception{
		
		System.out.println("/purchase/json/updateTranCodeByProd : GET");
		
		//Business Logic
		return null;
	}
	*/
	
	/*
	@RequestMapping( value="", method=RequestMethod.GET )
	public User updateTranCodeByTran( @PathVariable String userId ) throws Exception{
		
		System.out.println("/purchase/json/updateTranCodeByTran : GET");
		
		//Business Logic
		return null;
	}
	*/
}