package com.suc.DAO;




import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Repository;


import com.suc.DTO.BoardDTO;






@Repository
public class BoardDAO {

	private static final String namespace="com.suc.mybatis.myMapper";
	@Autowired 

	private SqlSession sqlSession;

	
	public List<BoardDTO> list(String board){
		return sqlSession.selectList(namespace+".board_listAll",board);
	}
	public int reg_save(BoardDTO dto) {
		return sqlSession.insert(namespace+".board_savedata",dto);
	}

	public List<BoardDTO> boardView(Map<String, Object> map) {	


		return sqlSession.selectList(namespace+".board_paging",map);
	}
	public BoardDTO contentView(String idgroup) {	
		upHit(idgroup);
		return sqlSession.selectOne(namespace+".board_contentView",idgroup);
	}

	public List<BoardDTO> searchView(Map<String, Object> map){

		return sqlSession.selectList(namespace+".board_searchAll",map);
	}

	private void upHit(String id) {
		sqlSession.update(namespace+".board_upHit",id);
	}
	public void revise(BoardDTO dto) {
		sqlSession.update(namespace+".board_revise",dto);
	}
	public void contentdelete(String id) {
		sqlSession.delete(namespace+".board_content_delete",id);
	}
	
	public void reply_delete(BoardDTO dto) {
		replyCntDown(dto.getIdgroup());
		sqlSession.delete(namespace+".board_reply_delete",dto.getId());
		
	}
	private void replyCntDown(int idgroup) {
		sqlSession.update(namespace+".board_replydown",idgroup);
	}
	
	public void reply_update(BoardDTO dto) {
		sqlSession.update(namespace+".board_reply_update",dto);
	}

	public List<BoardDTO> reply_view(String idgroup) {
		return sqlSession.selectList(namespace+".board_reply_view",idgroup);
	}
	public void reply_save(BoardDTO dto) {
		replyCntUp(dto.getIdgroups());
		
		sqlSession.insert(namespace+".board_reply_save",dto);
	}
	private void replyCntUp(String idgroup) {
		sqlSession.update(namespace+".board_replyup",idgroup);
	}
	public int count(String idgroup) {
		int count =sqlSession.selectOne(namespace+".board_count",idgroup);
		return count;
	}
	public int board_viewCount(String board) {


		int count =sqlSession.selectOne(namespace+".board_viewCount",board);


		return count;
	}
	public int searchcount(Map<String, Object> map) {

		int count =sqlSession.selectOne(namespace+".board_searchCount",map);


		return count;
	}
	



}