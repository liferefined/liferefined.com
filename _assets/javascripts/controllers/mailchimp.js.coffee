class @MailChimp
  {$http, $cookies, $timeout, reset} = {}
  Object.defineProperties @,
    Id: get: -> '0a1361f21f1f3455468ee787e'
    BaseUrl: get: -> Current.url
    MailingLists: get: -> url for k, {url} of Campaigns
    Url: get: -> "#{MailChimp.BaseUrl}/subscribe/post-json"

  Campaigns = {
    default:
      id: '9058c75a0e'
      cookie: 'MCPopupClosed'
      name: 'default'
      url: 'https://liferefined.us17.list-manage.com'
    ten_steps:
      id: 'de720c6006'
      cookie: 'MCTenSteps'
      name: 'ten_steps'
      url: 'https://mc.us17.list-manage.com'
  }

  Current = Campaigns.ten_steps

  constructor: (_$http, _$cookies, _$timeout) ->
    $http = _$http
    $cookies = _$cookies
    $timeout = _$timeout

    $timeout (=> @askToSubscribe = true), 5000 unless $cookies.get(Current.cookie) is 'yes'
    @user = {}

  close: =>
    $cookies.put(Current.cookie, 'yes')
    @askToSubscribe = false
    @user = {}

  inlineSubscribe: ->
    params = id: Campaigns.default.id, u: MailChimp.Id, EMAIL: @user.email
    $http.jsonp("#{Campaigns.default.url}/subscribe/post-json", jsonpCallbackParam: 'c', params: params)
      .finally @close

  subscribe: ->
    params = {
      id: Current.id, u: MailChimp.Id,
      EMAIL: @user.email
      FNAME: @user.firstName
      LNAME: @user.lastName
      REASON: @user.reason
    }

    $http.jsonp(MailChimp.Url, jsonpCallbackParam: 'c', params: params).finally @close

angular.module('liferefined').controller('MailChimp', ['$http', '$cookies', '$timeout', MailChimp])
