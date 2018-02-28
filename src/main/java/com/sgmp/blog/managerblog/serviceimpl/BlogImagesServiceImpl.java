package com.sgmp.blog.managerblog.serviceimpl;

import com.sgmp.blog.managerblog.dao.BlogImagesMapper;
import com.sgmp.blog.managerblog.pojo.BlogImages;
import com.sgmp.blog.managerblog.sampleconfigmybatis.BaseDao;
import com.sgmp.blog.managerblog.servicedao.BaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import tk.mybatis.mapper.entity.Example;

import java.io.File;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@Service
public class BlogImagesServiceImpl extends BaseService<BlogImages> {

    @Autowired
    private BlogImagesMapper blogImagesMapper;

    @Override
    public BaseDao<BlogImages> getMapper() {
        return this.blogImagesMapper;
    }

    public List<BlogImages> querybyarid(String id) {
        Example example = new Example(BlogImages.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("arid",id);
        return getMapper().selectByExample(example);
    }

    /**
     * 查询相册图片
     * @param
     * @return
     */
    public List<BlogImages> querybygallery(String gallery) {
        Example example = new Example(BlogImages.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("gallery",gallery);
        List<BlogImages> blogImages = getMapper().selectByExample(example);
        return blogImages;
    }

    /**
     * 查询摄影的图片
     * @return
     */
    public List<BlogImages> querybycategory() {
        Example example = new Example(BlogImages.class);
        Example.Criteria criteria = example.createCriteria();
        criteria.andEqualTo("gallery","1");
        List<BlogImages> blogImages = this.getMapper().selectByExample(example);
        return blogImages;
    }

    /**
     * 上传图片
     * @param blogImages
     * @param images
     * @return
     */
    @Transactional
    public Boolean saveupload(BlogImages blogImages, MultipartFile[] images) throws Exception{
        int count=0;
        for (int i=0;i<images.length;i++){
            String originaFilename=images[i].getOriginalFilename();
            if(images[i]!=null&&originaFilename!=null&&originaFilename.length()>0){
                //存储图片的物理路径
                String pic_path = "E:\\JavaEE\\images\\gallery\\";
				/*String pic_path="E:\\JavaEE\\images\\"*/
                //新的图片名称
                String newFileName= UUID.randomUUID()+originaFilename.substring(originaFilename.lastIndexOf("."));
                //新图片
                File newFile=new File(pic_path+newFileName);
                //将内存中的数据写入磁盘
                images[i].transferTo(newFile);

                //将图片名称写到MealOrder中
                blogImages.setName(newFileName);
                blogImages.setSrc("http://localhost:8080/blog/gallery/"+newFileName+"");
                blogImages.setUploadtime(new Date());
            }
            Integer save = super.save(blogImages);
            if(save==1){
                count++;
                continue;
            }else{
                break;
            }
        }
        if(count==6){
            return true;
        }else{
            return false;
        }
    }



    /*@Autowired
    private BlogImagesMapper blogImagesMapper;

    @Override
    public List<BlogImagesWithBLOBs> query(String id) {
        BlogImagesExample blogImagesExample = new BlogImagesExample();
        BlogImagesExample.Criteria criteria = blogImagesExample.createCriteria();
        criteria.andAridEqualTo(id);
        List<BlogImagesWithBLOBs> blogImages = blogImagesMapper.selectByExampleWithBLOBs(blogImagesExample);
        return blogImages;
    }*/
}
