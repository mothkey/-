package com.hm.zhuydemo.web.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.hm.zhuydemo.entity.ClassEntity;
import com.hm.zhuydemo.entity.FacultyEntity;
import com.hm.zhuydemo.entity.NodeEntity;
import com.hm.zhuydemo.entity.StuEntity;
import com.hm.zhuydemo.entityVO.StuEntityVO;
import com.hm.zhuydemo.service.StuService;
import com.hm.zhuydemo.web.pagehelper.PaginationResult;
import com.hm.zhuydemo.web.utils.JSONResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.xml.soap.Node;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;


/**
 * 提供前端借口调用
 */
@Controller
@RequestMapping("/stu/*")
public class StuController {

    @Autowired
    private StuService stuService;

    /**
     * 保存stu
     * @param stu
     * @return
     */
    @RequestMapping(path = "saveStu",method = RequestMethod.POST )
    @ResponseBody()
    public Integer saveStu(@RequestBody() StuEntity stu){
        int i = stuService.save(stu);
        return i;
    }

    /**
     * 删除stu
     * @param stu
     * @return
     */
    @RequestMapping(path = "delStu",method = RequestMethod.POST )
    @ResponseBody()
    public Integer delStu(@RequestBody() StuEntity stu){
        int i = stuService.delStu(stu);
        return i;
    }

    /**
     * 根据条件查询学生列表
     * @param offset
     * @param limit
     * @param name
     * @param className
     * @return
     */
    @RequestMapping(path = "getStuList",method = RequestMethod.POST)
    @ResponseBody()
    public PaginationResult getStuList(int offset, int limit, String name, String className,String classId) {
        Page<Object> page = PageHelper.offsetPage(offset, limit);
        StuEntityVO stu = new StuEntityVO();
        stu.setName(name);
        stu.setClassName(className);
        stu.setClassId(classId);
        List<StuEntityVO> stuList = stuService.getStuList(stu);
        return new PaginationResult(page.getTotal(), stuList);
    }

    public List<NodeEntity> getNodeList() {
        List<NodeEntity> nodeList = new ArrayList<NodeEntity>(); //保存所有节点  不分父子

        //院系list
        List<FacultyEntity> facultyList = stuService.getFacultyList();

        //班级List
        List<ClassEntity> classList = stuService.getClassList();

        //转化为节点集合
        for(FacultyEntity facu : facultyList){
            NodeEntity node = new NodeEntity();
            node.setId(facu.getId());
            node.setPid("");
            node.setName(facu.getName());
            nodeList.add(node);
        }
        for(ClassEntity ce : classList){
            NodeEntity node = new NodeEntity();
            node.setId(ce.getId());
            node.setPid(ce.getPid());
            node.setName(ce.getName());
            nodeList.add(node);
        }
        return nodeList;
    }

    /**
     * 获取到树结构数据
     * @return
     */
    @RequestMapping(path = "getTree",method = RequestMethod.POST )
    @ResponseBody
    public JSONResult getTree(NodeEntity node){
        JSONResult result = new JSONResult();
        result.setData(getTreeData(null,null));
        result.setState(200);
        result.setMessage("成功");
        return result;
    }

    public  String getTreeData(List<Map<String, Object>> listmap,List<NodeEntity> list){
        ObjectMapper mapper = new ObjectMapper();
        String jsonList = null;
        if( listmap == null || list == null){
            listmap = new ArrayList<Map<String,Object>>(); //保存输出结果
            list = getNodeList(); //保存所有节点  不分父子

            //根节点
            String rootNode = "湖南大学";
            Map<String,Object> rootMap = new HashMap<>();
            rootMap.put("id",""); //父节点id 下面会用来找子节点
            rootMap.put("text",rootNode);
            listmap.add(rootMap);

//            for( NodeEntity nd : list){
//                if(nd.getPid() == null || "".equals(nd.getPid()) || "null".equals(nd.getPid())){ //没有子节点
//                    Map<String,Object> map = new HashMap<>();
//                    map.put("id",nd.getId()); //父节点id 下面会用来找子节点
//                    map.put("text",nd.getName());
//                    listmap.add(map);
//                }
//            }
            getTreeData(listmap,list);
        }else if(listmap.size() > 0 && list.size() > 0) {
            for (Map<String, Object> map : listmap) {
                List<Map<String, Object>> childList = new ArrayList<Map<String, Object>>();
                for (NodeEntity nd : list) {
                    if (nd.getPid().equals(map.get("id"))) { // 找到父节点下的子节点
                        Map<String, Object> m = new HashMap<>();
                        m.put("id", nd.getId());
                        m.put("text", nd.getName());
                        childList.add(m);
                    }
                }
                if (childList.size() > 0) {
                    map.put("nodes", childList);
                    getTreeData(childList, list);
                }
            }
        }
        try {
            jsonList = mapper.writeValueAsString(listmap);
        }catch (Exception e){
            //輸出错误信息
            Logger logger = Logger.getAnonymousLogger();
            logger.config(e.getMessage());
            jsonList=e.getMessage();
        }
        return jsonList;
    }
}
