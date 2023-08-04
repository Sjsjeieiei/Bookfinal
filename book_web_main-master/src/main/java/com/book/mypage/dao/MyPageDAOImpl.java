package com.book.mypage.dao;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.book.member.vo.MemberVO;
import com.book.order.vo.OrderVO;

@Repository("myPageDAO")
public class MyPageDAOImpl implements MyPageDAO{
	@Autowired
	private SqlSession sqlSession;

	//�ֹ����
	public List<OrderVO> selectMyOrderHistoryList(Map dateMap) throws DataAccessException{
		List<OrderVO> myOrderHistList=(List)sqlSession.selectList("mapper.mypage.selectMyOrderHistoryList",dateMap);
		return myOrderHistList;
	}
	
	//�ֹ����
	public void updateMyOrderCancel(String order_id) throws DataAccessException{
		sqlSession.update("mapper.mypage.updateMyOrderCancel",order_id);
	}
	
	//��ǰ
	public void updateMyOrderReturn(String order_id) throws DataAccessException{
		sqlSession.update("mapper.mypage.updateMyOrderReturn",order_id);
	}
	
	//��ȯ
	public void updateMyOrderExchange(String order_id) throws DataAccessException{
		sqlSession.update("mapper.mypage.updateMyOrderExchange",order_id);
	}
	
	//������
	public MemberVO selectMyDetailInfo(String member_id) throws DataAccessException{
		MemberVO memberVO=(MemberVO)sqlSession.selectOne("mapper.mypage.selectMyDetailInfo",member_id);
		return memberVO;
		
	}
	
	//�� ���� ����
	public void updateMyInfo(Map memberMap) throws DataAccessException{
		sqlSession.update("mapper.mypage.updateMyInfo",memberMap);
	}
	
	//ȸ��Ż��
	public void deleteMember(String member_id) throws DataAccessException{
		sqlSession.update("mapper.mypage.deleteMember",member_id);
	}

	@Override
	public List<OrderVO> selectMyOrderGoodsList(String member_id) throws DataAccessException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List selectMyOrderInfo(String order_id) throws DataAccessException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delmember(String member_id) throws DataAccessException {
		// TODO Auto-generated method stub
		
	}
	
	
	
	
}
