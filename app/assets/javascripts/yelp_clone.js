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
    // var cityId = $('#current-city-and-user').data('city-id');
    // var userId = $('#current-city-and-user').data('user-id');
    YelpClone.currentCity = new YelpClone.Models.City({id: currentCityId});
    YelpClone.currentCity.fetch();
    // YelpClone.loggedIn = (userId === "none") ? false : true;
    // YelpClone.currentUser = (userId === "none") ? new YelpClone.Models.User() : new YelpClone.Models.User({id: userId});
    //make empty null, put in clause
    YelpClone.currentUser = new YelpClone.Models.User({id: currentUserId});
    YelpClone.currentUser.fetch();
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
