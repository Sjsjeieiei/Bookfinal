package com.book.goods.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.book.common.base.BaseController;
import com.book.goods.service.GoodsService;
import com.book.goods.vo.GoodsVO;

import net.sf.json.JSONObject;
@Controller("goodsController")
@RequestMapping(value="/goods")
public class GoodsControllerImpl extends BaseController   implements GoodsController {
	@Autowired
	private GoodsService goodsService;
	
	//����Ʈ������
	@Override
	@RequestMapping(value="menuGoods.do" ,method = RequestMethod.GET)
	public ModelAndView menuGoods(String menuGoods, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String viewName=(String)request.getAttribute("viewName");
		List<GoodsVO> goodsList=goodsService.menuGoods(menuGoods);
		ModelAndView mav = new ModelAndView(viewName);
		//������ �����Ϳ� ī�װ����� �����Ͽ� return.
		mav.addObject("goodsList", goodsList);
		mav.addObject("menuGoods", menuGoods);
		return mav;
	}
	

	//��õŰ����
	@RequestMapping(value="/keywordSearch.do",method = RequestMethod.GET,produces = "application/text; charset=utf8")
	public @ResponseBody String  keywordSearch(@RequestParam("keyword") String keyword,
			                                  HttpServletRequest request, HttpServletResponse response) throws Exception{
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("utf-8");
		
		//keyword�� null�ΰ��� �ƹ��͵� return�����ʴ´�.
		if(keyword == null || keyword.equals(""))
		   return null ;
	
		//��ҹ��ڸ� ���������ʰ� �˻��ϵ��� �Ѵ�.
		keyword = keyword.toUpperCase();
	    List<String> keywordList =goodsService.keywordSearch(keyword);
	    
	    //����� ����
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("keyword", keywordList);
	    String jsonInfo = jsonObject.toString();
	    
	    //��ȯ�� string jsonObject, jsonInfo ����
	    return jsonInfo ;
	}
	
	
	//�˻�
	@RequestMapping(value="/searchGoods.do" ,method = RequestMethod.GET)
	public ModelAndView searchGoods(@RequestParam("searchWord") String searchWord,
			                       HttpServletRequest request, HttpServletResponse response) throws Exception{
		String viewName=(String)request.getAttribute("viewName");
		List<GoodsVO> goodsList=goodsService.searchGoods(searchWord);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("goodsList", goodsList);
		return mav;
	}
	
	
	//��ǰ��
	@RequestMapping(value="/goodsDetail.do" ,method = RequestMethod.GET)
	public ModelAndView goodsDetail(@RequestParam("goods_id") String goods_id,
			                       HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		HttpSession session=request.getSession();
		
		//goods_id���� �´� ������ ������ goodsMap �Ҵ�
		Map goodsMap=goodsService.goodsDetail(goods_id);
		mav.addObject("goodsMap", goodsMap);
		
		//goodsMap�� goodsVO ��ü�� ����
		GoodsVO goodsVO=(GoodsVO)goodsMap.get("goodsVO");
		
		//���޴��� �湮�� �ش� ��ǰ������ �߰�
		addGoodsInQuick(goods_id,goodsVO,session);
		
		//�� + ��ǰ�� ���� ����
		return mav;
	}
	
	
	
	//���޴�
	private void addGoodsInQuick(String goods_id,GoodsVO goodsVO,HttpSession session){
		//�ߺ�üũ�� ���� ���� �ʱ�ȭ
		boolean already_existed=false;
		
		//���� ���޴� ����Ʈ quickGoodsList �Ҵ�
		List<GoodsVO> quickGoodsList;
		quickGoodsList=(ArrayList<GoodsVO>)session.getAttribute("quickGoodsList");
		
		//���޴��� ����Ʈ�� ������
		if(quickGoodsList!=null){
			
			//���޴� ����Ʈ���� 3���� ����Ʈ�� ǥ���Ұ���.
			if(quickGoodsList.size() < 3){
				for(int i=0; i<quickGoodsList.size();i++){
					String _goodsBean=String.valueOf(quickGoodsList.get(i).getGoods_id());
					//��ǰid, goods_id�� �����ϴٸ� already_existed=true, �ڵ�����.
					if(goods_id.equals(_goodsBean)){
						already_existed=true;
						break;
					}
				}
				//already_existed�� false, �ߺ������ʴ� ���ο� ��ǰ�� ��� add
				if(already_existed==false){
					quickGoodsList.add(goodsVO);
				}

			//���޴� ����Ʈ�� 3���� �Ѿ�� �ɰ��
			}else {
				//ù���� ��ǰ�� ���ְ� ���ο� ��ǰ�� �߰�.
				quickGoodsList.remove(0);
				quickGoodsList.add(goodsVO);
			}
		
		
		//���޴��� ����Ʈ�� ���� ��� �� ArrayList���� �� �߰� add
		}else{
			quickGoodsList =new ArrayList<GoodsVO>();
			quickGoodsList.add(goodsVO);
		}
		
		//�� �۾��� �Ϸ� �� �� ���ǿ� ����.
		session.setAttribute("quickGoodsList",quickGoodsList);
		session.setAttribute("quickGoodsListNum", quickGoodsList.size());
	}
	
}