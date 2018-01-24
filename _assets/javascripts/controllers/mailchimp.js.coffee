class @MailChimp
  {$http, $cookies, $timeout, reset} = {}
  Object.defineProperties @,
    BaseUrl: get: -> 'https://liferefined.us17.list-manage.com'
    Url: get: -> "#{MailChimp.BaseUrl}/subscribe/post-json"

  constructor: (_$http, _$cookies, _$timeout) ->
    $http = _$http
    $cookies = _$cookies
    $timeout = _$timeout

    $timeout (=> @askToSubscribe = true), 5000 unless $cookies.get('MCPopupClosed') is 'yes'
    @user = {}

  close: =>
    $cookies.put('MCPopupClosed', 'yes')
    @askToSubscribe = false
    @user = {}

  subscribe: ->
    params = {
      u: '0a1361f21f1f3455468ee787e'
      id: '9058c75a0e'
      EMAIL: @user.email
      FNAME: @user.firstName
      LNAME: @user.lastName
      REASON: @user.reason
    }

    $http.jsonp(MailChimp.Url, jsonpCallbackParam: 'c', params: params).finally @close

angular.module('liferefined').controller('MailChimp', ['$http', '$cookies', '$timeout', MailChimp])
