package com.camplus.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Created by fowafolo on 15/5/19.
 */

@Entity
@Table
public class GalleryComment {

    @Id
    private String galleryCommentId;

    private String galleryImgId;
    private String galleryCommentContent;

    public String getGalleryCommentId() {
        return galleryCommentId;
    }

    public void setGalleryCommentId(String galleryCommentId) {
        this.galleryCommentId = galleryCommentId;
    }

    public String getGalleryImgId() {
        return galleryImgId;
    }

    public void setGalleryImgId(String galleryImgId) {
        this.galleryImgId = galleryImgId;
    }

    public String getGalleryCommentContent() {
        return galleryCommentContent;
    }

    public void setGalleryCommentContent(String galleryCommentContent) {
        this.galleryCommentContent = galleryCommentContent;
    }
}
