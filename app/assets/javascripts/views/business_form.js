YelpClone.Views.BusinessForm = Backbone.View.extend({
  template: JST["businesses/form"],
  errorTemplate: JST["helpers/errors"],

  events: {"submit form": "submit"},

  submit: function(event){
    var view = this;
    event.preventDefault();
    var params = $(event.currentTarget).serializeJSON();
    this.model.save(params, {
      error: function(model, response){
        YelpClone.Utils.renderErrors.bind(view)({business: view.model}, response);
      },
      success: function(business){
        YelpClone.Collections.businesses.add(business);
        var newCity = new YelpClone.Models.City({id: business.get("city_id")});
        newCity.fetch({ success: function() {
          YelpClone.Collections.cities.add(newCity);
          }
        });

        if (business.city === YelpClone.currentCity.city_name) {
          YelpClone.currentCity.businesses().add(business);
        }
        Backbone.history.navigate("business/" + business.id, {trigger: true});
      }
    });
  },

  render: function () {
    this.$el.html(this.template({business: this.model}));
    return this;
  }

});
