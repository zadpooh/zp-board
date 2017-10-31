package com.dn.spring.board;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.dn.common.support.Pagination;
import com.dn.common.utils.ViewUtils;
import com.dn.spring.annotations.RequestProperty;
import com.dn.spring.board.support.BoardParam;

@Controller
@RequestMapping(value="/board")
@RequestProperty(title="게시판", layout="default")
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
	@RequestMapping(value="/list")
	public String list(Model model
			, BoardParam boardParam 
		) throws Exception{
		
		int count = boardService.selectBoardCount(boardParam); 
		
		Pagination pagination = Pagination.getInstance(count);
		boardParam.setPagination(pagination);
		
		model.addAttribute("boardList", boardService.selectBoardList(boardParam));
		model.addAttribute("pagination", pagination);
		model.addAttribute("boardParam", boardParam);
		
		return ViewUtils.view();
	}
	
	@RequestMapping(value="/view/{boardId}")
	public String view(Model model
			, BoardParam boardParam
			, HttpServletRequest request
			) throws Exception{
		
		//조회수 증가
		boardService.updateBoardHits(boardParam);
		
		model.addAttribute("boardDetail", boardService.selectBoardDetail(boardParam));
		model.addAttribute("boardParam", boardParam);
		model.addAttribute("queryString", request.getQueryString());
		
		return ViewUtils.getView("/board/view");
	}

}

