window.YelpClone = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    YelpClone.Collections.businesses = new YelpClone.Collections.Businesses();
    YelpClone.Collections.businesses.fetch();
    var id = $('#currentuser').data('id');
    console.log(id);
    YelpClone.loggedIn = (id === "none") ? false : true;
    YelpClone.currentUser = (id === "none") ? new YelpClone.Models.User() : new YelpClone.Models.User({id: id});
    YelpClone.currentUser.fetch();
    new YelpClone.Routers.AppRouter({$rootEl: $('main')});
    Backbone.history.start();
  }
};

$(document).ready(function(){
  YelpClone.initialize();
});


