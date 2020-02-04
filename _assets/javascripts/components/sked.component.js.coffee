angular.module('liferefined').component('lifeRefinedSked', {
  transclude: true
  template: '''
    <div class="text-center">
      <a class="btn btn-primary btn-xl" ng-class="{ active: $ctrl.scheduling }" ng-click="$ctrl.scheduling = !$ctrl.scheduling">Schedule</a>
      <ng-transclude></ng-transclude>
    </div>
    <iframe
      class="schedule"
      data-ng-if="$ctrl.scheduling"
      src="https://msgsndr.com/widget/booking?calendar=Em6sdxAADWjxeuyU4NVK"></iframe>
    <script src="https://msgsndr.com/js/embed.js" type="text/javascript"></script>
  '''
})
