package com.springapp.mvc.service;

import com.springapp.mvc.model.Oss;

import java.util.List;

/**
 * Created by daum on 15. 7. 6..
 */
public interface AutoCompleteService {
    List<Oss> getOssList(String query);
}
