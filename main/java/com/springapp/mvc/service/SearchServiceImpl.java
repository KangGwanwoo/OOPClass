package com.springapp.mvc.service;

import com.springapp.mvc.model.Oss;
import com.springapp.mvc.repository.OssListRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by daum on 15. 7. 7..
 */

@Service
public class SearchServiceImpl implements SearchService {


    @Autowired
    private OssListRepository ossListRepository;


    @Override
    public List<Oss> findByOssname(String search) {
        String sqlQuery = '%'+search+'%';
        return ossListRepository.findByOssName(sqlQuery);
    }
}
