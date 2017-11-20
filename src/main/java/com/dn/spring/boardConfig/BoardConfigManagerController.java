package com.dn.spring.boardConfig;

import com.dn.common.support.Pagination;
import com.dn.common.utils.ServerUtils;
import com.dn.common.utils.ViewUtils;
import com.dn.spring.annotations.CheckAuth;
import com.dn.spring.annotations.RequestProperty;
import com.dn.spring.board.BoardService;
import com.dn.spring.board.domain.Board;
import com.dn.spring.board.support.BoardParam;
import com.dn.spring.file.FileService;
import com.dn.spring.user.domain.UserInfo;
import com.google.gson.Gson;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;


@Controller
@RequestMapping(value="/dnmanager/board-config")
@RequestProperty(title="게시판", layout="default")
public class BoardConfigManagerController {

	Logger logger = LoggerFactory.getLogger(BoardConfigManagerController.class);

	@Autowired
	BoardConfigService boardConfigService;
	
	@Autowired
	FileService fileService;
	
	@RequestMapping(value="/list")
	@CheckAuth(value=true, level=2)
	public String list(
			Model model
		) throws Exception, IOException{

		File dir = new File("D:/adnstyle_dev/workspace/DeepNight/zp-board/src/main/webapp/WEB-INF/layout/board");
		File[] fileList = dir.listFiles();

		for(int i = 0 ; i < fileList.length ; i++){
			File file = fileList[i];
			if(file.isDirectory()){
				System.out.println("디렉토리 이름 = " + file.getName());
			}

		}


		model.addAttribute("serverHostName", ServerUtils.serverHostName());
		model.addAttribute("boardConfigList", boardConfigService.boardConifgList());
		return ViewUtils.view();
	}
	
	/*@RequestMapping(value="/create")
	@RequestProperty(title="게시판", layout="popup")
	@CheckAuth(value=true, level=2)
	public String create(Model model
			, BoardParam boardParam
			) throws Exception{
		
		model.addAttribute("boardParam", boardParam);
		return ViewUtils.getManagerView("/board/form");
	}
	
	@RequestMapping(value="/create-action")
	@ResponseBody
	public String createAction(Model model
			, Board board
			, HttpSession session
			) throws Exception{
		
		UserInfo userInfo = (UserInfo) session.getAttribute("user");
		board.setUserId(userInfo.getUserId());
		
		boardService.insertBoard(board);
		
		return "SUCCESS";
	}
	
	@RequestMapping(value="/edit/{boardId}")
	@RequestProperty(title="게시판", layout="popup")
	@CheckAuth(value=true, level=2)
	public String edit(Model model
			, BoardParam boardParam
			) throws Exception{
		
		boardParam.setMode("edit");
		model.addAttribute("boardParam", boardParam);
		model.addAttribute("boardDetail", boardService.selectBoardDetail(boardParam));
		
		return ViewUtils.getManagerView("/board/form");
	}
	
	@RequestMapping(value="/edit-action")
	@ResponseBody
	public String editAction(Model model
			, Board board
			) throws Exception{
		
		boardService.updateBoard(board);
		
		return "SUCCESS";
	}
	
	@RequestMapping(value="/delete-action")
	@ResponseBody
	public String deleteAction(Model model
			, Board board
			) throws Exception{
		
		boardService.deleteBoard(board);
		
		return "SUCCESS";
	}
	
	@RequestMapping(value="/image-upload")
	@ResponseBody
	public ResponseEntity<?> imageUpload(Model model
			, BoardParam boardParam
			, MultipartFile uploadFileImage
			) throws Exception{
		
		return fileService.fileUploadRespone(uploadFileImage);
	}*/

}

