YelpClone.Views.UserForm = Backbone.View.extend({
  template: JST["users/form"],
  errorTemplate: JST["helpers/errors"],

  events:{"submit form": "submit"},

  submit: function(event){
    var view = this;
    event.preventDefault();
    var params = $(event.currentTarget).serializeJSON();
    var user = this.model;
    user.save(params, {
      error: function(model,response){
        YelpClone.Utils.renderErrors.bind(view)({user: model}, response);
      },
      success: function(user){
        YelpClone.currentUser.set(user);
        Backbone.history.navigate("users/"+ YelpClone.currentUser.id, {trigger: true})
      }});
  },

  render: function() {
    this.$el.html(this.template({user: this.model}));
    return this;
  }
});
