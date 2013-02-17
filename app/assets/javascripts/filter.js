// $( 
// 	function(){ 
// 		$("#category-left").hover(
// 			function(){
// 				$("#post-category-selection-bar").removeClass()
// 				$("#post-category-selection-bar").addClass("all")
// 			},restoreFilterSelectionBar);
// 		$("#category-center").hover(
// 			function(){
// 				$("#post-category-selection-bar").removeClass()
// 				$("#post-category-selection-bar").addClass("only-job")
// 			},restoreFilterSelectionBar);
// 		$("#category-right").hover(
// 			function(){
// 				$("#post-category-selection-bar").removeClass()
// 				$("#post-category-selection-bar").addClass("only-employee")
// 			},restoreFilterSelectionBar);

// 		$("#category-left").click(
// 			function(){
// 				$("#category-right").removeClass()
// 				$("#category-center").removeClass()
// 				$("#category-left").removeClass()
// 				$("#category-left").addClass("active")
// 				setFilterSelection("all")
// 				return false
// 			});
// 		$("#category-center").click(
// 			function(){
// 				$("#category-right").removeClass()
// 				$("#category-center").removeClass()
// 				$("#category-left").removeClass()
// 				$("#category-center").addClass("active")
// 				setFilterSelection("only-job")
// 				return false
// 			});
// 		$("#category-right").click(
// 			function(){
// 				$("#category-right").removeClass()
// 				$("#category-center").removeClass()
// 				$("#category-left").removeClass()
// 				$("#category-right").addClass("active")
// 				setFilterSelection("only-employee")
// 				return false
// 			});
// });

// 	function setFilterSelection( filter )
// 	{
// 		$("#post-category-selection").removeClass()
// 		$("#post-category-selection-bar").removeClass()
// 		$("#post-category-selection").addClass(filter)
// 		$("#post-category-selection-bar").addClass(filter)
// 	}

// 	function restoreFilterSelectionBar()
// 	{
// 		$("#post-category-selection-bar").removeClass()
// 		$("#post-category-selection-bar").addClass( $("#post-category-selection").attr("class") )
// 	}