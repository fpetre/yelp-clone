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
      success: function(request){
        if (YelpClone.navigateInfo) {
          YelpClone.loggedIn = true;
          YelpClone.currentUser = new YelpClone.Models.User({id: request.id});
          Backbone.history.navigate(YelpClone.navigateInfo.url, {trigger: true});
        } else {
          Backbone.history.navigate("", {trigger: true});
        }
      }.bind(this),
      error: function(request){
        this.renderErrors(request);
      }.bind(this)
    })
  },

  renderErrors: function(request){
    this.$el.html(this.errorTemplate({message: request.responseText}));
    this.$el.append(this.template());
    return this;
  },

  render: function(){
    this.$el.html(this.template());
    return this;
  }
});