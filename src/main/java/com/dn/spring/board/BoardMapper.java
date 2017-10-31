package com.dn.spring.board;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.dn.spring.board.domain.Board;
import com.dn.spring.board.support.BoardParam;

@Mapper
public interface BoardMapper {
	
	public ArrayList<Board> selectBoardList(BoardParam boardParam);
	
	public int selectBoardCount(BoardParam boardParam);
	
	public Board selectBoardDetail(BoardParam boardParam);
	
	public void insertBoard(Board board);
	
	public void updateBoard(Board board);
	
	public void deleteBoard(Board board);
	
	public void updateBoardHits(BoardParam boardParam);
	
}
