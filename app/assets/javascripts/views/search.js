YelpClone.Views.Search = Backbone.View.extend({
  template: JST['static_pages/search'],

  events: {
    "submit form" : "search",
    "click button#next" : "next",
    "click button#prev" : "prev"
  },

  initialize: function() {
    this.results = [];
    this.query = {name_query: "", location_query: ""};
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

  search: function (event) {
    var view = this;

    if (event) {
      event.preventDefault();
      this.page = 1;
      this.query = $("form.yelp-reviews-search-form").serializeJSON();
      this.query["page"] = this.page;
    }

    this.query["page"] = this.page;
    $.ajax({
      type: "GET",
      url: "/api/search",
      dataType: "json",
      data: this.query,
      success: function(response){
         view.results = response;
         view.render();

      }
    });
  },

  _totalPages: function () {
    return (Math.floor(this.results.length / 10) + 1);
  },

  render: function () {
    this.$el.html(this.template({results: this.results, totalPages: this._totalPages(), navBar: false}));
    return this;
  }
});
