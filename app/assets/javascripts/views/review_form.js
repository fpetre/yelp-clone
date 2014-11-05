YelpClone.Views.ReviewForm = Backbone.View.extend({
  template: JST["reviews/form"],
  errorTemplate: JST["helpers/errors"],

  initialize: function(options) {
    this.business = new YelpClone.Models.Business({id: options.businessId});
    this.business.fetch();
  },

  events:{"submit form": "submit"},

  submit: function(event){
    var view = this;
    event.preventDefault();
    var params = $(event.currentTarget).serializeJSON();
    var review = new YelpClone.Models.Review(params);
    review.save({}, {

      error: function(model,response){
        YelpClone.Utils.renderErrors.bind(view)(response);
      },
      success: function(review){
        view.business.reviews.add(review);
        YelpClone.Collections.businesses.add(view.business);
        Backbone.history.navigate("users/"+ YelpClone.currentUser.id, {trigger: true})
      }});
  },


  // renderErrors: function(response){
  //   this.$el.html(this.errorTemplate({message: response.responseText}));
  //   this.$el.append(this.template({review: this.model, business: this.business}));
  //   return this;
  // },

  render: function() {
    this.$el.html(this.template({review: this.model, business: this.business}));
    var show = this;
    return this;
  }
});
