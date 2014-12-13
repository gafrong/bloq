app
  .controller('DesignCtrl', function($http, $scope){
    $scope.info = [];
    var getInfo = function () {
      $http.get('http://localhost:3000/api/v1/designs')
      .success(function(data){
        console.log(data);
      })
      .error(function(data){
        console.log('error', data);
        return data;
      });
    };
    getInfo();
  })




  $.ajax({
    type: "GET",
    url: "/api/v1/designs",
    dataType: "json",
    success: function(data){
        console.log('success',data) // Will alert Max
    }        
});