app
  .controller('TechCtrl', ['$http', '$scope', function($http, $scope){
    $scope.title = "tech";
    $scope.designs = [];
    var getTechs = function () {
      $http.get('/api/v1/techs')
        .success(function(data){
          console.log(data);
          $scope.techs = _.shuffle(data);
          // window.designs = $scope.designs;
        })
        .error(function(data){
          console.log('error', data);
          return data;
        });
    };
    getTechs();
  }])

 