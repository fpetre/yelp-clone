YelpClone.Views.navBar = Backbone.View.extend({
  template: JST["static_pages/nav"],
  searchTemplate: JST['static_pages/search'],
  tagName: "nav",
  className: "header-nav group",

  initialize: function() {
    this.listenTo(YelpClone.Collections.users, "change sync", this.render);
    this.listenTo(YelpClone.currentUser, "change", this.render);
    this.listenTo(YelpClone.currentCity, "change", this.render);
    this.results = [];
    this.query = {name_query: "", location_query: ""};
  },

  events: {
    "submit form#nav-business-search" : "businessSearch",
    "click button#log-out" : "logOut",
    "click button#next" : "next",
    "click button#prev" : "prev"
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
    var view = this;

    if (event) {
      event.preventDefault();
      Backbone.history.navigate("#navsearch");
      this.page = 1;
      this.query = $("form#nav-business-search").serializeJSON();
      this.query["page"] = this.page;
    }

    this.query["page"] = this.page;
    $.ajax({
      type: "GET",
      url: "/api/search",
      dataType: "json",
      data: this.query,
      success: function(response){

        if(response.length > 0) {
          var newId = response[0].city_id;
          YelpClone.currentCity = new YelpClone.Models.City({id: newId});
          YelpClone.currentCity.fetch();
        }
         view.results = response;
         view.renderSearch();

      }
    });


  },

  next: function() {
    if (this.page  < this.totalPages) {
      this.page++;
    }
    this.search();
  },

  prev: function() {
    if (this.page > 1 ) {
      this.page--;
    }
    this.search();
  },

  _totalPages: function () {
    return (Math.floor(this.results.length / 10) + 1);
  },

  renderSearch: function () {
    $("div#backbone_main_content").html(this.searchTemplate({results: this.results, totalPages: this._totalPages(), navBar: true}));
    return this;
  },

  render: function(){
    this.$el.html(this.template());
    return this;
  }
});
