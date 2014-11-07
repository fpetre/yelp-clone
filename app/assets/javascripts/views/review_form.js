YelpClone.Views.ReviewForm = Backbone.View.extend({
  template: JST["reviews/form"],
  errorTemplate: JST["helpers/errors"],

  initialize: function(options) {
    this.business = new YelpClone.Models.Business({id: options.businessId});
    this.business.fetch();
    this.listenTo(this.business, "add change sync", this.render);
  },

  events: {"submit form": "submit"},

  submit: function(event){
    var view = this;
    event.preventDefault();
    var params = $(event.currentTarget).serializeJSON();
    this.model.save(params,{
      error: function(model,response){
        YelpClone.Utils.renderErrors.bind(view)({review: view.model, business: view.business}, response);
      },
      success: function(review){
        view.business.reviews().add(review, {merge: true});
        YelpClone.Collections.businesses.add(view.business);
        YelpClone.currentUser.reviews().add(review, {merge: true});
        Backbone.history.navigate("users/"+ YelpClone.currentUser.id, {trigger: true});
      }});
  },

  render: function() {
    this.$el.html(this.template({review: this.model, business: this.business}));
    var show = this;
    return this;
  }
});
