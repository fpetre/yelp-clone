YelpClone.Collections.Cities = Backbone.Collection.extend ({
  url: "/api/cities",

  model: YelpClone.Models.City,

  getOrFetch: function(id) {
    var city = this.get(id);
    var cities = this;

    if (city) {
      city.fetch();
    } else {
      city = new YelpClone.Models.City({id: id});
      city.fetch({ success: function()
        {
        cities.add(city);
        }
      });
    }
    return city;
  }

});
