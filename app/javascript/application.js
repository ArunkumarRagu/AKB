// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

import AKB from "behaviors/akb";
window.AKB = AKB;


import "datatables";

$(document).on("turbo:render", function () {
  onPageLoad();
});

$(document).ready(function () {
  onPageLoad();
});


function onPageLoad() {
  AKB.applyBehaviors($("body"));
}

