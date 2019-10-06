<!DOCTYPE html>
<html>
	<head>
		<title>Invite Users</title>
		<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>  
	<script type="text/javascript">
	$(document).ready(function(){
	$('.checkUser').click(function (){
		 if($(this).prop("checked") == true){
			 //$(this).attr("value", true);
         }
         else if($(this).prop("checked") == false){
        	 //$(this).attr("value", false);
        	 
         }
		 var checkboxes = document.getElementsByClassName('checkUser');
		 var isSelectAllCheck = true;
		  for(var i=0, n=checkboxes.length;i<n;i++) {
		    if(checkboxes[i].checked == false){
		    	isSelectAllCheck = false;
		    	break;
			};
		  }
		  $(".checkAll").prop('checked', isSelectAllCheck)
	})

	$(".checkAll").change(function () {
	    $(".checkUser").prop('checked', $(this).prop("checked"));
	    if($(this).prop("checked") == true){
			 //$('.checkUser').attr("value", true);
        }
        else if($(this).prop("checked") == false){
        	//$('.checkUser').attr("value", false);
        }
	});
	})
	</script>				
	</head>
	<body>
	<h2>Import successful!  Select contacts to invite.</h2>	
	
	<g:form name="myForm" url="[action:'inviteUsers',controller:'google']">
	<div><input type="checkbox" class="checkAll" name="chckAll" />Select All </div> 
	<div>
	<g:each in="${contactList}" var="userMap">
		<div>
		<input type="checkbox" name="inviteUserList" class="checkUser" value="${userMap.value}"/>
		${userMap.key} (${userMap.value})
		</div>
		<br/>
	</g:each>
	</div>
	 <button type="submit">Submit</button> 
	</g:form>
	</body>
</html>
