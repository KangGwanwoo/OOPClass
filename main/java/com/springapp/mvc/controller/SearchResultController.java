package com.springapp.mvc.controller;

import com.springapp.mvc.model.Oss;
import com.springapp.mvc.service.SearchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * Created by daum on 15. 7. 7..
 */

@Controller
@RequestMapping
public class SearchResultController {
    @Autowired
    SearchService searchService;


    @RequestMapping("/search-result")
    public List<Oss> list2(@RequestParam(value = "searchValue") String search, Model model) {


        List<Oss> ossList = searchService.findByOssname(search);

        return ossList;

    }

}
