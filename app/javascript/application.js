//= require jquery

//= require jquery3
//= require popper
//= require bootstrap
//= require cocoon
import "@hotwired/turbo-rails"
import "controllers"
import "bootstrap"





import Rails from "@rails/ujs";
Rails.start();

$('form').on('click', '.remove-appointments', function(event){
    console.log('remove'); 
   $(this).prev('input[type=hidden]').val('1');
   $(this).closest('fieldset').hide();
   return event.preventDefault();

});

$('form').on('click', '.add_appointments', function(event){
    console.log('clicked');     
    var regexp, time;
     time = new Date().getTime();
     regexp= new RegExp($(this).data('id'), 'g');
     $(this).before($(this).data('appointments').replace(regexp, time));
     return event.preventDefault();
 });
