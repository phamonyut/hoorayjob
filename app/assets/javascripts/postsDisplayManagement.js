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