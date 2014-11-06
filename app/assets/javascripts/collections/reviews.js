YelpClone.Collections.Reviews = Backbone.Collection.extend({
  url: "/api/reviews",
  model: YelpClone.Models.Review,

  getOrFetch: function(id) {
    var review = this.get(id);
    if (review) {
      review.fetch();
    } else {
      review = new YelpClone.Models.Review({id: id});
      review.fetch({ success: function()
        {
        this.add(review);
        }
      });
    }
    return business;
  }


});
