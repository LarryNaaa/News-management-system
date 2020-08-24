<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%
    request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
    <link href="${pageContext.request.contextPath}/css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js"></script>
</head>
<body>
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
        <li><a href="#">首页</a></li>
        <li><a href="#">新闻类别列表</a></li>
    </ul>
</div>
<div class="rightinfo">
    <div class="tools">
        <ul class="toolbar">
            <li class="click"><a href="${pageContext.request.contextPath}/toAddCategory.action"><span><img src="images/t01.png" /></span>添加新闻类别</a></li>
        </ul>
    </div>
    <form action="${pageContext.request.contextPath}/findCategoryList.action" id="categoryListForm" method="post">
        <ul class="seachform">
            <li><label>&nbsp;&nbsp;&nbsp;&nbsp;搜索关键词:</label>
                <input name="keywords" value="${keywords}" placeholder="这里输入新闻类别名称"
                       type="text" style="width: 400px;" class="scinput" />
            </li>
            <li><label style="width: 60px;">角色：</label>
                <select name="categoryListRoleId" id="categoryListRoleId" class="dfinput">
                    <option value="">--请选择--</option>
                    <c:forEach items="${categoryList}" var="c">
                        <option value="${c.categoryId}"
                                <c:if test="${c.categoryId eq categoryListRoleId }">
                                    selected="selected"
                                </c:if>>
                            &nbsp;&nbsp;&nbsp;&nbsp;${c.categoryName }
                        </option>
                    </c:forEach>
                </select>
            </li>
            <li><label>&nbsp;</label><input name="" type="submit" class="scbtn" value="查询" /></li>
        </ul>
    </form>

    <table class="tablelist" >
        <thead>
        <tr>
            <th style="width:100px;text-align:center;">新闻类别ID</th>
            <th style="width:100px;text-align:center;">新闻类别名称</th>
            <th style="width:200px;text-align:center;">操作</th>
        </tr>
        </thead>
        <tbody>
        <c:if test="${! empty categoryList}">
            <c:forEach items="${categoryList}" var="category">
                <tr>
                    <td align="center">${category.categoryId}</td>
                    <td align="center">${category.categoryName}</td>
                    <td align="center">
                        <a href="${pageContext.request.contextPath}/toEditCategory.action?categoryId=${category.categoryId}">修改</a>
                        &nbsp;|&nbsp;<a href='#' onclick="del(${category.categoryId})">删除</a>
                    </td>
                </tr>
            </c:forEach>
        </c:if>
        <c:if test="${empty categoryList}">
            <div>
                <tr>
                    <td colspan="2" align="center">
                        暂无新闻类别
                    </td>
                </tr>
            </div>
        </c:if>
        </tbody>
    </table>
    <script type="text/javascript">
        function del(categoryId){
            if(window.confirm("您确定要删除吗？"))
            {
                $.ajax({
                    url:"${pageContext.request.contextPath }/delCategory.action",
                    type:"post",
                    //data表示发送的数据
                    data:JSON.stringify({categoryId:categoryId}),
                    // 定义发送请求的数据格式为JSON字符串
                    contentType:"application/json;charset=UTF-8",
                    //定义回调响应的数据格式为JSON字符串，该属性可以省略
                    dataType:"json",
                    //成功响应的结果
                    success:function(data){
                        if(data!=null){
                            if(data.categoryId>0){
                                alert("删除成功！");
                                window.location.reload();
                            }else{
                                alert("删除失败！");
                                window.location.reload();
                            }
                        }
                    }
                });
            }
        }
    </script>
</div>
</body>
</html>