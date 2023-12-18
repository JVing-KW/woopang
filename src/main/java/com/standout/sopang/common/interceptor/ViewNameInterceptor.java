package com.standout.sopang.common.interceptor;

import java.sql.Wrapper;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.standout.sopang.member.dto.MemberDTO;
import lombok.extern.log4j.Log4j2;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.standout.sopang.member.vo.MemberVO;
@Log4j2
public class ViewNameInterceptor extends HandlerInterceptorAdapter {

	//count�� ������ �ҷ����� ���� intercrptor�� sqlSession�߰�.
	@Autowired
	private SqlSession sqlSession;

	//�Ϲݻ��������, ������������ �����ϱ� ���� memberVO ���� ����Ѵ�.
	@Autowired
	private MemberDTO memberDTO;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {

		HttpSession session = request.getSession();

		try {
			memberDTO=(MemberDTO) session.getAttribute("memberInfo");
			String  member_id=memberDTO.getMember_id();
			int cartCount = 0;
			cartCount=sqlSession.selectOne("mapper.sopang.counts.cartLen",member_id);
			session.setAttribute("cartCount", cartCount);

			int deliveringCount = 0;
			deliveringCount=sqlSession.selectOne("mapper.sopang.counts.deliveringLen",member_id);
			session.setAttribute("deliveringCount", deliveringCount);

			Long sopang_money = 0L;
			sopang_money=(Long)sqlSession.selectOne("mapper.sopang.counts.sopang_money",member_id);
			session.setAttribute("sopang_money", sopang_money);
	log.info("session InterCepter" + cartCount);
			log.info("session InterCepter" + deliveringCount);
			//System.out.println(member_id);
			if(member_id.equals("1111") == true) {
				int goodsLen = 0;
				goodsLen=sqlSession.selectOne("mapper.sopang.counts.goodsLen");
				session.setAttribute("goodsLen", goodsLen);

				int ordersLen = 0;
				ordersLen=sqlSession.selectOne("mapper.sopang.counts.ordersLen");
				session.setAttribute("ordersLen", ordersLen);

				Long totalSales = 0L;
				totalSales=(Long)sqlSession.selectOne("mapper.sopang.counts.totalSales");
				session.setAttribute("totalSales", totalSales);
			}

		}catch (Exception e) {
		}

		return true;
	}

}