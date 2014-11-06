YelpClone.Models.Business = Backbone.Model.extend({
  urlRoot: "/api/businesses",

  reviews: function() {
    if(!this._reviews) {
      this._reviews = new YelpClone.Collections.ReviewsSubset([], {parentCollection: YelpClone.Collections.reviews});
    }
    return this._reviews;
  },

  parse: function(params) {
    if (params.reviews) {
      this.reviews().set(params.reviews, {parse: true});
      delete params.reviews;
    }
    return params;
  }

});
