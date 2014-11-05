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
        YelpClone.Utils.renderErrors.bind(this)({},response);
      }.bind(this)
    })
  },

  render: function(){
    this.$el.html(this.template());
    return this;
  }
});
