YelpClone.Collections.Businesses = Backbone.Collection.extend ({
  url: "/api/businesses",

  model: YelpClone.Models.Business,

  getOrFetch: function(id) {
    var business = this.get(id);
    var businesses = this;

    if (business) {
      business.fetch();
    } else {
      business = new YelpClone.Models.Business({id: id});
      business.fetch({ success: function()
        {
        businesses.add(business);
        }
      });
    }
    console.log("fetching", business)
    return business;
  }


});
