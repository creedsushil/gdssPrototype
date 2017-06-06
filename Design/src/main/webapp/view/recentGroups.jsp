
<%@ page isELIgnored="false"%>
<h1 class="title">Discussions You Created</h1>

<button class="topButton">
	<span> Open </span> <input type="checkbox" id="open" checked="checked"
		onclick="filterList('open')" />
</button>

<button class="topButton">
	<span> Closed </span> <input type="checkbox" id="closed"
		checked="checked" onclick="filterList('closed')" />
</button>


<table style="width:100%">
	<thead>
		<th>SN</th>
		<th>Title</th>
		<th>Time Remaining</th>
	</thead>
	<tbody>
				<tr>
					
					<td>1</td>
					<td class="tdTitle"
						onclick="loadDiscussion(${currentGroup.getJSONObject(item).get('dis_id')});"
						onmouseover="mousePointed(event);"
						onmouseout="mouseRemoved(event);">Title</td>
					<td class="timer" id="${item}" style="display: none;">${currentGroup.getJSONObject(item).get("dis_endDate")}</td>
					<td id="timer_${item}" style="min-width: 157px;" class="timerCheck"></td>
				</tr>

	</tbody>

</table>

<script type="text/javascript">
$(function(){
		setInterval(function(){ setTimer()
		 }, 1000)
});



function setTimer(){
	$(".timer").each(function(){
		var time = (this.textContent).split('.')[0];
		var countDownDate = new Date(time).getTime();
		displayTimer(this,countDownDate);
	});
}

	function displayTimer(data,date){
		    // Get todays date and time
		    var now = new Date().getTime();
		    
		    // Find the distance between now an the count down date
		    var distance = date - now;
		    if (distance < 0 || isNaN(distance)) {
		    	document.getElementById("timer_"+data.id).innerHTML = "00:00:00";
		    	//document.getElementById("timer_"+data.id).addClass("closed");
		    	$("#timer_"+data.id).addClass("closed");
		    	if(!$("#closed:checked").attr("checked")){
		    		$(".closed").parent().hide();
		    	}		    	
		    	return false;
		    }
		    var days = Math.floor(distance / (1000 * 60 * 60 * 24));
		    var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
		    var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
		    var seconds = Math.floor((distance % (1000 * 60)) / 1000);
		    document.getElementById("timer_"+data.id).innerHTML = days + "d " + hours + "h "
		    + minutes + "m " + seconds + "s ";
		    //document.getElementById("timer_"+data.id).addClass("open");
		    $("#timer_"+data.id).addClass("open");
		    if(!$("#open:checked").attr("checked")){
	    		$(".open").parent().hide();
	    	}
	}
	
	
	function loadDiscussion(id) {
		document.location.hash = "";
		if($("#page").val()==null){
			return false;
		}
		$("#tdForm_"+id).submit();
	}
	
</script>


