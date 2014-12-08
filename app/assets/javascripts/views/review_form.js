YelpClone.Views.ReviewForm = Backbone.View.extend({
  template: JST["reviews/form"],
  errorTemplate: JST["helpers/errors"],

  initialize: function(options) {
    this.business = new YelpClone.Models.Business({id: options.businessId});
    this.business.fetch();
    this.listenTo(this.business, "add change sync", this.render);
  },

  events: {
    "submit form": "submit",
    "click label[for=rating-1]": "reviewStarRating",
    "click label[for=rating-2]": "reviewStarRating",
    "click label[for=rating-3]": "reviewStarRating",
    "click label[for=rating-4]": "reviewStarRating",
    "click label[for=rating-5]": "reviewStarRating"
  },

  reviewStarRating: function(event){

    if ($(event.currentTarget).attr("for") === "rating-1") {
      $(event.currentTarget).removeClass().addClass("star-rating-1");
      var nonTargetLabels = $("[for=rating-2], [for=rating-3], [for=rating-4], [for=rating-5]");
      nonTargetLabels.removeClass().addClass("star-rating-0");
    } else if ($(event.currentTarget).attr("for") === "rating-2") {
      var targetLabels = $("[for=rating-1], [for=rating-2]");
      var nonTargetLabels = $("[for=rating-3], [for=rating-4], [for=rating-5]");
      targetLabels.removeClass().addClass("star-rating-2");
      nonTargetLabels.removeClass().addClass("star-rating-0");
    } else if ($(event.currentTarget).attr("for") === "rating-3") {
      var targetLabels = $("[for=rating-1], [for=rating-2], [for=rating-3]");
      var nonTargetLabels = $("[for=rating-4], [for=rating-5]");
      targetLabels.removeClass().addClass("star-rating-3");
      nonTargetLabels.removeClass().addClass("star-rating-0");
    } else if ($(event.currentTarget).attr("for") === "rating-4") {
      var targetLabels = $("[for=rating-1], [for=rating-2], [for=rating-3], [for=rating-4]");
      var nonTargetLabels = $("[for=rating-5]");
      targetLabels.removeClass().addClass("star-rating-4");
      nonTargetLabels.removeClass().addClass("star-rating-0");
    } else if ($(event.currentTarget).attr("for") === "rating-5") {
      var targetLabels = $("[for=rating-1], [for=rating-2], [for=rating-3], [for=rating-4], [for=rating-5]");
      targetLabels.removeClass().addClass("star-rating-5");

    }
  },

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
        YelpClone.Collections.businesses.add(view.business, {merge: true});
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
