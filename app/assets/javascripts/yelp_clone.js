window.YelpClone = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  Utils: {},

  _CreateModels: function (logedIn, currentUserId, currentCityId) {
    YelpClone.Collections.cities = new YelpClone.Collections.Cities();
    YelpClone.Collections.cities.fetch();
    YelpClone.Collections.reviews = new YelpClone.Collections.Reviews();
    YelpClone.Collections.reviews.fetch();
    YelpClone.Collections.businesses = new YelpClone.Collections.Businesses();
    YelpClone.Collections.businesses.fetch();
    YelpClone.currentCity = YelpClone.Collections.cities.getOrFetch(currentCityId);
    YelpClone.Collections.users = new YelpClone.Collections.Users();
    YelpClone.Collections.users.fetch();
    YelpClone.currentUser = YelpClone.Collections.users.getOrFetch(currentUserId);
    YelpClone.loggedIn = function() {
      return !!YelpClone.currentUser.id;
    };
  },

  initialize: function (logedIn, currentUserId, currentCityId, defaultProfilePhotoUrl, $rootEl, $navEl) {
    YelpClone.defaultProfilePhotoUrl = defaultProfilePhotoUrl;
    this._CreateModels(logedIn, currentUserId, currentCityId);
    var navBarView = new YelpClone.Views.navBar();
    $navEl.html(navBarView.render().$el);
    new YelpClone.Routers.AppRouter({$rootEl: $rootEl});
    Backbone.history.start();
  }
};
