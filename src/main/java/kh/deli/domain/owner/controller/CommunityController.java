package kh.deli.domain.owner.controller;

import kh.deli.domain.owner.dto.BoardDTO;
import kh.deli.domain.owner.service.OwnerCommunityService;
import kh.deli.global.entity.AccountDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.mail.Session;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/owner/community")
public class CommunityController {

    @Autowired
    private OwnerCommunityService service;
    private HttpSession session;


    //select
    @RequestMapping("")
    public String home(Model model) throws Exception {
//        *세션정보를 못가져옴
//        String loginEmail=(String)session.getAttribute("loginEmail");
//        model.addAttribute("loginEmail",loginEmail);
        List<BoardDTO> list = service.select();
        model.addAttribute("board_list",list);
        return "/owner/communityMain";
    }

    //작성폼으로 이동
    @RequestMapping("/writeForm")
    public String toWriteForm() throws Exception{
        return "/owner/writeForm";
    }

    //insert
    @RequestMapping("/insert")
    public String insert(BoardDTO boardDTO) throws Exception{
        service.insert(boardDTO);
        return "redirect:/owner/community";
    }

    //delete
    @ResponseBody
    @RequestMapping("/delete")
    public void delete() throws Exception{

    }
}
