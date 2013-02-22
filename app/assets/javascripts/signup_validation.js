$(function ()
{
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
  isPasswordValid = passwordSubmitHandler();
  return isPasswordValid;
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
      msg = 'password cannot be blank';
      passwordMsgHandler(valid, msg);
    }
    if (isEmpty(passwordConfirmation)) 
    {
      valid = false;
      msg = 'password confirmation cannot be blank';
      passwordConfirmationMsgHandler(valid, msg);
    }
    else if ((!isEmpty(password) && !isEmpty(passwordConfirmation)) && password.trim().length == 0) 
    {
      valid = false;
      msg = "all characters of password cannot be space";
      passwordMsgHandler(valid, msg);
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
    msg = 'password should be more than or equals 6 characters';
    passwordMsgHandler(valid, msg);
  }
  else if (isEmpty(password) && !isEmpty(passwordConfirmation))
  {
    valid = false;
    msg = 'password cannot be blank';
    passwordMsgHandler(valid, msg);
  }
  // else if (!isEmpty(password) && isEmpty(passwordConfirmation))
  // {
  //   valid = false;
  //   msg = 'password confirmation cannot be blank';
  //   passwordConfirmationMsgHandler(valid, msg);
  // }
  else if (!isEmpty(password) && !isEmpty(passwordConfirmation) && password != passwordConfirmation)
  {
    valid = false;
    msg = 'password and password confirmation should be same';
    passwordConfirmationMsgHandler(valid, msg);
  }

  return valid;
}

function passwordChangeHandler() 
{
  clearPasswordMsg();
}

function clearPasswordMsg() 
{
  $('#user_password').removeClass('error');
  $('#user_password_confirmation').removeClass('error');
  $('#user_password_message').addClass("hide");
  $('#user_password_confirmation_message').addClass("hide");

}

function passwordMsgHandler(valid, msg) {
  $('#user_password').addClass('error');
  $('#user_password_message').removeClass("hide");
  $('#user_password_message').text(msg);
}

function passwordConfirmationMsgHandler(valid, msg) {
  $('#user_password_confirmation').addClass('error');
  $('#user_password_confirmation_message').removeClass("hide");
  $('#user_password_confirmation_message').text(msg);
}

function usernameFocusoutHandler()
{
  var username = $('#user_username')[0].value;

  // validate if and only if the content has been changed
  if((typeof usernameFocusoutHandler.latestUsername == 'undefined') ||
     (usernameFocusoutHandler.latestUsername != username))
  {
    // Remember the new latest name
    usernameFocusoutHandler.latestUsername = username;

    if (validateUsernameOnClient(username))
    {
      // Show the loading icon and progress text
      $('#yes-icon').addClass("hide");
      $('#no-icon').addClass("hide");
      $('#loading-icon').removeClass("hide");
      $('#user_username_message').removeClass("hide valid").addClass("checking").text(I18n.t("checking_username"));

      $.ajax({
        url: "isUsernameValid",
        data: 'username=' + username,
        statusCode: {
          // Valid
          200: function(data) {
            // Ensure that the value in the textbox is the same as the one we sent to validate
            if( $('#user_username')[0].value == username)
            {
              $('#yes-icon').removeClass("hide");
              $('#user_username_message').addClass("valid").text(I18n.t("username_valid"));
            }
          },
          // Invalid
          203: function(data) {
            if( $('#user_username')[0].value == username)
            {
              $('#no-icon').removeClass("hide");
              $('#user_username_message').text(I18n.t(data.error_message));
            }
          },
          // Blank
          204: function(data) {
            // Ensure that the value in the textbox is still blank
            if( $('#user_username')[0].value == "")
            {
              $('#user_username_message').text(I18n.t("errors.messages.blank"));
            }
          }
        }
      }).always(validateUsernameCallback);
    }
  }
}

function validateUsernameCallback()
{
  $('#loading-icon').addClass("hide");
  $('#user_username_message').removeClass("checking");
}

function validateUsernameOnClient(username)
{
  if(username == "")
  {
    return false;
  }
  // ^ represents start of the string
  // $ represents end of the string
  if(!username.match(/^[a-zA-Z0-9_]{1,12}$/))
  {
     $('#user_username_message').text(I18n.t("invalid_username_character")).removeClass("hide valid");
    return false;
  }
  else
  {
    return true;
  }
}

function usernameChangeHandler()
{
  $('#yes-icon').addClass("hide");
  $('#no-icon').addClass("hide");
  $('#loading-icon').addClass("hide");
  $('#user_username_message').addClass("hide")
  validateUsernameOnClient($('#user_username')[0].value);
}

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