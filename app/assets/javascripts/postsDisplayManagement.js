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

function addFilterSearch(){
	$('#filterSearch').on('click', function() {
		var selectedType = "";
		var unSelectedType = "";
		$('.options input[type="checkbox"]').each( function() {
			$this = $(this);
			$jobname = $this.data('jobname')
			if( $this.prop('checked') == true ){
				if( $jobname == 'all' )
				{
					selectedType = 'all';
					return false;
				}
				else{

					selectedType += ( selectedType.length > 0 ) 
						? "," + $jobname
						: $jobname;

				}
			}
			else if( $jobname != 'all' && $jobname != 'others'){
				unSelectedType += ( unSelectedType.length > 0 )
					? "," + $jobname
					: $jobname;
			}
		});

	    $.ajax({
	      url: "updateSearch",
	      data: { searchType: selectedType, unSelected: unSelectedType },
	      success: renderPartialPosts
	    }).always(finishFiltered);

	});
}

function finishFiltered(){

}

function renderPartialPosts( data ) {
	// alert(data);
	$("#post-contents").html(data);
	// $('#post-contents').html('<%= render :partial => "post_item", :object => @posts %>');
	// $(“#post-contents”).html(“<%= escape_javascript render( :partial => "post_item", :locals => { :posts => data } ) %>”);
}