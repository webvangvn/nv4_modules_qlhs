<!-- BEGIN: list -->

<!-- END: list -->
<!-- BEGIN: main -->
<script type="text/javascript" src="{NV_BASE_SITEURL}modules/qlhs/js/admin_tabs_old.js"></script>
  <div id="tabContainer">
    <div id="tabs">
      <ul>
        <li id="tabHeader_1">Học sinh</li>
        <li id="tabHeader_2">Giáo viên</li>
        <li id="tabHeader_3">Giáo viên chủ nhiệm</li>
		<li id="tabHeader_4">Giáo viên bộ môn</li>
		<li id="tabHeader_5">Thêm tài khoản</li>
      </ul>
    </div>
    <div id="tabscontent">
      <div class="tabpage" id="tabpage_1">
      		
				
					<form class="form-inline" id="searchhs" action="{FORM_ACTION}" method="get">
						<input name="{NV_NAME_VARIABLE}" type="hidden" value="{MODULE_NAME}" />
						<input name="{NV_OP_VARIABLE}" type="hidden" value="{OP}" />
						<input name="hs" type="hidden" value="" />
						<span><strong>{LANG.search_typehs}:</strong></span>
						<select class="form-control" name="method" id="f_method">
							<option value="">---</option>
							<!-- BEGIN: method -->
							<option value="{METHODS.key}"{METHODS.selected}>{METHODS.value}</option>
							<!-- END: method -->
						</select>
						<input class="form-control" type="text" name="value" id="f_value" value="{SEARCH_VALUE}" />
						<select class="form-control" name="usactive">
							<!-- BEGIN: usactive -->
							<option value="{USACTIVE.key}"{USACTIVE.selected}>{USACTIVE.value}</option>
							<!-- END: usactive -->
						</select>
						<input class="btn btn-primary" name="search" type="submit" value="{LANG.submit}" />
						<p>
							{LANG.search_note}
						</p>
					</form>
				
			
			<div id="hocsinh" >	
			</div>
      </div>
      <div class="tabpage" id="tabpage_2">
			<div id="giaovien" >	
			</div>
      </div>
      <div class="tabpage" id="tabpage_3">
			<div id="gvcn" >	
			</div>
      </div>
	  <div class="tabpage" id="tabpage_4">
			<div id="gvbm" >	
			</div>
      </div>
	  <div class="tabpage" id="tabpage_5">
			<div id="add" >	
			</div>
      </div>

    </div>
  </div>
 
	<script type="text/javascript">
		//<![CDATA[
			$(function() {
			  $('#hocsinh').load('{NV_BASE_SITEURL}admin/index.php?nv=qlhs&op=user&hs');
			  $('#hocsinh').show();
			   $('#user').show();
			  $('#giaovien').load('{NV_BASE_SITEURL}admin/index.php?nv=qlhs&op=user&gv');
			  $('#giaovien').show();
			  $('#gvcn').load('{NV_BASE_SITEURL}admin/index.php?nv=qlhs&op=user&gvcn');
			  $('#gvcn').show();
			  $('#gvbm').load('{NV_BASE_SITEURL}admin/index.php?nv=qlhs&op=user&gvbm');
			  $('#gvbm').show();
			  $('#add').load('{NV_BASE_SITEURL}admin/index.php?nv=qlhs&op=user_add');
			  $('#add').show();
			});
			var form = $('#searchhs');
		    form.submit(function () {
				
			     $.ajax({
				     url:form.attr('action'),
				     data: $("#searchhs").serialize(),
				     success: function (data) {
				            
				           
				            $('#hocsinh').html(data);
				            
				    }
				});
			     return false;
		    });
		//]]>
	</script> 
	<style tupe="text/css">
		#hocsinh{display:block !important;}
		#giaovien{display:block !important;}
		#gvcn{display:block !important;}
		#gvbm{display:block !important;}
		#add{display:block !important;}
		#user{display:block !important;}
	</style>	

	
<!-- END: main -->
<!-- BEGIN: hocsinh -->
	<div id="users">
		
		<div class="table-responsive">
			<table class="table table-striped table-bordered table-hover">
				<caption><em class="fa fa-file-text-o">&nbsp;</em>{TABLE_CAPTION}</caption>
				<thead>
					<tr>
						<!-- BEGIN: head_td -->
						<th>{HEAD_TD.title}</th>
						<!-- END: head_td -->
						<td class="text-center"><strong>{LANG.memberlist_active}</th>
						<th>{LANG.funcs}</th>
					</tr>
				</thead>
				<tfoot>
					<tr>
						<td colspan="7">
						<!-- BEGIN: exportfile -->
						<input type="button" class="btn btn-primary" value="{LANG.export}" name="data_export"/>
						<!-- END: exportfile -->
						<!-- BEGIN: generate_page -->
						{GENERATE_PAGE}
						<!-- END: generate_page -->
						</td>
					</tr>
				</tfoot>
				<tbody>
					<!-- BEGIN: xusers -->
					<tr>
						<td> {CONTENT_TD.userid} </td>
						<td>
						<!-- BEGIN: is_admin -->
						<img style="vertical-align:middle;" alt="{CONTENT_TD.level}" src="{NV_BASE_SITEURL}themes/{NV_ADMIN_THEME}/images/{CONTENT_TD.img}.png" width="38" height="18" />
						<!-- END: is_admin -->
						{CONTENT_TD.username} </td>
						<td> {CONTENT_TD.full_name} </td>
						<td><a href="mailto:{CONTENT_TD.email}">{CONTENT_TD.email}</a></td>
						<td> {CONTENT_TD.regdate} </td>
						<td class="text-center"><input type="checkbox" name="active" id="change_status_{CONTENT_TD.userid}" value="{CONTENT_TD.userid}"{CONTENT_TD.checked}{CONTENT_TD.disabled} /></td>
						<td style="white-space: nowrap">
						<!-- BEGIN: edit -->
						&nbsp;&nbsp; <em class="fa fa-edit fa-lg">&nbsp;</em> <a href="{EDIT_URL}">{LANG.memberlist_edit}</a>
						<!-- END: edit -->
						<!-- BEGIN: del -->
						&nbsp;&nbsp; <em class="fa fa-trash-o fa-lg">&nbsp;</em> <a href="javascript:void(0);" onclick="nv_row_del({CONTENT_TD.userid});">{LANG.delete}</a>
						<!-- END: del -->
						</td>
					</tr>
					<!-- END: xusers -->
				</tbody>
			</table>
		</div>
	</div>
	<script type="text/javascript">
		function nv_data_export(set_export) {
			$.ajax({
				type : "POST",
				url : "index.php?" + nv_name_variable + "=" + nv_module_name + "&" + nv_fc_variable + "=export&nocache=" + new Date().getTime(),
				data : "step=1&set_export=" + set_export + "&method=" + $("select[name=method]").val() + "&value=" + $("input[name=value]").val() + "&usactive=" + $("select[name=usactive]").val(),
				success : function(response) {
					if (response == "OK_GETFILE") {
						nv_data_export(0);
					} else if (response == "OK_COMPLETE") {
						$("#users").hide();
						alert('{LANG.export_complete}');
						window.location.href = script_name + '?' + nv_name_variable + '=' + nv_module_name + '&' + nv_fc_variable + '=export&step=2';
					} else {
						$("#users").hide();
						alert(response);
						window.location.href = script_name + '?' + nv_name_variable + '=' + nv_module_name;
					}
				}
			});
		}
	
	
		$("input[name=data_export]").click(function() {
			$("input[name=data_export]").attr("disabled", "disabled");
			$('#users').html('<center>{LANG.export_note}<br /><br /><img src="{NV_BASE_SITEURL}images/load_bar.gif" alt="" /></center>');
			nv_data_export(1);
		});
		
	</script>
	
<!-- END: hocsinh -->
<!-- BEGIN: giaovien -->
code trang giao vien
<!-- END: giaovien -->
<!-- BEGIN: gvcn -->
code trang giao vien chủ nhiệm
<!-- END: gvcn -->
<!-- BEGIN: gvbm -->
code trang giao vien bo mon
<!-- END: gvbm -->
