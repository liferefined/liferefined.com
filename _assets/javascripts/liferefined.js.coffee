angular.module('liferefined', ['ngCookies'])
  .config(['$sceDelegateProvider', ($sceDelegateProvider) ->
    $sceDelegateProvider.resourceUrlWhitelist ['self', "#{MailChimp.BaseUrl}/**"]
  ])
