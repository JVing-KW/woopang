package com.standout.woopang.member.dao;

import java.util.Map;

import com.standout.woopang.member.dto.MemberDTO;
import org.springframework.dao.DataAccessException;

import com.standout.woopang.member.vo.MemberVO;

public interface MemberDAO {
	//로그인
	public MemberVO login(Map<String,String> loginMap) throws DataAccessException;

	//회원가입
	public void insertNewMember(MemberDTO memberDTO) throws DataAccessException;
	
	//아이디 중복확인
	public String selectOverlappedID(String id) throws DataAccessException;
}
