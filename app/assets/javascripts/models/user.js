YelpClone.Models.User = Backbone.Model.extend({
  urlRoot: "/api/users",

  reviews: function() {
    if(!this._reviews) {
      this._reviews = new YelpClone.Collections.Reviews()
    }
    return this._reviews
  },

  parse: function(params) {
    if (params.reviews) {
      this.reviews().set(params.reviews, {parse: true})
      delete params.reviews
    }
    return params
  }

});