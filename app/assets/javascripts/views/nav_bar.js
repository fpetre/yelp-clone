YelpClone.Views.navBar = Backbone.View.extend({
  template: JST["static_pages/nav"],
  tagName: "nav",
  className: "header-nav group",

  initialize: function() {
    this.listenTo(YelpClone.currentUser, "change", this.render);
  },

  events: {
    "submit form#business-search" : "businessSearch",
    "click button#log-out" : "logOut"
  },

  logOut: function(event) {
    event.preventDefault();
    $.ajax({
      type: "DELETE",
      url: "/api/session",
      success: function(request){
        YelpClone.currentUser.clear();
        Backbone.history.navigate("", {trigger: true});
      }.bind(this)
    });
  },

  businessSearch: function(event) {
    event.preventDefault();

  },

  render: function(){
    this.$el.html(this.template());
    return this;
  }
});
