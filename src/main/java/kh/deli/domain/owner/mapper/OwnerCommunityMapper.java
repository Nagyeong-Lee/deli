package kh.deli.domain.owner.mapper;

import kh.deli.domain.owner.dto.BoardDTO;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface OwnerCommunityMapper {
    void insert(BoardDTO boardDTO);
    List<BoardDTO> select();
}
