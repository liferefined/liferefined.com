class @MailChimp
  {$http, $cookies} = {}
  Object.defineProperties @,
    BaseUrl: get: -> 'https://liferefined.us17.list-manage.com'
    Url: get: -> "#{MailChimp.BaseUrl}/subscribe/post-json"

  constructor: (_$http, _$cookies) ->
    $http = _$http
    $cookies = _$cookies
    @user = {}

  close: -> $cookies.put('MCPopupClosed', 'yes')

  subscribe: ->
    params = {
      u: '0a1361f21f1f3455468ee787e'
      id: '9058c75a0e'
      EMAIL: @user.email
      FNAME: @user.name
    }

    $http.jsonp(MailChimp.Url, jsonpCallbackParam: 'c', params: params).finally @close

angular.module('liferefined').controller('MailChimp', ['$http', '$cookies', MailChimp])
