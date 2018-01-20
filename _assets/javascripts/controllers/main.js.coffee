class Main
  constructor: ($document, $timeout) ->
    {alreadyAsked} = localStorage
    $timeout (=> @askToSubscribe = true), 5000 unless alreadyAsked

angular.module('liferefined').controller('Main', ['$document', '$timeout', Main])
