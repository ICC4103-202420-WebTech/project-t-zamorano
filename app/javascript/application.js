// Entry point for the build script in your package.json
import Rails from '@rails/ujs';
Rails.start(); // Asegúrate de que UJS se inicialice primero

import "@hotwired/turbo-rails"
import "./controllers"
import * as bootstrap from "bootstrap"
import 'jquery';
