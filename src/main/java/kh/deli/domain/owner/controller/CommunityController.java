package kh.deli.domain.owner.controller;
import kh.deli.domain.owner.dto.BoardDTO;
import kh.deli.domain.owner.service.OwnerCommunityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/owner/community")
public class CommunityController {

    @Autowired
    private OwnerCommunityService service;
    private HttpSession session;


    //글 목록 출력
    @RequestMapping("")
    public String home(Model model) throws Exception {
//        *세션정보를 못가져옴
//        String loginEmail=(String)session.getAttribute("loginEmail");
//        model.addAttribute("loginEmail",loginEmail);
        List<BoardDTO> list = service.select();
        model.addAttribute("board_list", list);
        return "/owner/communityMain";
    }

    //작성폼으로 이동
    @RequestMapping("/writeForm")
    public String toWriteForm() throws Exception {
        return "/owner/writeForm";
    }

    //게시글 상세페이지로 이동
    @RequestMapping("/detailBoard")
    public String toDetailBoard(Integer b_seq, Model model) throws Exception {
        service.count(b_seq); //조회수 증가
        BoardDTO dto = service.detailBoard(b_seq);
        String nickname = service.getNickname(b_seq); //작성자와 로그인 세션 동일해야 수정 삭제 띄우려고
        model.addAttribute("nickname", nickname);
        model.addAttribute("detailBoard", dto);
        System.out.println(b_seq);
        System.out.println(nickname);
        return "/owner/detailBoard";
    }

    //insert
    @RequestMapping("/insert")
    public String insert(BoardDTO boardDTO) throws Exception {
        service.insert(boardDTO);
        return "redirect:/owner/community";
    }

    //delete
    @RequestMapping("/delete")
    public String delete(Integer b_seq) throws Exception {
        service.delete(b_seq);
        return "redirect:/owner/community";
    }

    //update
    @RequestMapping("/update")
    public String update(Integer b_seq, String b_title, String b_contents) throws Exception{
        System.out.println(b_seq);
        System.out.println(b_title);
        System.out.println(b_contents);
        service.update(b_seq,b_title,b_contents);
        return "redirect:/owner/community";
    }
}
