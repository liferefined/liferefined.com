angular.module('liferefined', ['ngResource'])
  .config(['$sceDelegateProvider', ($sceDelegateProvider) ->
    $sceDelegateProvider.resourceUrlWhitelist ['self', "#{MailChimp.BaseUrl}/**"]
  ])
