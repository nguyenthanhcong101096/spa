// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import "../stylesheets/application"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()
import * as Routes from '../routes';
window.Routes = Routes;

const $ = require('jquery')

window.onload=function(){
  $('div').on('click', function(){
    window.location.href = window.location.href;
  })
};