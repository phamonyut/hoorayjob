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

window.ClientSideValidations.callbacks.element.before = function(element, eventData)
{
  if(element.context.id == "user_username")
  {
    $('.yes-icon').addClass("hide");
    $('.no-icon').addClass("hide");
    $('.loading-icon').removeClass("hide");
  } 
}

window.ClientSideValidations.callbacks.element.after = function(element, eventData)
{
  if(element.context.id == "user_username")
  {
    $('.loading-icon').addClass("hide");
  }
}

window.ClientSideValidations.callbacks.element.fail = function(element, message, callback)
{
  if(element.context.id == "user_username" && element.context.value != "")
  {
    $('.yes-icon').addClass("hide");
    $('.no-icon').removeClass("hide");
  }
  callback();
}

window.ClientSideValidations.callbacks.element.pass = function(element, callback)
{
  if(element.context.id == "user_username")
  {
    $('.no-icon').addClass("hide");
    $('.yes-icon').removeClass("hide");
  } 
  callback();
}