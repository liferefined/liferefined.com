class Main
  constructor: ($scope, $cookies, $timeout) ->
    alreadyAsked = -> $cookies.get('MCPopupClosed') is 'yes'
    $timeout (=> @askToSubscribe = true), 5000 unless alreadyAsked()
    $scope.$watch alreadyAsked, (didAsk, ___) => @askToSubscribe = false if didAsk

angular.module('liferefined').controller('Main', ['$scope', '$cookies', '$timeout', Main])
