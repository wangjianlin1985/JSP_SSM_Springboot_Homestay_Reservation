<%@ page language="java" import="java.util.*"  contentType="text/html;charset=UTF-8"%> 
<%@ page import="com.chengxusheji.po.Minsu" %>
<%@ page import="com.chengxusheji.po.Comment" %>
<%@ page import="com.chengxusheji.po.Area" %>
<%@ page import="com.chengxusheji.po.Owner" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    //获取所有的areaObj信息
    List<Area> areaList = (List<Area>)request.getAttribute("areaList");
    //获取所有的ownerObj信息
    List<Owner> ownerList = (List<Owner>)request.getAttribute("ownerList");
    Minsu minsu = (Minsu)request.getAttribute("minsu");
    ArrayList<Comment> commentList = (ArrayList<Comment>) request.getAttribute("commentList");

%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1 , user-scalable=no">
  <TITLE>查看民宿详情</TITLE>
  <link href="<%=basePath %>plugins/bootstrap.css" rel="stylesheet">
  <link href="<%=basePath %>plugins/bootstrap-dashen.css" rel="stylesheet">
  <link href="<%=basePath %>plugins/font-awesome.css" rel="stylesheet">
  <link href="<%=basePath %>plugins/animate.css" rel="stylesheet"> 
</head>
<body style="margin-top:70px;"> 
<jsp:include page="../header.jsp"></jsp:include>
<div class="container">
	<ul class="breadcrumb">
  		<li><a href="<%=basePath %>index.jsp">首页</a></li>
  		<li><a href="<%=basePath %>Minsu/frontlist">民宿信息</a></li>
  		<li class="active">详情查看</li>
	</ul>
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold">民宿id:</div>
		<div class="col-md-10 col-xs-6"><%=minsu.getMinsuId()%></div>
	</div>
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold">所在地区:</div>
		<div class="col-md-10 col-xs-6"><%=minsu.getAreaObj().getAreanName() %></div>
	</div>
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold">民宿名称:</div>
		<div class="col-md-10 col-xs-6"><%=minsu.getMinsuName()%></div>
	</div>
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold">民宿照片:</div>
		<div class="col-md-10 col-xs-6"><img class="img-responsive" src="<%=basePath %><%=minsu.getMinsuPhoto() %>"  border="0px"/></div>
	</div>
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold">每日价格:</div>
		<div class="col-md-10 col-xs-6"><%=minsu.getPrice()%></div>
	</div>
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold">民宿介绍:</div>
		<div class="col-md-10 col-xs-6"><%=minsu.getMinsuDesc()%></div>
	</div>
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold">备注信息:</div>
		<div class="col-md-10 col-xs-6"><%=minsu.getMinsuMemo()%></div>
	</div>
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold">民宿主人:</div>
		<div class="col-md-10 col-xs-6"><%=minsu.getOwnerObj().getName() %></div>
	</div>
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold">发布时间:</div>
		<div class="col-md-10 col-xs-6"><%=minsu.getAddTime()%></div>
	</div>
	
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold">评论内容:</div>
		<div class="col-md-10 col-xs-6">
			<textarea id="content" style="width:100%" rows=8></textarea>
		</div>
	</div>
	
	<div class="row bottom15">
		<div class="col-md-2 col-xs-4"></div>
		<div class="col-md-6 col-xs-6">
			<button onclick="userReply();" class="btn btn-primary">发布评论</button>
			<button onclick="userOrder();" class="btn btn-primary">我要预订</button>
			<button onclick="history.back();" class="btn btn-info">返回</button>
		</div>
	</div>
	<div class="row bottom15"> 
		<div class="col-md-2 col-xs-4 text-right bold"></div>
		<div class="col-md-8 col-xs-7">
			<% for(Comment comment: commentList) { %>
			<div class="row" style="margin-top: 20px;">
				<div class="col-md-2 col-xs-3">
					<div class="row text-center"><img src="<%=basePath %><%=comment.getUserObj().getUserPhoto() %>" style="border: none;width:60px;height:60px;border-radius: 50%;" /></div>
					<div class="row text-center" style="margin: 5px 0px;"><%=comment.getUserObj().getUser_name() %></div>
				</div>
				<div class="col-md-7 col-xs-5"><%=comment.getContent() %></div>
				<div class="col-md-3 col-xs-4" ><%=comment.getCommentTime() %></div>
			</div>
		
			<% } %> 
		</div>
	</div>
	
</div> 
<jsp:include page="../footer.jsp"></jsp:include>
<script src="<%=basePath %>plugins/jquery.min.js"></script>
<script src="<%=basePath %>plugins/bootstrap.js"></script>
<script src="<%=basePath %>plugins/wow.min.js"></script>
<script>
var basePath = "<%=basePath%>";

function userOrder() {
	location.href = basePath + "OrderInfo/orderInfo_frontUserAdd.jsp?minsuId=<%=minsu.getMinsuId() %>";	
}




function userReply() {
	var content = $("#content").val();
	if(content == "") {
		alert("请输入回复内容");
		return;
	}

	$.ajax({
		url : basePath + "Comment/userAdd",
		type : "post",
		dataType: "json",
		data: {
			"comment.minsuObj.minsuId": <%=minsu.getMinsuId() %>,
			"comment.content": content
		},
		success : function (data, response, status) {
			//var obj = jQuery.parseJSON(data);
			if(data.success){
				alert("评论成功~");
				location.reload();
			}else{
				alert(data.message);
			}
		}
	});
}



$(function(){
        /*小屏幕导航点击关闭菜单*/
        $('.navbar-collapse a').click(function(){
            $('.navbar-collapse').collapse('hide');
        });
        new WOW().init();
 })
 </script> 
</body>
</html>

