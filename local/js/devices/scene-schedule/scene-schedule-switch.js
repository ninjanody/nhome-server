(function() {
  "use strict";

  angular
    .module('services')
    .directive('ssSwitch', ['dataService', '$state', 'socket', function(dataService, $state, socket) {
      return {
        restrict: 'E',
        replace: true,
        templateUrl: 'directive/devices/scene-schedule-dev/sce-sch-switch.html',
        scope: {
          sinfo: '='
        },
        link: function(scope, elem, attr) {

          /* where am I */
          scope.currentState = $state.current.name;

          /* toggle active icon */
          function setIcon() {
            if (scope.sinfo.value === true) {
              scope.switchIcon = 'img/device/switch-on.png';
            } else {
              scope.switchIcon = 'img/device/switch-off.png';
            }
          };

          scope.$watch('sinfo.value', function() {
            setIcon();
          });
        }
      };
    }]);
}());
