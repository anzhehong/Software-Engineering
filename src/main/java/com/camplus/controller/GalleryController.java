package com.camplus.controller;

import com.camplus.entity.GalleryComment;
import com.camplus.entity.GalleryImage;
import com.camplus.entity.User;
import com.camplus.service.GalleryService;
import com.camplus.service.UserService;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.util.*;
import java.util.List;

/**
 * Created by fowafolo on 15/5/26.
 */

@Controller
@RequestMapping("/gallery")


public class GalleryController {
    @Autowired
    private GalleryService service;
    @Autowired
    private UserService userService;

    @RequestMapping("")
    public String gallery(Model model,HttpSession session,String indexmove){
        List<GalleryImage> tmp=service.queryAll();
        int itemsperpage=16;
        int totalpage=tmp.size();
        if(indexmove==null)indexmove="0";
        if(indexmove.equals("head")){
            session.setAttribute("index",new Integer(0));
        }else if(indexmove.equals("tail")){
            session.setAttribute("index",new Integer(totalpage/itemsperpage));
        }else if(indexmove.equals("prev")){
            Integer nowpage=(Integer)session.getAttribute("index");
            if(nowpage==null){
                session.setAttribute("index",new Integer(0));
            }else{
                if((nowpage)<0){
                    ///Doing Nothing
                }else{
                    if(nowpage<=0)nowpage=1;
                    session.setAttribute("index",new Integer(nowpage-1));
                }
            }
        }else if(indexmove.equals("next")){
            Integer nowpage=(Integer)session.getAttribute("index");
            if(nowpage==null){
                session.setAttribute("index",new Integer(0));
            }else{
                if((nowpage+1)>totalpage/itemsperpage){
                    ///Doing Nothing
                }else{
                    session.setAttribute("index",new Integer(nowpage+1));
                }
            }
        }else{
            Integer targetpage=Integer.parseInt(indexmove)-1;
            if(targetpage>=1&&targetpage<=totalpage/itemsperpage){
                session.setAttribute("index",targetpage);
            }else{
                session.setAttribute("index",new Integer(0));
            }
        }
        ///Page Counting
        Integer nowpage=(Integer)session.getAttribute("index");
        Iterator<GalleryImage> iter;
        iter=tmp.iterator();
        int cnt=0;
        Vector<GalleryImage> vec=new Vector<GalleryImage>();
        Vector<String> userNames = new Vector<String>();
        ArrayList<Result> results = new ArrayList<Result>();
        while(iter.hasNext()){
            GalleryImage g=iter.next();
            //System.out.println(g.getCarpoolDepartureTime());
            if(cnt>=(nowpage)*itemsperpage&&cnt<(nowpage+1)*itemsperpage){
                vec.add(g);
                String userName = userService.getById(g.getGalleryUserId()).getUserName();
                userNames.add(userName);
                Result tempResult = new Result();
                tempResult.setImage(g);
                tempResult.setUserName(userName);
                results.add(tempResult);
            }else if(cnt>=(nowpage+1)*itemsperpage)break;
            cnt++;
        }

        model.addAttribute("Images",vec);
        model.addAttribute("Result",results);

        return "Gallery/galleryHome";
    }
    public class Result {
        public GalleryImage image;
        public String userName;

        public GalleryImage getImage() {
            return image;
        }

        public void setImage(GalleryImage image) {
            this.image = image;
        }

        public String getUserName() {
            return userName;
        }

        public void setUserName(String userName) {
            this.userName = userName;
        }
    }



    @RequestMapping("/hotComment")
    String hotComment(Model model,HttpSession session,String indexmove, String imageId){
//        List<GalleryComment> tmp=service.getAllComment();
//        int itemsperpage=16;
//        int totalpage=tmp.size();
//        if(indexmove==null)indexmove="0";
//        if(indexmove.equals("head")){
//            session.setAttribute("index",new Integer(0));
//        }else if(indexmove.equals("tail")){
//            session.setAttribute("index",new Integer(totalpage/itemsperpage));
//        }else if(indexmove.equals("prev")){
//            Integer nowpage=(Integer)session.getAttribute("index");
//            if(nowpage==null){
//                session.setAttribute("index",new Integer(0));
//            }else{
//                if((nowpage)<0){
//                    ///Doing Nothing
//                }else{
//                    if(nowpage<=0)nowpage=1;
//                    session.setAttribute("index",new Integer(nowpage-1));
//                }
//            }
//        }else if(indexmove.equals("next")){
//            Integer nowpage=(Integer)session.getAttribute("index");
//            if(nowpage==null){
//                session.setAttribute("index",new Integer(0));
//            }else{
//                if((nowpage+1)>totalpage/itemsperpage){
//                    ///Doing Nothing
//                }else{
//                    session.setAttribute("index",new Integer(nowpage+1));
//                }
//            }
//        }else{
//            Integer targetpage=Integer.parseInt(indexmove)-1;
//            if(targetpage>=1&&targetpage<=totalpage/itemsperpage){
//                session.setAttribute("index",targetpage);
//            }else{
//                session.setAttribute("index",new Integer(0));
//            }
//        }
//        ///Page Counting
//        Integer nowpage=(Integer)session.getAttribute("index");
//        Iterator<GalleryComment> iter;
//        iter=tmp.iterator();
//        int cnt=0;
//        Vector<GalleryComment> vec=new Vector<GalleryComment>();
//        while(iter.hasNext()){
//            GalleryComment g=iter.next();
//            //System.out.println(g.getCarpoolDepartureTime());
//            if(cnt>=(nowpage)*itemsperpage&&cnt<(nowpage+1)*itemsperpage){
//                vec.add(g);
//            }else if(cnt>=(nowpage+1)*itemsperpage)break;
//            cnt++;
//        }
//        model.addAttribute("comments",vec);



        ArrayList<GalleryImage> images = (ArrayList<GalleryImage>) service.queryAll();
        ArrayList<HotResult> hotResults = new ArrayList<HotResult>();
        for (int i = 0; i < images.size(); i++)
        {
            List<GalleryComment> tempCommentList = service.getAllCommentsByImageId(imageId);
            HotResult hotResult = new HotResult();
            hotResult.setImage(images.get(i));
            hotResult.setGalleryComments(tempCommentList);
            hotResults.add(hotResult);
        }
        model.addAttribute("Result",hotResults);


        return "Gallery/galleryHotComment";
    }
    public class HotResult{
        private GalleryImage image;
        private List<GalleryComment> galleryComments;

        public GalleryImage getImage() {
            return image;
        }

        public void setImage(GalleryImage image) {
            this.image = image;
        }

        public List<GalleryComment> getGalleryComments() {
            return galleryComments;
        }

        public void setGalleryComments(List<GalleryComment> galleryComments) {
            this.galleryComments = galleryComments;
        }
    }

    @RequestMapping("/comment")
    String newComment(String imageId,HttpSession session,String message,Model model) {
        GalleryComment gc=new GalleryComment();
        gc.setGalleryImgId(imageId);
        gc.setGalleryCommentContent(message);
        gc.setGalleryCommentId(((User)session.getAttribute("userSession")).getUserId()+new Date().getTime());
        service.addNewComment(gc);
        model.addAttribute("givenMessage","You have successfully commented!");
        return "Gallery/galleryNotification";
    }

    @RequestMapping("/mySpace")
    String mySpace(Model model,HttpSession session,String imageid){
        if(imageid!=null){
            service.removeById(imageid);
        }
        User user=(User)session.getAttribute("userSession");
        String uid=user.getUserId();
        ArrayList<GalleryImage> arrimg=(ArrayList)service.getImagesByUID(uid);
        model.addAttribute("images",arrimg);
        return "Gallery/galleryMySpace";
    }

    @RequestMapping("/upload")
    String uploadimg(@RequestParam("image")MultipartFile image,HttpSession session,Model model) {
        try {
            if(image.isEmpty()){
                model.addAttribute("givenMessage","Please select a file!");
                return "Gallery/galleryNotification";
            }else {
                String path = session.getServletContext().getRealPath("/images/gallery");
                String tmpName = image.getOriginalFilename();
                Scanner sc = new Scanner(tmpName);
                sc.useDelimiter("\\.");
                String prefix = sc.next();
                String suffix = sc.next();
                if (!suffix.equals("jpg")) {
                    int i = service.getCurrentSize();
                    String s = Integer.toString(++i);
                    int zerocnt = 6 - s.length();
                    StringBuffer sb = new StringBuffer("");
                    for (int x = 0; x < zerocnt; x++) {
                        sb.append("0");
                    }
                    sb.append(s);
                    //6 Digit
                    String realName = sb.toString();
                    String fullname=path+File.separator+realName+".jpg";
                    String fullname_comp=path+File.separator+"s"+realName+".png";
                    FileUtils.copyInputStreamToFile(image.getInputStream(),new File(tmpName));
                    File srcFile=new File(tmpName);
                    File destFile=new File(fullname_comp);
                    File odestFile=new File(fullname);
                    BufferedImage src= ImageIO.read(srcFile);
                    int width=256,height=200;
                    int owidth=src.getWidth();
                    int oheight=src.getHeight();
                    double percentage=(double)oheight/(double)owidth;
                    int nheight=(int)(percentage*1000);
                    Image im=src.getScaledInstance(width,height,Image.SCALE_DEFAULT);
                    Image oim=src.getScaledInstance(1000,nheight,Image.SCALE_DEFAULT);
                    BufferedImage tag=new BufferedImage(width,height, BufferedImage.TYPE_INT_RGB);
                    BufferedImage otag=new BufferedImage(1000,nheight,BufferedImage.TYPE_INT_RGB);
                    Graphics g=tag.getGraphics();
                    Graphics og=otag.getGraphics();
                    g.drawImage(im,0,0,null);
                    og.drawImage(oim,0,0,null);
                    g.dispose();
                    og.dispose();
                    boolean flag;
                    flag=ImageIO.write(tag,"png",new FileOutputStream(destFile));
                    flag=ImageIO.write(otag,"jpg",new FileOutputStream(odestFile));
                    GalleryImage gi=new GalleryImage();
                    gi.setGalleryImageId(realName);
                    gi.setGalleryImageLoveCount(0);
                    String id=((User)session.getAttribute("userSession")).getUserId();
                    gi.setGalleryUserId(id);
                    service.upload(gi);
                } else {
                    int i = service.getCurrentSize();
                    String s = Integer.toString(++i);
                    int zerocnt = 6 - s.length();
                    StringBuffer sb = new StringBuffer("");
                    for (int x = 0; x < zerocnt; x++) {
                        sb.append("0");
                    }
                    sb.append(s);
                    //6 Digit
                    String realName = sb.toString();
                    String fullname=path+File.separator+realName+".jpg";
                    String fullname_comp=path+File.separator+"s"+realName+".png";
                    FileUtils.copyInputStreamToFile(image.getInputStream(),new File(fullname));
                    File srcFile=new File(fullname);
                    File destFile=new File(fullname_comp);
                    BufferedImage src= ImageIO.read(srcFile);
                    int width=256,height=200;
                    int owidth=src.getWidth();
                    int oheight=src.getHeight();
                    double percentage=(double)oheight/(double)owidth;
                    int nheight=(int)(percentage*1000);
                    Image im=src.getScaledInstance(width,height,Image.SCALE_DEFAULT);
                    Image oim=src.getScaledInstance(1000,nheight,Image.SCALE_DEFAULT);
                    BufferedImage tag=new BufferedImage(width,height, BufferedImage.TYPE_INT_RGB);
                    BufferedImage otag=new BufferedImage(1000,nheight,BufferedImage.TYPE_INT_RGB);
                    Graphics g=tag.getGraphics();
                    Graphics og=otag.getGraphics();
                    g.drawImage(im, 0, 0, null);
                    og.drawImage(oim, 0, 0, null);
                    og.dispose();
                    g.dispose();
                    boolean flag=ImageIO.write(tag,"png",new FileOutputStream(destFile));
                    flag=ImageIO.write(otag,"jpg",new FileOutputStream(srcFile));
                    GalleryImage gi=new GalleryImage();
                    gi.setGalleryImageId(realName);
                    gi.setGalleryImageLoveCount(0);
                    String id=((User)session.getAttribute("userSession")).getUserId();
                    gi.setGalleryUserId(id);
                    service.upload(gi);
                }
            }
            model.addAttribute("givenMessage","Successfully Uploaded!");
            return "Gallery/galleryNotification";
        }catch(Exception e){
            e.printStackTrace();
            model.addAttribute("givenMessage","Error!!");
            return "Gallery/galleryNotification";
        }
    }

    @RequestMapping("/likeOrDislike")
    public @ResponseBody void likeOrDislikeAPhone(String imageId, HttpSession session)
    {
        if (session.getAttribute("galleryLike") != null)
        {
            ArrayList<String> likeList = (ArrayList) session.getAttribute("galleryLike");
            for (int i = 0; i< likeList.size(); i++)
            {
                if (likeList.get(i).equals(imageId))
                {
                    service.unLikeAPhoto(imageId);
                    likeList.remove(i);
                    session.setAttribute("galleryLike", likeList);
                    return;
                }
            }
            service.likeAPhoto(imageId);
            likeList.add(imageId);
            session.setAttribute("galleryLike",likeList);
        }else {
            ArrayList<String> likeList = new ArrayList();
            likeList.add(imageId);
            session.setAttribute("galleryLike", likeList);
            service.likeAPhoto(imageId);
        }
    }
}
