$(function ()
{
  $('#user_first_name').focusout(clearFullnameMsg).bind('input', fullnameChangeHandler);
  $('#user_username').focusout(usernameFocusoutHandler)
                     .bind('input', usernameChangeHandler);
  $('#user_password').focusout(passwordFocusoutHandler)
                      .bind('input', passwordChangeHandler);
  $('#user_password_confirmation').focusout(passwordFocusoutHandler)
                                  .bind('input', passwordChangeHandler);
  $('#new_user').submit(signupHandler);
});

function isEmpty(obj)
{
  return _.isNull(obj) || _.isUndefined(obj) || _.isEmpty(obj)
}

function signupHandler() 
{
  isFullnameValid = fullnameSubmitHandler();
  isUsernameValid = usernameSubmitHandler();// usernameSubmitHandler();//validateUsernameOnClient($('#user_username').val());
  isPasswordValid = passwordSubmitHandler();
  return isFullnameValid && isUsernameValid && isPasswordValid;
}

function fullnameSubmitHandler()
{
  var valid = true;
  var msg;
  var fullname = $('#user_first_name').val();

  clearFullnameMsg();
  if (isEmpty(fullname)) {
    valid = false;
    msg = I18n.t("fullname_blank");
    fullnameMsgHandler(msg);
  }
  return valid;
}

function usernameSubmitHandler() 
{
  var valid = true;
  var msg;
  var username = $('#user_username').val();

  clearUsernameMsg();
  valid = usernameFocusoutHandler();
  if (valid) {
    if (isEmpty(username)) {
      valid = false;
      msg = I18n.t("username_blank");
      usernameMsgHandler("fail", msg);
    }
  }
  return valid;
}

function passwordSubmitHandler()
{
  var valid = true;
  var msg;
  var password = $('#user_password').val();
  var passwordConfirmation = $('#user_password_confirmation').val();

  clearPasswordMsg();
  valid = passwordFocusoutHandler();
  if (valid) {
    if (isEmpty(password)) 
    {
      valid = false;
      msg = I18n.t("password_blank");
      passwordMsgHandler(msg);
    }
    if (isEmpty(passwordConfirmation)) 
    {
      valid = false;
      msg = I18n.t("password_confirmation_blank");
      passwordConfirmationMsgHandler(msg);
    }
    else if ((!isEmpty(password) && !isEmpty(passwordConfirmation)) && password.trim().length == 0) 
    {
      valid = false;
      msg = I18n.t("password_all_spaces");
      passwordMsgHandler(msg);
    }
  }
  return valid;
}

function passwordFocusoutHandler() 
{
  var valid = true;
  var msg;
  var password = $('#user_password').val();
  var passwordConfirmation = $('#user_password_confirmation').val();

  clearPasswordMsg();
  if (!isEmpty(password) && password.length < 6) 
  {
    valid = false;
    msg = I18n.t("password_greater_than_or_equal_6_char");
    passwordMsgHandler(msg);
  }
  else if (isEmpty(password) && !isEmpty(passwordConfirmation))
  {
    valid = false;
    msg = I18n.t("password_blank");
    passwordMsgHandler(msg);
  }
  else if (!isEmpty(password) && !isEmpty(passwordConfirmation) && password != passwordConfirmation)
  {
    valid = false;
    msg = I18n.t("password_and_password_confirmation_not_same");
    passwordConfirmationMsgHandler(msg);
  }

  return valid;
}

function passwordChangeHandler() 
{
  clearPasswordMsg();
}

function fullnameChangeHandler()
{
  clearFullnameMsg();
}

function usernameChangeHandler()
{
  clearUsernameMsg();
}

function clearFullnameMsg()
{
  $('#user_first_name').removeClass('error');
  $('#user_first_name_message').addClass('hide');
}

function clearUsernameMsg() 
{
  $('#yes-icon').addClass("hide");
  $('#no-icon').addClass("hide");
  $('#loading-icon').addClass("hide");
  $('#user_username_message').addClass("hide")
  $('#user_username').removeClass('error');
}

function clearPasswordMsg() 
{
  $('#user_password').removeClass('error');
  $('#user_password_confirmation').removeClass('error');
  $('#user_password_message').addClass("hide");
  $('#user_password_confirmation_message').addClass("hide");

}

function fullnameMsgHandler(msg) 
{
  $('#user_first_name').addClass('error');
  $('#user_first_name_message').removeClass('hide');
  $('#user_first_name_message').text(msg);
}

function usernameMsgHandler(status, msg)
{
  if (status == "success") {
    $('#loading-icon').addClass("hide");
    $('#user_username').removeClass('error');
    $('#yes-icon').removeClass("hide");
    $('#user_username_message').removeClass("checking hide").addClass("valid").text(I18n.t("username_valid"));
  }
  else if (status == "fail") {
    $('#loading-icon').addClass("hide");
    $('#user_username').addClass('error');
    $('#user_username_message').removeClass("valid checking hide").text(msg);
  }
  else if (status == "waiting") {
    $('#user_username').removeClass('error');
    $('#yes-icon').addClass("hide");
    $('#no-icon').addClass("hide");
    $('#loading-icon').removeClass("hide");
    $('#user_username_message').removeClass("valid hide valid").addClass("checking").text(msg);
  }
}

function passwordMsgHandler(msg) 
{
  $('#user_password').addClass('error');
  $('#user_password_message').removeClass("hide");
  $('#user_password_message').text(msg);
}

function passwordConfirmationMsgHandler(msg) 
{
  $('#user_password_confirmation').addClass('error');
  $('#user_password_confirmation_message').removeClass("hide");
  $('#user_password_confirmation_message').text(msg);
}

function usernameFocusoutHandler(isAsync)
{
  var valid = true;
  var username = $('#user_username')[0].value;

  clearUsernameMsg();

  if (!isEmpty(username))
  {
    // ^ represents start of the string
    // $ represents end of the string
    if(!username.match(/^[a-zA-Z0-9_]{1,12}$/))
    {
      valid = false;
      usernameMsgHandler('fail', I18n.t("invalid_username_character"));
    }
    // validate if and only if the content has been changed
    else if((_.isUndefined(usernameFocusoutHandler.latestUsername) || usernameFocusoutHandler.latestUsername != username))
    {
      // Remember the new latest name 
      usernameFocusoutHandler.latestUsername = username;
      
      // Show the loading icon and progress text
      usernameMsgHandler('waiting', I18n.t("checking_username"));

      $.ajax({
        url: "isUsernameValid",
        data: 'username=' + username,
        statusCode: {
          // Valid
          200: function(data) {
            // Ensure that the value in the textbox is the same as the one we sent to validate
            if( $('#user_username')[0].value == username)
            {
              usernameFocusoutHandler.lastedValid = valid;
              usernameFocusoutHandler.lastedMsg   = I18n.t("username_valid");
              usernameMsgHandler('success', usernameFocusoutHandler.lastedMsg);
            }
          },
          // Invalid
          203: function(data) {
            if( $('#user_username')[0].value == username)
            {
              valid = false;
              usernameFocusoutHandler.lastedValid = valid;
              usernameFocusoutHandler.lastedMsg   = I18n.t(data.error_message);
              usernameMsgHandler('fail', usernameFocusoutHandler.lastedMsg);
            }
          },
          // Blank
          204: function(data) {
            // Ensure that the value in the textbox is still blank
            if( $('#user_username')[0].value == "")
            {
              valid = false;
              usernameFocusoutHandler.lastedValid = valid;
              usernameFocusoutHandler.lastedMsg   = I18n.t("errors.messages.blank");
              usernameMsgHandler('fail', usernameFocusoutHandler.lastedMsg);
            }
          }
        }
      })
    }
    else
    {
      valid = usernameFocusoutHandler.lastedValid;
      usernameMsgHandler(valid == true ? "success" : "fail", usernameFocusoutHandler.lastedMsg);
    }
  }
  return valid;
}

// function validateUsernameCallback()
// {
//   $('#user_username').removeClass('error');
//   $('#loading-icon').addClass("hide");
//   $('#user_username_message').removeClass("checking");
// }

// function validateUsernameOnClient(username)
// {
//   if(username == "")
//   {
//     return false;
//   }
//   // ^ represents start of the string
//   // $ represents end of the string
//   if(!username.match(/^[a-zA-Z0-9_]{1,12}$/))
//   {
//      $('#user_username').addClass('error');
//      $('#user_username_message').text(I18n.t("invalid_username_character")).removeClass("hide valid");
//     return false;
//   }
//   else
//   {
//     return true;
//   }
// }


// window.ClientSideValidations.callbacks.element.before = function(element, eventData)
// {
//   if(element.context.id == "user_username")
//   {
//     $('#yes-icon').addClass("hide");
//     $('#no-icon').addClass("hide");
//     $('#loading-icon').removeClass("hide");
//   } 
// }

// window.ClientSideValidations.callbacks.element.after = function(element, eventData)
// {
//   if(element.context.id == "user_username")
//   {
//     $('#loading-icon').addClass("hide");
//   }
// }

// window.ClientSideValidations.callbacks.element.fail = function(element, message, callback)
// {
//   if(element.context.id == "user_username" && element.context.value != "")
//   {
//     $('#yes-icon').addClass("hide");
//     $('#no-icon').removeClass("hide");
//   }
//   callback();
// }

// window.ClientSideValidations.callbacks.element.pass = function(element, callback)
// {
//   if(element.context.id == "user_username")
//   {
//     $('#no-icon').addClass("hide");
//     $('#yes-icon').removeClass("hide");
//   } 
//   callback();
// }