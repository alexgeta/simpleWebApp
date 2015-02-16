package com.simplewebapp.dao;

import com.simplewebapp.model.Video;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author Alex Geta
 */
@Transactional
public class VideoDaoImpl implements VideoDao{


    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void addOrUpdate(Video video) {
        sessionFactory.getCurrentSession().saveOrUpdate(video);
    }

    @Override
    public void delete(Integer[] ids) {
        String hql = "delete from Video v where v.id in :videoIds";
        sessionFactory.getCurrentSession().createQuery(hql)
                .setParameterList("videoIds", ids).executeUpdate();
    }

    @Override
    public List<Video> list() {
        @SuppressWarnings("unchecked")
        List<Video> videos = (List<Video>) sessionFactory
                .getCurrentSession()
                .createCriteria(Video.class)
                .list();
        return videos;
    }

    @Override
    public Video get(String videoId) {
        return (Video) sessionFactory.getCurrentSession().load(Video.class, videoId);
    }

    @Override
    public Video get(int id) {
        @SuppressWarnings("unchecked")
        final List<Video> list = (List<Video>) sessionFactory.getCurrentSession()
                .createQuery("from Video where id=?")
                .setParameter(0, id)
                .list();
        return list.get(0);
    }

    @Override
    public boolean isExist(String videoId) {
        final List list = sessionFactory.getCurrentSession()
                .createQuery("from Video where video_id=?")
                .setParameter(0, videoId)
                .list();
        return list.size() > 0;
    }
}
