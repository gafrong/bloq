app
  .controller('FoodCtrl', ['$http', '$scope', function($http, $scope){
    $scope.title = "Food";
    $scope.foods = [];
    var getFoods = function () {
      $http.get('/api/v3/foods')
        .success(function(data){
          console.log(data);
          $scope.foods = data;
        })
        .error(function(data){
          console.log('error', data);
          return data;
        });
    };
    getFoods();
  }])