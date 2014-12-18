app
  .controller('FourboxCtrl', ['$scope', function($scope){
    $scope.myVar = true;
    $scope.toggle = function () {
      $scope.myVar = !$scope.myVar;
    };
  }])