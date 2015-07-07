package com.springapp.mvc.repository;

import com.springapp.mvc.model.Oss;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface OssListRepository {

    List<Oss> findAll();

    List<Oss> findByOssName(String ossname);
}