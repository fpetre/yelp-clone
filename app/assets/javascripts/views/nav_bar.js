YelpClone.Views.navBar = Backbone.View.extend({
  template: JST["static_pages/nav"],
  tagName: "nav",
  className: "header-nav group",

  initialize: function() {
    this.listenTo(YelpClone.Collections.users, "change sync", this.render);
    this.listenTo(YelpClone.currentUser, "change sync", this.render);
    this.listenTo(YelpClone.currentCity, "change", this.render);
    this.query = {name_query: "", location_query: ""};
  },

  events: {
    "submit form#nav-business-search" : "businessSearch",
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

    if (event) {
      event.preventDefault();
      Backbone.history.navigate("#navsearch");
      this.page = 1;
      this.query = $("form#nav-business-search").serializeJSON();
      this.query["page"] = this.page;
      Backbone.history.navigate('#navBarSearch/' + JSON.stringify(this.query),
      {trigger: true});
    }
  },

  render: function(){
    this.$el.html(this.template());
    return this;
  }
});
