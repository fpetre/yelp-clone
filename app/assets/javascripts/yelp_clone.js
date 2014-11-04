window.YelpClone = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  _CreateModels: function () {
    YelpClone.Collections.businesses = new YelpClone.Collections.Businesses();
    YelpClone.Collections.businesses.fetch();
    var cityId = $('#current-city-and-user').data('city-id');
    var userId = $('#current-city-and-user').data('user-id');
    YelpClone.currentCity = new YelpClone.Models.City({id: cityId});
    YelpClone.currentCity.fetch();
    YelpClone.loggedIn = (userId === "none") ? false : true;
    YelpClone.currentUser = (userId === "none") ? new YelpClone.Models.User() : new YelpClone.Models.User({id: userId});
    YelpClone.currentUser.fetch();
  },
  initialize: function () {
    this._CreateModels();
    new YelpClone.Routers.AppRouter({$rootEl: $('main')});
    Backbone.history.start();
  }
};
//
// $(document).ready(function(){
//   YelpClone.initialize();
// });
