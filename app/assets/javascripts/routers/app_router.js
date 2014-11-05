YelpClone.Routers.AppRouter = Backbone.Router.extend({

  initialize: function(options) {
    this.$rootEl = options.$rootEl;
  },

  routes: {
    "" : "cityShow",
    "session/new" : "sessionNew",
    "business/new" : "businessNew",
    "reviews/:businessId/new" : "reviewsNew",
    "business/:id/edit" : "businessEdit",
    "reviews/:id/:businessId/edit" : "reviewsEdit",
    "business/:id": "businessShow",
    "users/:id": "userShow",
    "user/new": "userNew",

  },

  cityShow: function () {
    var city = YelpClone.currentCity;
    var cityShowView = new YelpClone.Views.CityShow({model: city});
    this._swapView(cityShowView);
  },

  businessNew: function () {

  },

  businessEdit: function (id) {

  },

  businessShow: function (id) {
    var business = YelpClone.Collections.businesses.getOrFetch(id);
    var businessShowView = new YelpClone.Views.BusinessShow({model: business});
    this._swapView(businessShowView);
  },

  reviewsNew: function (businessId) {
    if(!YelpClone.loggedIn()) {
      YelpClone.navigateInfo = {url: "reviews/" + businessId + "/new"};
      return Backbone.history.navigate("session/new", {trigger: true});
    }
    this._resetNavigateInfo();
    var review = new YelpClone.Models.Review();
    var reviewNewView = new YelpClone.Views.ReviewForm({
      model: review, businessId: businessId
    });
    this._swapView(reviewNewView);

  },

  reviewsEdit: function (id, businessId) {
    var reviews = new YelpClone.Collections.Reviews();
    var router = this;
    reviews.fetch({success: function(reviews){
      var review = review.getOrFetch(id);
      var reviewEditView = new YelpClone.Views.ReviewForm({
        model: review, businessId: businessId
      });
      router._swapView(reviewEditView);
    }});
  },

  sessionNew: function () {
    var sessionNewView = new YelpClone.Views.SessionNew();
    this._swapView(sessionNewView);
  },

  userShow: function () {
    var user = YelpClone.currentUser
    var userShowView = new YelpClone.Views.UserShow({model: user});
    this._swapView(userShowView);
  },

  _resetNavigateInfo: function () {
     if(YelpClone.navigateInfo){
       YelpClone.navigateInfo = null;
     }
  },

  _swapView: function(view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(this._currentView.render().$el);
  }


});
