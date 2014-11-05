YelpClone.Views.SessionNew = Backbone.View.extend({
  template: JST["sessions/new"],
  errorTemplate: JST["helpers/errors"],

  events: {
    "submit form" : "submit"
  },

  submit: function(event) {
    event.preventDefault();
    var signInParams = $(event.currentTarget).serializeJSON();
    $.ajax({
      type: "POST",
      url: "/api/session",
      data: signInParams,
      success: function(response){
        if (YelpClone.navigateInfo) {
          YelpClone.currentUser.set(response);
          Backbone.history.navigate(YelpClone.navigateInfo.url, {trigger: true});
        } else {
          YelpClone.currentUser.set(response);
          Backbone.history.navigate("", {trigger: true});
        }
      }.bind(this),
      error: function(response){
        YelpClone.Utils.renderErrors.bind(this)(response);
      }.bind(this)
    })
  },

  // renderErrors: function(response){
  //   this.$el.html(this.errorTemplate({message: response.responseText}));
  //   this.$el.append(this.template());
  //   return this;
  // },

  render: function(){
    this.$el.html(this.template());
    return this;
  }
});
