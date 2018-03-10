angular.module('liferefined', ['ngCookies'])
  .config(['$sceDelegateProvider', ($sceDelegateProvider) ->
    urls = ['self']
    urls.push "#{url}/**" for url in MailChimp.MailingLists
    $sceDelegateProvider.resourceUrlWhitelist urls
  ])
