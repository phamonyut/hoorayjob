function handleShowOnlyEmployerPostsClick(){
	$(".EmployeePost").addClass("hide");
	$(".EmployerPost").removeClass("hide");
}

function handleShowOnlyEmployeePostsClick(){
	$(".EmployerPost").addClass("hide");
	$(".EmployeePost").removeClass("hide");
}

function handleShowAllPostsClick(){
	$(".EmployeePost").removeClass("hide");
	$(".EmployerPost").removeClass("hide");
}

function showFacebook(){
	$("#facebook-section").removeClass("ui-tabs-hide");
	$("#twitter-section").addClass("ui-tabs-hide");
}

function showTwitter(){
	$("#twitter-section").removeClass("ui-tabs-hide");
	$("#facebook-section").addClass("ui-tabs-hide");
}