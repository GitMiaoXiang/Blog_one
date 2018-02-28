package com.sgmp.blog.managerblog.serviceimpl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.sgmp.blog.managerblog.dao.BlogArticleMapper;
import com.sgmp.blog.managerblog.javabean.BlogArticleCustom;
import com.sgmp.blog.managerblog.javabean.BlogCategoryCustom;
import com.sgmp.blog.managerblog.mapper.BlogCommentMapperCustom;
import com.sgmp.blog.managerblog.pojo.*;
import com.sgmp.blog.managerblog.sampleconfigmybatis.BaseDao;
import com.sgmp.blog.managerblog.servicedao.BaseService;
import com.sgmp.blog.managerblog.utils.getDifferenceTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import tk.mybatis.mapper.entity.Example;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
public class BlogArticleServieImpl extends BaseService<BlogArticle> {

    @Autowired
    private BlogCommentMapperCustom blogCommentMapperCustom;

    @Autowired
    private BlogArticleMapper blogArticleMapper;

    @Autowired
    private BlogCommentServiceImpl blogCommentService;

    @Autowired
    private BlogImagesServiceImpl blogImagesService;

    @Autowired
    private BlogCategoryServiceImpl blogCategoryService;

    @Autowired
    private BlogTagServiceImpl blogTagService;

    @Autowired
    private BlogTagMapServiceImpl blogTagMapService;

    @Autowired
    private BlogCmtrepalyServiceImpl blogCmtrepalyService;

    @Override
    public BaseDao<BlogArticle> getMapper() {
        return this.blogArticleMapper;
    }

    public List<BlogCommentCustom> querybyid(String arid) {
        List<BlogCommentCustom> queryarticclereplaybyid = blogCommentMapperCustom.queryarticclereplaybyid(arid);
        return queryarticclereplaybyid;
    }

    public List<BlogArticle> querybycaid(String caid) {
        Page<Object> objects = PageHelper.startPage(1, 3);
        objects.setOrderBy("ckickcount desc");
        Example example = new Example(BlogArticle.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("category",caid);
        return getMapper().selectByExample(example);
    }

    /**
     * 根据时间排序查询，并显示分页
     */
    public List<BlogArticleCustom> querybydatatime() {
        PageHelper.startPage(0,3);
        List<BlogArticleCustom> blogArticleCustoms = new ArrayList<>();
        Example example = new Example(BlogArticle.class);
        example.setOrderByClause("isrecommend desc,updatedate desc");
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("updownframe","1");
        List<BlogArticle> articleList = getMapper().selectByExample(example);
        for (BlogArticle blogArticle:articleList) {
            BlogArticleCustom blogArticleCustom=new BlogArticleCustom();
            blogArticleCustom.setCount(blogCommentService.count(blogArticle.getId()));
            List<BlogImages> images = blogImagesService.querybyarid(blogArticle.getId());
            for (BlogImages blogImages : images) {
                blogArticleCustom.setSrc(blogImages.getSrc());
            }
            blogArticleCustom.setCategory(blogArticle.getCategory());
            blogArticleCustom.setCkickcount(blogArticle.getCkickcount());
            blogArticleCustom.setContent(blogArticle.getContent());
            blogArticleCustom.setCreatedate(blogArticle.getCreatedate());
            blogArticleCustom.setDescz(blogArticle.getDescz());
            blogArticleCustom.setId(blogArticle.getId());
            blogArticleCustom.setIsrecommend(blogArticle.getIsrecommend());
            blogArticleCustom.setTags(blogArticle.getTags());
            blogArticleCustom.setTitle(blogArticle.getTitle());
            blogArticleCustom.setUpdatedate(blogArticle.getUpdatedate());
            blogArticleCustoms.add(blogArticleCustom);

        }
        return blogArticleCustoms;
    }

    /**
     * 查询文章归档
     * @param i
     */
    public List<BlogCategoryCustom> querybycategroid(Integer i) {
        List<BlogCategoryCustom> blogCategoryCustoms = new ArrayList<>();
        Example example = new Example(BlogCategory.class);
        example.setOrderByClause("sortz");
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("indexz",i);
        List<BlogCategory> articleList = blogCategoryService.getMapper().selectByExample(example);
        for (BlogCategory blogCategory: articleList) {
            BlogCategoryCustom blogCategoryCustom=new BlogCategoryCustom();
            Example example1 = new Example(BlogArticle.class);
            Example.Criteria criteria1 = example1.createCriteria();
            criteria1.andEqualTo("category",blogCategory.getId());
            criteria1.andEqualTo("updownframe","1");
            blogCategoryCustom.setCount(this.getMapper().selectCountByExample(example1));
            blogCategoryCustom.setName(blogCategory.getName());
            blogCategoryCustom.setId(blogCategory.getId());
            blogCategoryCustoms.add(blogCategoryCustom);
        }
        return blogCategoryCustoms;
    }

    /**
     * 添加博文和上传缩略图
     * @param blogArticle
     * @param images
     */
    @Transactional(rollbackFor = Exception.class)
    public boolean saveandimages(BlogArticle blogArticle, MultipartFile images) throws Exception{
        SimpleDateFormat simpleDateFormatstr = new SimpleDateFormat(getDifferenceTime.TIMEFORMATSTR);
        String id=simpleDateFormatstr.format(new Date())+(int)Math.random()*10;
        //标签
        String[] tags = blogArticle.getTags().split(",");
        for(int i=0;i<tags.length;i++){
            BlogTag querybyname = blogTagService.querybyname(tags[i]);
            if(querybyname==null){
                BlogTag blogTag=new BlogTag();
                blogTag.setName(tags[i]);
                blogTag.setTime(new Date());
                blogTag.setNumber(1);
                Integer tagid = blogTagService.savequerytagid(blogTag);
                BlogTagmap blogTagmap = new BlogTagmap();
                blogTagmap.setTaid(tagid);
                blogTagmap.setArid(id);
                Integer save = blogTagMapService.save(blogTagmap);
                if(save!=1){
                    break;
                }
            } else if(querybyname!=null){
                BlogTagmap blogTagmap = new BlogTagmap();
                blogTagmap.setTaid(querybyname.getId());
                blogTagmap.setArid(id);
                Integer save = blogTagMapService.save(blogTagmap);
                if(save!=1){
                    break;
                }
            }else if(blogArticle.getId()==null){
                querybyname.setNumber(querybyname.getNumber()+1);
                querybyname.setTime(new Date());
                Integer integer = blogTagService.updateSlective(querybyname);
                if(integer==1){
                    continue;
                }
            }else{
                continue;
            }
        }
        Integer back=0;
        if(blogArticle.getId()==null||blogArticle.getId().length()<=0){
            blogArticle.setCreatedate(new Date());
            blogArticle.setUpdatedate(new Date());
            blogArticle.setId(id);
            blogArticle.setCkickcount(0);
            back = super.save(blogArticle);
        }else {
            //更新数据
            blogArticle.setCreatedate(null);
            blogArticle.setCkickcount(null);
            blogArticle.setUpdatedate(new Date());
            blogArticle.setUpdownframe(null);
            back = super.updateSlective(blogArticle);
        }

        //上传图片
        BlogImages blogImages = new BlogImages();
        String originaFilename=images.getOriginalFilename();
        if(images!=null&&originaFilename!=null&&originaFilename.length()>0){
            //存储图片的物理路径
            String pic_path = "E:\\JavaEE\\images\\";
				/*String pic_path="E:\\JavaEE\\images\\"*/
            //新的图片名称
            String newFileName= UUID.randomUUID()+originaFilename.substring(originaFilename.lastIndexOf("."));
            //新图片
            File newFile=new File(pic_path+newFileName);
            //将内存中的数据写入磁盘
            images.transferTo(newFile);

            //将图片名称写到MealOrder中
            blogImages.setName(newFileName);
            blogImages.setArid(blogArticle.getId());
            blogImages.setTitle(blogArticle.getTitle());
            blogImages.setDescz(blogArticle.getDescz());
            blogImages.setSrc("http://localhost:8080/blog/arimages/"+newFileName+"");
            blogImages.setUploadtime(new Date());
        }
        if(back==1){
            if(images!=null&&originaFilename!=null&&originaFilename.length()>0){
                Integer save1 = blogImagesService.save(blogImages);
                if(save1==1) {
                    return true;
                }
            }
            return true;
        }
        return false;
    }

}
