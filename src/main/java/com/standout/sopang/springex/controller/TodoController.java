package com.standout.sopang.springex.controller;

import com.standout.sopang.springex.dto.PageRequestDTO;
import com.standout.sopang.springex.dto.PageResponseDTO;
import com.standout.sopang.springex.dto.TodoDTO;
import com.standout.sopang.springex.service.TodoService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;


@Controller("TodoController")
@RequestMapping("/todo")
@Log4j2
@RequiredArgsConstructor
public class TodoController {

    @Autowired
    private final TodoService todoService;

    @GetMapping("/register")
    public void register() {

        log.info("GET todo register.......");
    }

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String register(@Valid TodoDTO todoDTO,
                               BindingResult bindingResult,
                               RedirectAttributes redirectAttributes) {

        log.info("POST todo register.......");
        if (bindingResult.hasErrors()) {
            log.info("has errors.......");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            return "redirect:/todo/register";
        }

        todoService.register(todoDTO);
        return "redirect:/main/main";
    }

    @GetMapping({"/read", "/modify"})
    public void read(Long tno, PageRequestDTO pageRequestDTO, Model model) {

        TodoDTO todoDTO = todoService.getOne(tno);
        log.info(todoDTO);

        model.addAttribute("dto", todoDTO);

    }

    @PostMapping("/remove")
    public String remove(Long tno, PageRequestDTO pageRequestDTO, RedirectAttributes redirectAttributes) {

        log.info("-------------remove------------------");
        log.info("tno: " + tno);

        todoService.remove(tno);

        return "redirect:/todo/list?" + pageRequestDTO.getLink();
    }

    @PostMapping("/modify")
    public String modify(
            PageRequestDTO pageRequestDTO,
            @Valid TodoDTO todoDTO,
            BindingResult bindingResult,
            RedirectAttributes redirectAttributes) {

        if (bindingResult.hasErrors()) {
            log.info("has errors.......");
            redirectAttributes.addFlashAttribute("errors", bindingResult.getAllErrors());
            redirectAttributes.addAttribute("tno", todoDTO.getTno());
            return "redirect:/todo/modify";
        }

        log.info(todoDTO);

        todoService.modify(todoDTO);

        redirectAttributes.addAttribute("tno", todoDTO.getTno());

        return "redirect:/todo/read";
    }

    //    @ResponseBody
    @RequestMapping(value = "/list", method = {RequestMethod.GET})
    public void list(@Valid PageRequestDTO pageRequestDTO, BindingResult bindingResult, Model model){

        log.info(pageRequestDTO);

        if(bindingResult.hasErrors()){
            pageRequestDTO = PageRequestDTO.builder().build();
        }
        model.addAttribute("responseDTO", todoService.getList(pageRequestDTO));
    }

    @ResponseBody
    @RequestMapping(value = "/list", method = {RequestMethod.POST})
    public PageResponseDTO<TodoDTO> list(@Valid PageRequestDTO pageRequestDTO, BindingResult bindingResult, RedirectAttributes redirectAttributes, Model model) {

        log.info("/todo/list ");

        TodoDTO dto;

        if (bindingResult.hasErrors()) {
            pageRequestDTO = PageRequestDTO.builder().build();
        }
        model.addAttribute("responseDTO", todoService.getList(pageRequestDTO));

        PageResponseDTO<TodoDTO> pageResponseDTO = todoService.getList(pageRequestDTO);
        log.info("pageResponseDTO 입니다. : " + pageResponseDTO);
        return pageResponseDTO;
    }
}
