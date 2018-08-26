"use strict";

angular.module("adminApp")
  .factory("stageService", ["common", stageService]);

function stageService(common) {
  var service = {
    loadData: loadData,
    createData: createData
  }

  return service;

  function loadData() {
    return common.ajaxCall("GET", "stages/load_data");
  }

  function createData(params){
    return common.ajaxCall("POST", "stages/create", params);
  }
}
