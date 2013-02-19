var filter = {
	ALL: "all",
	ONLY_JOB: "only-job",
	ONLY_EMPLOYEE: "only-employee"
};

// On ready
$(function()
{ 
	filter.all = $("#category-left");
	filter.work = $("#category-center")
	filter.employee = $("#category-right")
	filter.selectionBubble = $("#category-selection")
	filter.selectionBar = $("#category-selection-bar")
	
	initialize()
});

function initialize()
{
	addFilterEventHandling()
}

function setActiveFilter( component, filterClass )
{
	var activeFilter = component;
	if( activeFilter )
	{
		filterClass = getFilterCSSClass( activeFilter )
	}
	else if( filterClass && filterClass.length > 0 )
	{
		if( filterClass == filter.ALL )
		{
			activeFilter = filter.all;
		}
		else if( filterClass == filter.ONLY_JOB )
		{
			activeFilter = filter.work;
		}
		else if( filterClass == filter.ONLY_EMPLOYEE )
		{
			activeFilter = filter.employee;
		}
	}
	else 
	{
		return
	}

	clearAllFilter()
	activeFilter.addClass( "active" )
	setActiveSelectionBar( filterClass )
	filter.selectionBubble.addClass( filterClass )
}

function getFilterCSSClass( activeFilter )
{
	var filterClass = "";
	if( activeFilter.attr('id') == filter.all.attr('id') )
	{
		filterClass = filter.ALL;
	}
	else if(  activeFilter.attr('id') == filter.work.attr('id') )
	{
		filterClass = filter.ONLY_JOB;
	}
	else if(  activeFilter.attr('id') == filter.employee.attr('id') )
	{
		filterClass = filter.ONLY_EMPLOYEE;
	}
	return filterClass;
}

function clearAllFilter()
{
	filter.all.removeClass()
	filter.work.removeClass()
	filter.employee.removeClass()
	filter.selectionBubble.removeClass()
	filter.selectionBar.removeClass()
}

function setActiveSelectionBar( filterClass )
{
	filter.selectionBar.addClass( filterClass )
}

function filterClickHandling()
{
	setActiveFilter( $(this) )
	return false
}

function filterHoverHandling()
{
	filter.selectionBar.removeClass()
	filter.selectionBar.addClass( getFilterCSSClass( $(this) ) )
}

function addFilterEventHandling()
{
	// Mouse Click handling
	filter.all.click( filterClickHandling )
	filter.work.click( filterClickHandling )
	filter.employee.click( filterClickHandling )

	// Mouse Hover handling
	filter.all.hover( filterHoverHandling, restoreFilterSelectionBar );
	filter.work.hover( filterHoverHandling, restoreFilterSelectionBar );
	filter.employee.hover( filterHoverHandling, restoreFilterSelectionBar );
}

function filterHoverHandling()
{
	filter.selectionBar.removeClass()
	filter.selectionBar.addClass( getFilterCSSClass( $(this) ) )
}

function restoreFilterSelectionBar()
{
	filter.selectionBar.removeClass()
	filter.selectionBar.addClass( filter.selectionBubble.attr("class") )
}