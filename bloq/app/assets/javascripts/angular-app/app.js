var app = angular.module('app', ['ui.router', 'ngResource']);

app.config(function($stateProvider, $urlRouterProvider) {

    $urlRouterProvider.otherwise("/");

    $stateProvider
      .state('/', {
        url : '/'
      })
      .state('design', {
        url        : '/design',
        templateUrl: "/assets/templates/designIndex.html",
        controller : 'DesignCtrl'
      })
      .state('tech', {
        url        : '/tech',
        templateUrl: "/assets/templates/techIndex.html",
        controller : 'TechCtrl'
      }) 
      .state('food', {
        url        : '/food',
        templateUrl: "/assets/templates/foodIndex.html",
        controller : 'FoodCtrl'
      }) 
      .state('travel', {
        url        : '/travel',
        templateUrl: "/assets/templates/travelIndex.html",
        controller : 'TravelCtrl'
      })

  });
