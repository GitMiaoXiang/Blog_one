package com.sgmp.blog.managerblog.controller.ManagerSystemController;

import com.github.pagehelper.PageInfo;
import com.sgmp.blog.managerblog.controller.Msg;
import com.sgmp.blog.managerblog.pojo.BlogImages;
import com.sgmp.blog.managerblog.serviceimpl.BlogCommentServiceImpl;
import com.sgmp.blog.managerblog.serviceimpl.BlogImagesServiceImpl;
import com.sgmp.blog.managerblog.serviceimpl.BlogMessageServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.Date;

@Controller
@RequestMapping(value = "/manager/images")
public class ImagesController {

    @Autowired
    private BlogCommentServiceImpl blogCommentService;

    @Autowired
    private BlogMessageServiceImpl blogMessageService;

    @Autowired
    private BlogImagesServiceImpl blogImagesService;

    @RequestMapping(value = "/images_findall.html")
    public String aritlcefindall(Model model, @RequestParam(value = "page",defaultValue = "1")Integer page){
        /**
         * 查询未读数
         */
        Integer commentcount = blogCommentService.querycount();
        Integer messagecount = blogMessageService.querycount();
        model.addAttribute("cmtcount",commentcount);
        model.addAttribute("msgcount",messagecount);
        /**
         * 查询摄影图片
         */
        BlogImages blogImages = new BlogImages();
        blogImages.setGallery("1");
        PageInfo<BlogImages> blogImagesPageInfo = blogImagesService.queryPageListByWhere(blogImages, page, 6);
        model.addAttribute("images",blogImagesPageInfo);
        return "/manager/images";
    }

    /**
     * 跳转文件上传
     * @param model
     * @return
     */
    @RequestMapping(value = "/images_add.html")
    public String articleadd(Model model){
        /**
         * 查询未读数
         */
        Integer commentcount = blogCommentService.querycount();
        Integer messagecount = blogMessageService.querycount();
        model.addAttribute("cmtcount",commentcount);
        model.addAttribute("msgcount",messagecount);
        return "/manager/images_add";
    }

    @RequestMapping(value = "/uploadimg",method = RequestMethod.POST)
    @ResponseBody
    public Msg uploadimage(BlogImages blogImages, MultipartFile[] images) throws Exception{
        Boolean saveupload = blogImagesService.saveupload(blogImages, images);
        if(saveupload){
            return Msg.success();
        }
        return Msg.fail();
    }

    /**
     * 置顶和取消置顶
     * @param isrecommend
     * @param imid
     * @return
     */
    @RequestMapping(value = "{zhiding}/{imid}/zhiding",method=RequestMethod.PUT)
    @ResponseBody
    public Msg zhiding(@PathVariable(value = "zhiding") String isrecommend,@PathVariable(value = "imid") Integer imid){
        BlogImages blogImages = new BlogImages();
        blogImages.setGallery(null);
        blogImages.setArid(null);
        blogImages.setSrc(null);
        blogImages.setUploadtime(new Date());
        blogImages.setDescz(null);
        blogImages.setTitle(null);
        blogImages.setName(null);
        blogImages.setId(imid);
        blogImages.setIndexpic(null);
        blogImages.setIsrecommend(isrecommend);
        blogImages.setUpdown(null);
        Integer integer = blogImagesService.updateSlective(blogImages);
        if(integer==1){
            return Msg.success();
        }
        return Msg.fail();
    }

    /**
     * 上架或下架
     * @param updown
     * @param imid
     * @return
     */
    @RequestMapping(value = "{updown}/{imid}/updowm",method=RequestMethod.PUT)
    @ResponseBody
    public Msg updown(@PathVariable(value = "updown") String updown,@PathVariable(value = "imid") Integer imid){
        BlogImages blogImages = new BlogImages();
        blogImages.setGallery(null);
        blogImages.setArid(null);
        blogImages.setSrc(null);
        blogImages.setUploadtime(new Date());
        blogImages.setDescz(null);
        blogImages.setTitle(null);
        blogImages.setName(null);
        blogImages.setId(imid);
        blogImages.setIndexpic(null);
        blogImages.setIsrecommend(null);
        blogImages.setUpdown(updown);
        Integer integer = blogImagesService.updateSlective(blogImages);
        if(integer==1){
            return Msg.success();
        }
        return Msg.fail();
    }

}
