YelpClone.Models.City = Backbone.Model.extend({
  urlRoot: "/api/cities",

  businesses: function () {
    if (!this._businesses) {
      this._businesses = new YelpClone.Collections.Cities();
    }
    return this._businesses;
  },

  parse: function(params) {
    if (params.businesses) {
      this.businesses().set(params.businesses, {parse: true});
      delete params.businesses;
    }
    return params;
  }

});