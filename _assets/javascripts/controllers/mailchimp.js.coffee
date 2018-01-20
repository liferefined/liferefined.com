class @MailChimp
  {$http} = {}
  Object.defineProperties @,
    BaseUrl: get: -> 'https://liferefined.us17.list-manage.com'
    Url: get: -> "#{MailChimp.BaseUrl}/subscribe/post-json"

  constructor: (_$http) ->
    $http = _$http
    @user = {}

  subscribe: ->
    params = {
      u: '0a1361f21f1f3455468ee787e'
      id: '9058c75a0e'
      EMAIL: @user.email
      FNAME: @user.name
    }

    $http.jsonp(MailChimp.Url, jsonpCallbackParam: 'c', params: params).then(log, log)

angular.module('liferefined').controller('MailChimp', ['$http', MailChimp])
