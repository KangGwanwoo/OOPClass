package com.springapp.mvc.controller;

import com.springapp.mvc.model.Oss;
import com.springapp.mvc.service.AutoCompleteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * Created by daum on 15. 7. 6..
 */
@Controller
@RequestMapping
public class AutoCompleteController {

    @Autowired
    private AutoCompleteService autoCompleteService;



    @RequestMapping(value = "/get_oss_list",
                   method = RequestMethod.GET,
                   headers = "Accept=*/*")
    public @ResponseBody List<Oss> getCountryList(@RequestParam("term") String query) {
        List<Oss> countryList = autoCompleteService.getOssList(query);
        return countryList;
    }
}
