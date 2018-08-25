"use strict";

angular.module("adminApp")
  .factory("stageService", ["common", stageService]);

function stageService(common) {
  var service = {
    loadData: loadData
  }

  return service;

  function loadData() {
    return common.ajaxCall("GET", "stages/load_data");
  }
}
