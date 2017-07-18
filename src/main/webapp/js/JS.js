$(document).ready(function(){ 
	
$('#circleContent').carousel({interval:5000});//ÿ��5���Զ��ֲ� 

}); 
	$(document).ready(function(){
		var error = false;
		
		$("#username").blur(function(){
			var username = $("#username").val();
			if(username == '') {
				showError('username', '账户不能为空');
				error = true;
				return;
			}
			
			$.post("modifyPassProcess.php", {flag:1, username:username}, function(data){
				if(data) {
					$("#username").css({"border-color":"green"});
					$("#usernameTip").css({"display":"none"});
				} else {
					showError('username', '账户不存在');
					error = true;
				}
			});
		});

		$("#oldpass").blur(function(){
			var username = $("#username").val();
			if(username=='') {
				showError('username', '账户不能为空');
				error = true;
				return;
			}

			var oldpass = $("#oldpass").val();
			if(oldpass =='') {
				showError('oldpass', '密码不能为空');
				error = true;
				return;
			}

			$.post("modifyPassProcess.php", {flag:2, username:username, oldpass:oldpass}, function(data){
				if(data) {
					$("#oldpass").css({"border-color":"green"});
					$("#oldpassTip").css({"display":"none"});
				} else {
					showError('oldpass', '密码错误');
					error = true;
				}
			});
		});

		$("#newpass").blur(function(){
			var newpass = $("#newpass").val();
			if(newpass == '') {
				showError('newpass', '新密码不能为空');
				error = true;
			}
			else {
				$("#newpass").css({"border-color":"green"});
				$("#newpassTip").css({"display":"none"});
			}
		});

		$("#newpassAgain").blur(function(){
			var newpass = $("#newpass").val();
			if(newpass == '') {
				showError('newpass', '新密码不能为空');
				error = true;
				return;
			}

			var newpassAgain = $("#newpassAgain").val();
			if(newpassAgain != newpass) {
				showError('newpassAgain', '与输入的新密码不一致');
				error = true;
			}
			else {
				$("#newpassAgain").css({"border-color":"green"});
				$("#newpassAgainTip").css({"display":"none"});
			}
		});
		
		$("#submit").click(function(event){
			$("#username").blur();
			$("#oldpass").blur();
			$("#newpass").blur();
			$("#newpassAgain").blur();

			if(!error) {
				var username = $("#username").val();			
				var newpass = $("#newpass").val();
				$.post('modifyPassProcess.php', {flag:3, username:username, newpass:newpass}, function(data) {
					$("#modifySuccess").css({'display':'inline'});
				});
			}

			event.preventDefault();
			return false;
		});
	});

	function showError(formSpan, errorText) {
		$("#" + formSpan).css({"border-color":"red"});
		$("#" + formSpan + "Tip").empty();
		$("#" + formSpan + "Tip").append(errorText);;
		$("#" + formSpan + "Tip").css({"display":"inline"});
	}
	