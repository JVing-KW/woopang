package com.standout.woopang.springex.service;

import com.standout.woopang.springex.dto.PageRequestDTO;
import com.standout.woopang.springex.dto.PageResponseDTO;
import com.standout.woopang.springex.dto.TodoDTO;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

@Service
public interface TodoService {

    void register(TodoDTO todoDTO);

    PageResponseDTO<TodoDTO> getList(PageRequestDTO pageRequestDTO);

    TodoDTO getOne(Long tno);

    void remove(Long tno);

    void modify(TodoDTO todoDTO);
}

