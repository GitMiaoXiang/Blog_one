package com.sgmp.blog.managerblog.servicedao;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sgmp.blog.managerblog.pojo.BlogArticle;
import com.sgmp.blog.managerblog.pojo.BlogImages;
import com.sgmp.blog.managerblog.pojo.BlogUser;
import com.sgmp.blog.managerblog.sampleconfigmybatis.BaseDao;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tk.mybatis.mapper.entity.Example;

import java.util.List;

@Service
public abstract class BaseService<T> {

    /**
     * 获取mapper接口
     * @return
     */
    public abstract BaseDao<T> getMapper();

    /**
     * 查询全部
     * @return
     */
    public List<T> query(){
        return this.getMapper().select(null);
    }

    /**
     * 根据主键查询
     * @param id
     * @return
     */
    public T queryId(Integer id){
        return this.getMapper().selectByPrimaryKey(id);
    }

    /**
     * 根据主键查询，主鍵是字符型
     * @param id
     * @return
     */
    public T queryIds(String id){
        return this.getMapper().selectByPrimaryKey(id);
    }

    /**
     * 根据条件查询一条数据
     * @param t
     * @return
     */
    public T queryOne(T t){
        return this.getMapper().selectOne(t);
    }

    /**
     * 根据条件查询数据
     * @param t
     * @return
     */
    public List<T> queryListbyWhere(T t){
        return this.getMapper().select(t);
    }

    /**
     * 分页查询数据
     * @param t
     * @param page
     * @param rows
     * @return
     */
    public PageInfo<T> queryPageListByWhere(T t, Integer page, Integer rows){
        //设置分页参数
        PageHelper.startPage(page,rows);
        List<T> list=null;
        if(t instanceof BlogArticle){
            Example example = new Example(t.getClass());
            example.setOrderByClause("isrecommend desc");
            Example.Criteria criteria = example.createCriteria();
            if(((BlogArticle) t).getCategory()!=null||((BlogArticle) t).getId()!=null||((BlogArticle) t).getUpdownframe()!=null){
                if(((BlogArticle) t).getCategory()!=null){
                    criteria.andEqualTo("category",((BlogArticle) t).getCategory());
                }
                if(((BlogArticle) t).getId()!=null){
                    criteria.andEqualTo("id",((BlogArticle) t).getId());
                }
                if(((BlogArticle) t).getUpdownframe()!=null){
                    criteria.andEqualTo("updownframe",((BlogArticle) t).getUpdownframe());
                }
            }
            list = this.getMapper().selectByExample(example);
        }else if(t instanceof BlogUser){
            Example example = new Example(t.getClass());
            example.setOrderByClause("createdate desc");
            list=this.getMapper().selectByExample(example);
        }else if(t instanceof BlogImages){
            Example example = new Example(t.getClass());
            example.setOrderByClause("updown desc,uploadtime desc");
            Example.Criteria criteria = example.createCriteria();
            criteria.andEqualTo("gallery",((BlogImages) t).getGallery());
            list=this.getMapper().selectByExample(example);
        }
        else{
            list=this.getMapper().select(t);
        }

        return new PageInfo<T>(list,3);
    }

    /**
     * 新增数据
     * @param t
     * @return
     */
    @Transactional
    public Integer save(T t){
        return this.getMapper().insert(t);
    }

    /**
     * 选择不为null的字段作为插入数据的字段插入数据
     * @param t
     * @return
     */
    public Integer saveSelective(T t){
        return  this.getMapper().insertSelective(t);
    }

    /**
     * 选择不为null的字段作为更新数据的字段更新数据
     * @param t
     * @return
     */
    public Integer updateSlective(T t){
        return this.getMapper().updateByPrimaryKeySelective(t);
    }

    /**
     * 根据主键删除数据
     * @param id
     * @return
     */
    public Integer deleteId(Integer id){
        return this.getMapper().deleteByPrimaryKey(id);
    }

    /**
     * 根据主键删除数据，字符型主键
     * @param id
     * @return
     */
    public Integer deleteIds(String id){
        return this.getMapper().deleteByPrimaryKey(id);
    }

    /**
     * 批量删除数据
     * @param ids
     * @param clazz
     * @param property
     * @return
     */
    public Integer deleteByIds(List<Object> ids,Class<T> clazz,String property){
        Example example=new Example(clazz);
        example.createCriteria().andIn(property,ids);
        return this.getMapper().deleteByExample(example);
    }

    /**
     * 根据条件查询
     * @param t
     * @return
     */
    public  Integer deleteByWhere(T t){
        return this.getMapper().delete(t);
    }





}
