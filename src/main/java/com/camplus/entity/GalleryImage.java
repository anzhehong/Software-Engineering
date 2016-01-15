package com.camplus.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Created by fowafolo on 15/5/19.
 */

@Entity
@Table
public class GalleryImage implements Comparable<GalleryImage>{

    @Id
    private String galleryImageId;
    private int galleryImageLoveCount;
    private String galleryUserId;

    public String getGalleryUserId() {
        return galleryUserId;
    }

    public void setGalleryUserId(String galleryUserId) {
        this.galleryUserId = galleryUserId;
    }


    public String getGalleryImageId() {
        return galleryImageId;
    }

    public void setGalleryImageId(String galleryImageId) {
        this.galleryImageId = galleryImageId;
    }

    public int getGalleryImageLoveCount() {
        return galleryImageLoveCount;
    }

    public void setGalleryImageLoveCount(int galleryImageLoveCount) {
        this.galleryImageLoveCount = galleryImageLoveCount;
    }

    @Override
    public int compareTo(GalleryImage o) {
        return Integer.compare(o.getGalleryImageLoveCount(),this.galleryImageLoveCount);
    }
}
