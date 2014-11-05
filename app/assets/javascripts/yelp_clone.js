window.YelpClone = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},

  _CreateModels: function (logedIn, currentUserId, currentCityId) {
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

  initialize: function (logedIn, currentUserId, currentCityId, $rootEl, $navEl) {
    this._CreateModels(logedIn, currentUserId, currentCityId);
    var navBarView = new YelpClone.Views.navBar();
    $navEl.html(navBarView.render().$el);
    new YelpClone.Routers.AppRouter({$rootEl: $rootEl});
    Backbone.history.start();
  }
};
