<%@ page isELIgnored="false"%>
<c:if test="${create == true}">
	<h1 class="title">Create Discussion</h1>
</c:if>
<h2 class="error" id="message"></h2>
<form onsubmit="return false;" id="discussionForm">
	<div id="discussion">
		<div class="input-container">
			<input type="hidden" name="id" id="id" value="${id}"> <input
				type="text" name="title" required="required" value="${title}" /> <label
				for="#{label}">Title</label>
			<div class="bar"></div>
		</div>
			<div class="input-container">
				<textarea rows="10" cols="10" style="min-width:581px;min-height:150px;" name="description" id="description"></textarea>
			</div>
		</div>
	<div class="input-container">
		<input type="text" id="dateTime" name="endTime" required="required"
			value="${endTime }" /><label for="#{label}">End Date</label>
		<div class="bar"></div>
	</div>
	<div>
		<c:if test="${create == true}">
			<div class="input-container">
				<input type="text" name="participants" id="participants"
					required="required" /> <label for="#{label}">participants</label>
				<div class="bar"></div>
			</div>
		</c:if>
	
		<c:if test="${create == true}">
			<div class="button-container">
				<button onclick="submitForm()" class="button"
					style="background: #338c0c !important;">
					<span>Create</span>
				</button>
			</div>
		</c:if>

	</div>
</form>
<script>
$body = $("body");

	
	function submitForm(){
		var value = CKEDITOR.instances['description'].getData();		
		$("#description").val(value);
		$body.addClass("loading");
		$.ajax({
			url:"group?page=createGroup",
			type:"POST",
			data: $("#discussionForm").serialize(),
			success: function(data){
				if(data=="success"){
					window.location.href = "<%=request.getContextPath()%>/index";
					return false;
				}
				$("#message").html(data);
				$body.removeClass("loading");
			}
		});
	}
	
	function submitFormUpdate(){
		var value = CKEDITOR.instances['addedDescription'].getData();		
		$("#addedDescription").val(value);
		$body.addClass("loading");
		$.ajax({
			url:"group?page=updateGroup",
			type:"POST",
			data: $("#discussionForm").serialize(),
			success: function(data){
				console.log(data);
				if(data=="success"){
					window.location.href = "<%=request.getContextPath()%>/index";
							return false;
						}
						$("#message").html(data);
						$body.removeClass("loading");
					}
				});
	}
</script>