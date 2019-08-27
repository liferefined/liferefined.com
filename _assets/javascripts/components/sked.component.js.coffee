angular.module('liferefined').component('lifeRefinedSked', {
  transclude: true
  template: '''
    <div class="text-center">
      <a class="btn btn-primary btn-xl" ng-click="$ctrl.scheduling = !$ctrl.scheduling">Schedule</a>
      <ng-transclude></ng-transclude>
    </div>
    <iframe
      class="schedule"
      data-ng-if="$ctrl.scheduling"
      src="https://app2.sked.life/webmodule/?key=1bee8bb94d7fe3f751578179795e7995196362687a3de8414561c8354e45b5c2"></iframe>
  '''
})
