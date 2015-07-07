package com.springapp.mvc.service;

import com.springapp.mvc.model.Oss;

import java.util.List;

/**
 * Created by daum on 15. 7. 7..
 */
public interface SearchService {
    List<Oss> findByOssname(String search);
}
