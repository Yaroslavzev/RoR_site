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
//

// require jquery
// require jquery_ujs

import Turbolinks from 'turbolinks'
Turbolinks.start();

import  "init" ;
import "stylesheets/application.scss";

window.onload  =  function ()  {
  let elem  = document.getElementById( 'hello' );
  console.log(elem.innerText );
  document.body.insertAdjacentHTML ( "afterbegin" , elem.innerText );
}
