app
  .controller('DesignCtrl', ['$http', '$scope', function($http, $scope){
    $scope.title = "Design";
    $scope.designs = [];
    var getDesigns = function () {
      $http.get('/api/v1/designs')
        .success(function(data){
          console.log(data);
          $scope.designs = _.shuffle(data);
          //window.designs = _.shuffle($scope.designs);
        })
        .error(function(data){
          console.log('error', data);
          return data;
        });
    };
    console.log('checking DesignCtrl...')
    getDesigns();
  }])


 