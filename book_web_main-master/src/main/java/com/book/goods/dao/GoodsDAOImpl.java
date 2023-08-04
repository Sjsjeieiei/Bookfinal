package com.book.goods.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.book.goods.vo.GoodsVO;
import com.book.goods.vo.ImageFileVO;

@Repository("goodsDAO")
public class GoodsDAOImpl  implements GoodsDAO{
	@Autowired
	private SqlSession sqlSession;

	
	//���������� - ���� status��
	@Override
	public List<GoodsVO> selectGoodsList(String goodsStatus ) throws DataAccessException {
		List<GoodsVO> goodsList=(ArrayList)sqlSession.selectList("mapper.goods.selectGoodsList",goodsStatus);
		return goodsList;	
	}

	//���������� - �޴���
	@Override
	public List<GoodsVO> selectMenusList(String goodsSort) throws DataAccessException {
		List<GoodsVO> goodsList=(ArrayList)sqlSession.selectList("mapper.goods.selectMenusList",goodsSort);
		return goodsList;	
	}

	
	//header ī�װ�����
	@Override
	public List<GoodsVO> selectGoodsByMenuGoods(String menuGoods) throws DataAccessException {
		ArrayList goodsList=(ArrayList)sqlSession.selectList("mapper.goods.selectGoodsByMenuGoods",menuGoods);
		 return goodsList;
	}
	
	//��õŰ����
	@Override
	public List<String> selectKeywordSearch(String keyword) throws DataAccessException {
	   List<String> list=(ArrayList)sqlSession.selectList("mapper.goods.selectKeywordSearch",keyword);
	   return list;
	}
	
	//�˻�
	@Override
	public ArrayList selectGoodsBySearchWord(String searchWord) throws DataAccessException{
		ArrayList list=(ArrayList)sqlSession.selectList("mapper.goods.selectGoodsBySearchWord",searchWord);
		 return list;
	}
	
	//��ǰ�� - ��ǰ������ ����
	@Override
	public GoodsVO selectGoodsDetail(String goods_id) throws DataAccessException{
		GoodsVO goodsVO=(GoodsVO)sqlSession.selectOne("mapper.goods.selectGoodsDetail",goods_id);
		return goodsVO;
	}
	
	//��ǰ�� - ���̹��� ����
	@Override
	public List<ImageFileVO> selectGoodsDetailImage(String goods_id) throws DataAccessException{
		List<ImageFileVO> imageList=(ArrayList)sqlSession.selectList("mapper.goods.selectGoodsDetailImage",goods_id);
		return imageList;
	}
	
}