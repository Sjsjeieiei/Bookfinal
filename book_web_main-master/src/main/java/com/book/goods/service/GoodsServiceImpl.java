package com.book.goods.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.book.goods.dao.GoodsDAO;
import com.book.goods.vo.GoodsVO;
import com.book.goods.vo.ImageFileVO;
@Service("goodsService")
@Transactional(propagation = Propagation.REQUIRED)
public class GoodsServiceImpl implements GoodsService {
	@Autowired
	private GoodsDAO goodsDAO;

	public Map<String, List<GoodsVO>> listGoods() throws Exception {
		Map<String, List<GoodsVO>> goodsMap = new HashMap<String, List<GoodsVO>>();

		//bestseller 占쏙옙占쏙옙
		List<GoodsVO> goodsList = goodsDAO.selectGoodsList("bestseller");
		goodsMap.put("bestseller", goodsList);

		//占쏙옙占쏙옙占쏙옙 占쏙옙품 占쏙옙占쏙옙
		goodsList = goodsDAO.selectMenusList("문학");
		goodsMap.put("cate_mun", goodsList);

		//占쏙옙占쏙옙 占쏙옙품 占쏙옙占쏙옙
		goodsList = goodsDAO.selectMenusList("it");
		goodsMap.put("cate_it", goodsList);

		//占실곤옙占쏙옙占실� 占쏙옙품 占쏙옙占쏙옙
		goodsList = goodsDAO.selectMenusList("만화");
		goodsMap.put("cate_man", goodsList);

		//占쏙옙활占쏙옙품 占쏙옙품 占쏙옙占쏙옙
		goodsList = goodsDAO.selectMenusList("웹툰");
		goodsMap.put("cate_web", goodsList);
		
		//占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙 Map return
		return goodsMap;
	}

	
	
	//header 카占쌓곤옙占쏙옙
	@Override
	public List<GoodsVO> menuGoods(String menuGoods) throws Exception {
		List goodsList = goodsDAO.selectGoodsByMenuGoods(menuGoods);
		return goodsList;
	}
	
	

	//占쏙옙천키占쏙옙占쏙옙
	@Override
	public List<String> keywordSearch(String keyword) throws Exception {
		List<String> list = goodsDAO.selectKeywordSearch(keyword);
		return list;
	}

	
	//占싯삼옙
	@Override
	public List<GoodsVO> searchGoods(String searchWord) throws Exception {
		List goodsList = goodsDAO.selectGoodsBySearchWord(searchWord);
		return goodsList;
	}
	

	//占쏙옙품占쏙옙
	public Map goodsDetail(String _goods_id) throws Exception {
		Map goodsMap = new HashMap();
		//占쏙옙품占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙
		GoodsVO goodsVO = goodsDAO.selectGoodsDetail(_goods_id);
		goodsMap.put("goodsVO", goodsVO);
		
		//占쏙옙품 占쏙옙占싱뱄옙占쏙옙 占쏙옙占쏙옙
		List<ImageFileVO> imageList = goodsDAO.selectGoodsDetailImage(_goods_id);
		goodsMap.put("imageList", imageList);
		
		//占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙 Map return
		return goodsMap;
	}

}
