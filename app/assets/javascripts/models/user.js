YelpClone.Models.User = Backbone.Model.extend({
  urlRoot: "/api/users",

  toJSON: function(){
    var attributes = _.clone(this.attributes);
    return {user: attributes};
  },

  reviews: function() {
    if(!this._reviews) {
      this._reviews = new YelpClone.Collections.ReviewsSubset([], {parentCollection: YelpClone.Collections.reviews})
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
