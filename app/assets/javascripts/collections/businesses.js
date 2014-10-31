YelpClone.Collections.Businesses = Backbone.Collection.extend ({
  url: "/api/businesses",

  model: YelpClone.Models.Business,

  getOrFetch: function(id) {
    var business = YelpClone.Collections.businesses.get(id);
    if (business) {
      business.fetch()
    } else {
      business = new YelpClone.Models.Business({id: id});
      business.fetch({ success: function()
        {
        YelpClone.Collections.businesses.add(business);
        }
      });
    }

    return business;
  }


});

YelpClone.Collections.businesses = new YelpClone.Collections.Businesses();