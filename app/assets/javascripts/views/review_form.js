YelpClone.Views.ReviewForm = Backbone.View.extend({
  template: JST["reviews/form"],

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

      failure: function(){
        console.log("failed");
      },


      success: function(){

        Backbone.history.navigate("users/"+ YelpClone.currentUser.id, {trigger: true})
      }});
  },

  render: function() {
    this.$el.html(this.template({review: this.model, business: this.business}));
    var show = this;
    return this;
  }
});