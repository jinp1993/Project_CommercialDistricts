package com.suc.DAO;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.suc.DTO.MemberDTO;

@Repository
public class MemberDAO {
	
	private static final String namespace = "com.suc.mybatis.myMapper";

	@Autowired
	private SqlSession sqlSession;
	
	public MemberDTO login(String id) {
		return sqlSession.selectOne(namespace + ".login", id);
	}
	
	public int test(String data) {
		return sqlSession.selectOne(namespace + ".test", data);
	}

	public int register(MemberDTO dto) {
		return sqlSession.insert(namespace + ".register", dto);	
	}
	
	public List<String> find_id(MemberDTO dto) {
		return sqlSession.selectList(namespace + ".find_id", dto);
		
	}

	public MemberDTO find_pw(MemberDTO dto) {
		return sqlSession.selectOne(namespace + ".login", dto);
	}
	
	public MemberDTO mypage(MemberDTO dto) {
		return sqlSession.selectOne(namespace + ".mypage", dto);
	}

	public int memberDel(String data) {
		String id = data;
		return sqlSession.delete(namespace + ".memberDel", id);
		
	}

	public MemberDTO userInfo(String data) {
		String id = data;
		return sqlSession.selectOne(namespace + ".login", id);
	}

	public int modify_a(MemberDTO dto) {
		return sqlSession.update(namespace + ".update", dto);
	}
}
