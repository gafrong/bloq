app
  .controller('HeaderCtrl', 
    function($scope){
     $scope.outputDesign = 'bloq';
  })

  .controller('BloqCtrl', function($http, $scope){
    $scope.title = "This is Bloq";
    $scope.designs = [];
    var getDesigns = function () {
      $http.get('http://localhost:3000/api/v1/designs')
        .success(function(data){
          console.log(data);
          $scope.designs = data;
          window.designs = $scope.designs;
        })
        .error(function(data){
          console.log('error', data);
          return data;
        });
    };
    getDesigns();
  })