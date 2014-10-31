window.YelpClone = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() {
    YelpClone.Collections.businesses.fetch();
    new YelpClone.Routers.AppRouter({$rootEl: $('main')});
    Backbone.history.start();
  }
};

$(document).ready(function(){
  // YelpClone.initialize();
});


