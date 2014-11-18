YelpClone.Views.navSearch = Backbone.View.extend({
  template: JST['static_pages/search'],

  initialize: function(options) {
    this.results = [];
    this.query = options.query;
    this.page = options.query.page;
  },


  events: {
    "click button.next-button" : "next",
    "click button.prev-button" : "prev"
  },

  search: function() {
    var view = this;
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
         view.render();
      }
    });
    return this;
  },

  next: function() {
    if (this.page  < this._totalPages()) {
      this.page++;
    }
    console.log("next", this.page);
    this.search();
  },

  prev: function() {
    console.log("prev")
    if (this.page > 1 ) {
      this.page--;
    }
    this.search();
  },

  _totalPages: function () {
    return (Math.floor(this.results.length / 10) + 1);
  },

  render: function () {
    this.$el.html(this.template({results: this.results, totalPages: this._totalPages(), navBar: true, currentPage: this.page}));
    return this;
  }

});
