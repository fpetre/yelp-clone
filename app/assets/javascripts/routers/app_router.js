YelpClone.Routers.AppRouter = Backbone.Router.extend({

  initialize: function(options) {
    this.$rootEl = options.$rootEl;
  },

  routes: {
    "business/:id": "businessShow",
    "users/:id": "userShow"
  },


  businessShow: function (id) {
    var business = YelpClone.Collections.businesses.getOrFetch(id);
    var businessView = new YelpClone.Views.BusinessShow({model: business});
    this._swapView(businessView);
  },


  userShow: function (id) {
    var user = YelpClone.Users.currentUser
    var userView = new YelpClone.Views.UserShow({model: user});
    this._swapView(userView);
  },

  _swapView: function(view) {
    this.currentView && this.currentView.remove();
    this.currentView = view;
    this.$rootEl.html(this.currentView.render().$el);
  }


});