var app = angular.module('oldmenTest', []);
angular.module('oldmenTest.controllers', []);

angular.module('oldmenTest').controller('HomeCtrl', function ($scope,$http) {
     $http.get('../data/contacts.json')
       .then(function(res){
          $scope.data = res.data;
          $scope.select={
      		 region: 'Europe',
       		country:'Germany'
   			}
        });
  $('#country').change(function() {
	$('#myModal').modal("show");
	});
  $('#map').css({
        'top' : '50%',
        'margin-top' : -$('#map').outerHeight()/2
    });
});



 