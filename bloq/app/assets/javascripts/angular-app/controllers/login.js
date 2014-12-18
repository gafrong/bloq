app
  .controller('LoginCtrl', ['$scope', function($scope){
    $scope.myLogin = true;
    $scope.toggle = function () {
      $scope.myLogin = false;
    };
  }])