package com.simplewebapp.dao;


import com.simplewebapp.model.Video;

import java.util.List;

/**
 * Dao for Video entity
 */
public interface VideoDao {

    public void addOrUpdate(Video video);

    public void delete(Integer[] ids);

    public List<Video> list();

    public Video get(String videoId);

    public Video get(int id);

    public boolean isExist(String videoId);

}
