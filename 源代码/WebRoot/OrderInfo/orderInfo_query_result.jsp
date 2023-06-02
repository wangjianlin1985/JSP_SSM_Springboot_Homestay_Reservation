<%@ page language="java"  contentType="text/html;charset=UTF-8"%>
<jsp:include page="../check_logstate.jsp"/> 
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/orderInfo.css" /> 

<div id="orderInfo_manage"></div>
<div id="orderInfo_manage_tool" style="padding:5px;">
	<div style="margin-bottom:5px;">
		<a href="#" class="easyui-linkbutton" iconCls="icon-edit-new" plain="true" onclick="orderInfo_manage_tool.edit();">修改</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-delete-new" plain="true" onclick="orderInfo_manage_tool.remove();">删除</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-reload" plain="true"  onclick="orderInfo_manage_tool.reload();">刷新</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-redo" plain="true" onclick="orderInfo_manage_tool.redo();">取消选择</a>
		<a href="#" class="easyui-linkbutton" iconCls="icon-export" plain="true" onclick="orderInfo_manage_tool.exportExcel();">导出到excel</a>
	</div>
	<div style="padding:0 0 0 7px;color:#333;">
		<form id="orderInfoQueryForm" method="post">
			预订民宿：<input class="textbox" type="text" id="minsuObj_minsuId_query" name="minsuObj.minsuId" style="width: auto"/>
			预订用户：<input class="textbox" type="text" id="userObj_user_name_query" name="userObj.user_name" style="width: auto"/>
			入住日期：<input type="text" id="liveDate" name="liveDate" class="easyui-datebox" editable="false" style="width:100px">
			订单状态：<input type="text" class="textbox" id="orderState" name="orderState" style="width:110px" />
			预订时间：<input type="text" id="orderTime" name="orderTime" class="easyui-datebox" editable="false" style="width:100px">
			<a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="orderInfo_manage_tool.search();">查询</a>
		</form>	
	</div>
</div>

<div id="orderInfoEditDiv">
	<form id="orderInfoEditForm" enctype="multipart/form-data"  method="post">
		<div>
			<span class="label">订单id:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="orderInfo_orderId_edit" name="orderInfo.orderId" style="width:200px" />
			</span>
		</div>
		<div>
			<span class="label">预订民宿:</span>
			<span class="inputControl">
				<input class="textbox"  id="orderInfo_minsuObj_minsuId_edit" name="orderInfo.minsuObj.minsuId" style="width: auto"/>
			</span>
		</div>
		<div>
			<span class="label">预订用户:</span>
			<span class="inputControl">
				<input class="textbox"  id="orderInfo_userObj_user_name_edit" name="orderInfo.userObj.user_name" style="width: auto"/>
			</span>
		</div>
		<div>
			<span class="label">入住日期:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="orderInfo_liveDate_edit" name="orderInfo.liveDate" />

			</span>

		</div>
		<div>
			<span class="label">入住天数:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="orderInfo_orderDays_edit" name="orderInfo.orderDays" style="width:80px" />

			</span>

		</div>
		<div>
			<span class="label">订单总价:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="orderInfo_totalPrice_edit" name="orderInfo.totalPrice" style="width:80px" />

			</span>

		</div>
		<div>
			<span class="label">订单备注:</span>
			<span class="inputControl">
				<textarea id="orderInfo_orderMemo_edit" name="orderInfo.orderMemo" rows="8" cols="60"></textarea>

			</span>

		</div>
		<div>
			<span class="label">订单状态:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="orderInfo_orderState_edit" name="orderInfo.orderState" style="width:200px" />

			</span>

		</div>
		<div>
			<span class="label">预订时间:</span>
			<span class="inputControl">
				<input class="textbox" type="text" id="orderInfo_orderTime_edit" name="orderInfo.orderTime" />

			</span>

		</div>
	</form>
</div>
<script type="text/javascript" src="OrderInfo/js/orderInfo_manage.js"></script> 
