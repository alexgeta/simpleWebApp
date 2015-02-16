package com.simplewebapp.util;


import com.simplewebapp.model.Video;
import org.jsoup.HttpStatusException;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;

import java.io.IOException;

/**
 * Parse video stats by URL
 */
public class VideoParser {


    public static Video parseVideo(String videoId) throws IOException {

        Video video = new Video();
        String videoURL = "http://www.youtube.com/watch?v=" + videoId;

        Document videoDoc = Jsoup.connect(videoURL).get();
        if (videoDoc.select("#eow-title").text().equals("")) {
            throw new HttpStatusException("This video is unavailable.", 404, videoURL);
        } else {
            video.setVideoId(videoId);
            video.setTitle(videoDoc.select("#eow-title").text());
            video.setViews(videoDoc.select(".watch-view-count").text().split(" ")[0]);
            String likes = videoDoc.select("#watch-like").text();
            System.out.println("likes : "+likes);
            String dislikes = videoDoc.select("#watch-dislike").text();
            System.out.println("dislikes : "+dislikes);
            video.setLikes(videoDoc.select("#watch-like").text());
            video.setDislikes(videoDoc.select("#watch-dislike").text());
            video.setChannel(videoDoc.select(".yt-user-info > a:nth-child(1)").text());
        }
        return video;
    }

}
