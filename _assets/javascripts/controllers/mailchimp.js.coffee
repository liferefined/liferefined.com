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
      ignore: 'campaigns/ten-simple-steps'
      cookie: 'MCTenSteps'
      name: 'ten_steps'
      url: 'https://mc.us17.list-manage.com'
  }

  Current = Campaigns.ten_steps

  constructor: (_$http, _$cookies, _$timeout, $location) ->
    $http = _$http
    $cookies = _$cookies
    $timeout = _$timeout

    shouldAsk = ->
      $location.absUrl().indexOf(Current.ignore) is -1 and $cookies.get(Current.cookie) isnt 'yes'

    $timeout (=> @askToSubscribe = !!@campaign), 5000 if shouldAsk()
    @user = {}

  close: =>
    $cookies.put(Current.cookie, 'yes')
    @askToSubscribe = false
    @user = {}

  enroll: ({id, url}) ->
    params = {
      id: id, u: MailChimp.Id,
      EMAIL: @user.email, FNAME: @user.firstName, LNAME: @user.lastName, REASON: @user.reason
    }

    $http.jsonp("#{url}/subscribe/post-json", jsonpCallbackParam: 'c', params: params)
      .finally @close

  inlineSubscribe: -> @enroll id: Campaigns.default.id, url: Campaigns.default.url
  enrollIn: (list) -> @enroll Campaigns[list]
  subscribe: -> @enroll Current

angular.module('liferefined').controller('MailChimp', ['$http', '$cookies', '$timeout', '$location', MailChimp])
