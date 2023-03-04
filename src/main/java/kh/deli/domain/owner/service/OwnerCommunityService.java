package kh.deli.domain.owner.service;

import kh.deli.domain.owner.dto.BoardDTO;
import kh.deli.domain.owner.mapper.OwnerCommunityMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OwnerCommunityService {
    @Autowired
    private OwnerCommunityMapper mapper;

    public void insert(BoardDTO boardDTO) throws Exception{
        mapper.insert(boardDTO);
    }

    public List<BoardDTO> select() throws Exception{
        return mapper.select();
    }
}
