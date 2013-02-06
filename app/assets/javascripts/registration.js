function checkUserType(){
	var userTypeRadio = document.getElementsByName("user[user_type]");
	if( userTypeRadio )
	{
		var selectedUserType = null;
		for( var i = 0; i < userTypeRadio.length; i++ )
		{
			if(userTypeRadio[i].checked)
			{
				selectedUserType = userTypeRadio[i];
				break;
			}
		}

		var showIndividualRow = ( selectedUserType && ( selectedUserType.value === "I" ) ) 
								? 'table-row' : 'none';

		surnameRow.style.display = showIndividualRow;
		genderRow.style.display = showIndividualRow;
		dobRow.style.display = showIndividualRow;
		idRow.style.display = showIndividualRow;
	}
}