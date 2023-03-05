package kh.deli.domain.owner.mapper;

import kh.deli.domain.owner.dto.BoardDTO;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Mapper
@Repository
public interface OwnerCommunityMapper {
    void insert(BoardDTO boardDTO);

    //글 목록 출력
    List<BoardDTO> select();
    BoardDTO detailBoard(@Param("b_seq") Integer b_seq); //글상세페이지로이동
    void delete(@Param("b_seq") Integer b_seq);//글 삭제

}
