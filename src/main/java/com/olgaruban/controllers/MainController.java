package com.olgaruban.controllers;

import com.olgaruban.model.Part;
import com.olgaruban.service.PartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class MainController {

    @Autowired
    PartService partService;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String list(Model model, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "filter", required = false) String filter, @RequestParam(value = "needle", required = false) String needle) {
        if (page == null)
            page = 1;

        int pageSize = 10;
        List<Part> parts;
        int pageCount;
        if (needle == null || "".equals(needle)) {
            parts = partService.getList(page, pageSize, filter);
            pageCount = partService.getPageCount(pageSize, filter);
        } else {
            parts = partService.getListByName(page, pageSize, needle);
            pageCount = partService.getPageCountByName(pageSize, needle);
        }
        model.addAttribute("parts", parts);
        model.addAttribute("count", partService.getAvailableSets());
        model.addAttribute("current", page);
        model.addAttribute("pageCount", pageCount);
        model.addAttribute("filter", filter);
        model.addAttribute("needle", needle);
        return "list";
    }

    @RequestMapping(value = "/add", method = RequestMethod.GET)
    public ModelAndView add() {
        return new ModelAndView("add", "command", new Part());
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String add(@ModelAttribute("part")Part part, ModelMap model) {
        partService.savePart(part);
        return "redirect:/list";
    }

    @RequestMapping(value = "/edit/{id}", method = RequestMethod.GET)
    public ModelAndView edit(@PathVariable int id) {
        Part part = partService.getPart(id);
        return new ModelAndView("edit", "command", part);
    }

    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public String edit(@RequestParam(required = true, value = "id") int id, Part part) {
        part.setId(id);
        partService.savePart(part);
        return "redirect:/list";
    }

    @RequestMapping("/delete/{id}")
    public String delete(@PathVariable int id) {
        partService.deletePart(id);
        return "redirect:/list";
    }
}
