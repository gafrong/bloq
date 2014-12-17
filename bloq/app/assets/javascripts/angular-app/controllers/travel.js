app
  .controller('TravelCtrl', ['$http', '$scope', function($http, $scope){
    $scope.title = "travel";
    $scope.travels = [];
    var getTravels = function () {
      $http.get('/api/v1/travels')
        .success(function(data){
          $scope.travels = _.shuffle(data);
        })
        .error(function(data){
          console.log('error', data);
          return data;
        });
    };
    getTravels();
  }])