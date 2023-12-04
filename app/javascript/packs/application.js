import Rails from "@rails/ujs"
// import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

window.jQuery = window.$ = require('jquery')
import 'bootstrap';
import '../stylesheets/application.scss';

Rails.start()
// Turbolinks.start()
ActiveStorage.start()
