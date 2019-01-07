/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb
// import Rails from 'rails-ujs';
import Rails from 'rails-ujs';
Rails.start();
import Turbolinks from 'turbolinks';
Turbolinks.start();




import  "init" ;
import "components/page/page";
import "stylesheets/application.scss";


document.addEventListener("DOMContentLoaded", function(event) {
var Notifications;


Notifications = class Notifications {
  constructor() {
    this.notifications = document.getElementById('notifications');

  }

   setup() {
     Rails.ajax({
       url: "/users.json",
       dataType: "JSON",
       type: "GET",
       success: function(data) {

         const items = data.map(function(notification) {

          const newlink = document.createElement('a');
          newlink.setAttribute('class', 'dropdown-item');
          newlink.setAttribute('href', notification.url);
          newlink.textContent = "New event for filtr #" + notification.search_id
          document.getElementById("dropdown-menu").appendChild(newlink) ;

        });

        document.getElementById("dropdown").innerHTML =items.length
       }
     });
   }

};

let notification = new Notifications;
notification.setup();
});
