'use strict';

angular.module('adminApp').controller('StagesController', StagesController);
StagesController.$inject = ['$http', '$location', 'stageService'];

function StagesController($http, $location, stageService) {
  var vm = this;

  vm.init = function() {
    stageService.loadData().then(function mySuccess(response){
      angular.extend(vm, response.data);
      console.log(vm)
    });
  }
}
