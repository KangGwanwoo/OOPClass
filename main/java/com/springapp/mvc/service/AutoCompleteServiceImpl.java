package com.springapp.mvc.service;

import com.springapp.mvc.model.Oss;
import com.springapp.mvc.repository.OssListRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by daum on 15. 7. 6..
 */

@Service
public class AutoCompleteServiceImpl implements AutoCompleteService{
    @Autowired
    private OssListRepository ossListRepository;

    @Override
    public List<Oss> getOssList(String query) {
        String sqlQuery = '%'+query+'%';
        return ossListRepository.findByOssName(sqlQuery);
    }
}
