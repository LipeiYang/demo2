// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(document).ready(
  function()
  {
    $('tr[jurl]').hover(
      function()
      {
        $(this).addClass("selected");
      }
      ,
      function()
      {
        $(this).removeClass("selected");
      }
    ).click(
      function()
      {
          var url = $(this).attr("jurl");
          if(url)
          {
            window.location = url;
          }
      }
    );
  }
);
