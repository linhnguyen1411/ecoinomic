'use strict';

angular.module('adminApp').controller('StagesController', StagesController);
StagesController.$inject = ['$location', '$scope', 'stageService'];

function StagesController($location, $scope, stageService) {
  var vm = this;
  vm.$scope = $scope;

  vm.init = function() {
    stageService.loadData().then(function mySuccess(response){
      angular.extend(vm, response.data);
      setTimePicker();
    });
  }

  function setTimePicker() {
    setTimeout(function(){$('.input-datepicker').datetimepicker({
    });}, 500);
  }

  vm.createData = function() {
    stageService.createData({stage: vm.stage}).then(function mySuccess(response){
      $(".form-group-validate").removeClass("has-error");
      $(".form-group-validate").find(".help-block").remove();
      if (response.data.status) {
        toastr["success"]("Success");
      } else {
        var errors = response.data.errors;
        _.forEach(errors, function(values, key) {
          var $inputElement = $("[name$='[" + key + "]']");
          if (_.isEmpty(values)) return;
          var $parentInput = $inputElement.parents(".form-group-validate");
          $parentInput.addClass("has-error");
          var error = "<span class='help-block'>" + values[0] + "</span>";
          $inputElement.parent().append(error);
        })
      }
    });
  }
}
