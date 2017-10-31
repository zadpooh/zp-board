package com.dn.spring.board;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dn.spring.board.domain.Board;
import com.dn.spring.board.support.BoardParam;

@Service
public class BoardService {

	@Autowired
	private BoardMapper boardMapper;
	
	/**
	 * 게시판 목록
	 * @param boardParam
	 * @return
	 */
	public ArrayList<Board> selectBoardList(BoardParam boardParam){
		return boardMapper.selectBoardList(boardParam);
	}
	
	/**
	 * 게시판 갯수
	 * @param boardParam
	 * @return
	 */
	public int selectBoardCount(BoardParam boardParam){
		return boardMapper.selectBoardCount(boardParam);
	}
	
	/**
	 * 게시판 상세정보
	 * @param boardParam
	 * @return
	 */
	public Board selectBoardDetail(BoardParam boardParam){
		return boardMapper.selectBoardDetail(boardParam);
	}
	
	/**
	 * 게시판 등록
	 * @param board
	 */
	public void insertBoard(Board board){
		boardMapper.insertBoard(board);
	}
	
	/**
	 * 게시판 수정
	 * @param board
	 */
	public void updateBoard(Board board){
		boardMapper.updateBoard(board);
	}
	
	/**
	 * 게시판 삭제
	 * @param board
	 */
	public void deleteBoard(Board board){
		boardMapper.deleteBoard(board);
	}
	
	/**
	 * 조회수 증가
	 * @param boardParam
	 */
	public void updateBoardHits(BoardParam boardParam){
		boardMapper.updateBoardHits(boardParam);
	}
}
