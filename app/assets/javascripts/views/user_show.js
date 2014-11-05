YelpClone.Views.UserShow = Backbone.View.extend({
  template: JST["users/show"],
  reviewTemplate: JST["reviews/show"],

  initialize: function() {
    this.listenTo(this.model, "add, change, sync, remove", this.render);
    this.listenTo(this.model.reviews(), "add, change, sync, remove", this.render);
  },

  render: function() {
    this.$el.html(this.template({user: this.model}));
    var show = this;
    this.model.reviews().each( function(review){
      show.$el.find("#user-reviews").append(show.reviewTemplate({review: review}));
    });
    return this;
  }
});
