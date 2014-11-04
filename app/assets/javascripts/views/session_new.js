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
      success: function(){
        if (currentUser.navigateInfo) {
          Backbone.history.navigate(navigateInfo, {trigger: true});
        } else {
          backbone.history.navigate("", {trigger: true});
        }
      }.bind(this),
      error: function(request, message, exception){
        this.renderErrors(request, message, exception);
      }.bind(this)
    })
  },

  renderErrors: function(request, message, exception){
    console.log("error request", request);
    console.log("error message", request.responseText);
    console.log("error exception", exception);
    this.$el.html(this.errorTemplate({message: request.responseText}));
    this.$el.append(this.template());
    return this;
  },

  render: function(){
    this.$el.html(this.template());
    return this;
  }
});