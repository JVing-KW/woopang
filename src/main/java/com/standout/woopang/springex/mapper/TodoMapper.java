
package com.standout.woopang.springex.mapper;

import com.standout.woopang.springex.domain.TodoVO;
import com.standout.woopang.springex.dto.PageRequestDTO;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface TodoMapper {

    void insert(TodoVO todoVO);

    List<TodoVO> selectAll();

    TodoVO selectOne(Long tno);

    void delete(Long tno);

    void update(TodoVO todoVO);

    List<TodoVO> selectList(PageRequestDTO pageRequestDTO);

    int getCount(PageRequestDTO pageRequestDTO);
}

