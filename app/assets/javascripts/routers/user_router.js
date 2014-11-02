YelpClone.Routers.UserRouter = Backbone.Router.extend({

  initialize: function(options) {
    this.$rootEl = options.$rootEl;
  },

  routes: {
    "users/:id": "userShow"
  },


  userShow: function (id) {
    var business = YelpClone.Collections.businesses.getOrFetch(id);
    var businessView = new YelpClone.Views.BusinessShow({model: business});
    this._swapView(businessView);
  },

  _swapView: function(view) {
    this.currentView && this.currentView.remove();
    this.currentView = view;
    this.$rootEl.html(this.currentView.render().$el);
  }


});