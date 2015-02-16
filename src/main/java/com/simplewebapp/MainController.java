package com.simplewebapp;


import com.simplewebapp.dao.VideoDao;
import com.simplewebapp.model.Video;
import com.simplewebapp.util.VideoParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import java.io.IOException;
import java.util.List;

@Controller
public class MainController {

    @Autowired
    private VideoDao videoDao;

    @RequestMapping("/")
    public String list(ModelMap model) {
        final List<Video> videos = videoDao.list();
        model.addAttribute("videoList", videos);
        return "list";
    }

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String add(ModelMap model, @RequestParam String videoId){

        if(videoDao.isExist(videoId)){
            model.addAttribute("exist", "This video is already added!");
            final List<Video> videos = videoDao.list();
            model.addAttribute("videoList", videos);
            return "list";
        }
        try {
            Video video = VideoParser.parseVideo(videoId);
            videoDao.addOrUpdate(video);
        } catch (IOException e) {
            model.addAttribute("error", "Invalid video ID, please try again!");
        }

        final List<Video> videos = videoDao.list();
        model.addAttribute("videoList", videos);
        return "list";
    }

    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public String delete(ModelMap model, @RequestParam Integer[] id) {
        videoDao.delete(id);
        final List<Video> videos = videoDao.list();
        model.addAttribute("videoList", videos);
        return "list";
    }

    @RequestMapping(value = "/edit", method = RequestMethod.POST)
    public String edit(ModelMap model, @RequestParam(required = false) Integer id){
        final Video video = id != null ? videoDao.get(id) : new Video();
        model.addAttribute("video", video);
        return "edit";
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String save(ModelMap model, @ModelAttribute Video video){
        videoDao.addOrUpdate(video);
        final List<Video> videos = videoDao.list();
        model.addAttribute("videoList", videos);
        return "list";
    }
}