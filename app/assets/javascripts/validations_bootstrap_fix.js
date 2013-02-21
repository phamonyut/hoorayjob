(function() {
  $(document).ready(function() {
    return $("div.control-group").focusout(function() {
      if (!$("div.control-group").hasClass("error")) {
        return $(this).addClass("success");
      }
    });
  });
}).call(this);

ClientSideValidations.formBuilders['SimpleForm::FormBuilder'] = {
  add: function(element, settings, message) {
    var errorElement, wrapper;

    settings.wrapper_tag = ".control-group";
    settings.error_tag = "div";
    settings.error_class = "help-block";
    settings.wrapper_error_class = "error";
    settings.wrapper_success = "success";

    if (element.data('valid') !== false) {
      wrapper = element.closest(settings.wrapper_tag);
      wrapper.removeClass(settings.wrapper_success);
      wrapper.addClass(settings.wrapper_error_class);
      errorElement = $("<" + settings.error_tag + "/>", {
        "class": settings.error_class,
        text: message
      });
      return wrapper.find(".controls").append(errorElement);
    } else {
      wrapper = element.closest(settings.wrapper_tag);
      wrapper.addClass(settings.wrapper_error_class);
      return element.parent().find("" + settings.error_tag + "." + settings.error_class).text(message);
    }
  },
  remove: function(element, settings) {
    var errorElement, wrapper;

    settings.wrapper_tag = ".control-group";
    settings.error_tag = "div";
    settings.error_class = "help-block";
    settings.wrapper_error_class = "error";
    settings.wrapper_success = "success";

    wrapper = element.closest("" + settings.wrapper_tag + "." + settings.wrapper_error_class);
    wrapper.removeClass(settings.wrapper_error_class);
    wrapper.addClass(settings.wrapper_success);
    errorElement = wrapper.find("" + settings.error_tag + "." + settings.error_class);
    return errorElement.remove();
  }
};

$(function ()
{
  $('#user_username').focusout(usernameFocusoutHandler)
                     .bind('input', usernameChangeHandler);
});

function usernameFocusoutHandler()
{
  var username = $('#user_username')[0].value;

  // validate if and only if the content has been changed
  if((typeof usernameFocusoutHandler.latestUsername == 'undefined') ||
     (usernameFocusoutHandler.latestUsername != username))
  {
    // Remember the new latest name
    usernameFocusoutHandler.latestUsername = username;

    // Show the loading icon and progress text
    $('#yes-icon').addClass("hide");
    $('#no-icon').addClass("hide");
    $('#loading-icon').removeClass("hide");
    $('#user_username_message').removeClass("hide valid").text(I18n.t("checking_username"));

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

function validateUsernameCallback()
{
  $('#loading-icon').addClass("hide");
}

function usernameChangeHandler()
{
  $('#yes-icon').addClass("hide");
  $('#no-icon').addClass("hide");
  $('#loading-icon').addClass("hide");
  $('#user_username_message').addClass("hide")
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