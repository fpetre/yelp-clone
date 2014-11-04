YelpClone.Views.SessionNew = Backbone.extend({
  template: JST["sessions/new"],
  template: JST["helpers/errors"]

  events: {
    "submit form" : "submit"
  },

  submit: function(event) {
    var signInParams = $(event.currentTarget).serializeJSON();
    $.ajax({
      type: "POST",
      url: "/api/session",
      data: signInParams,
      success: function(){},
      error: function(){}
    })
  }.bind(this),

  renderErrors: function(request, message, exception){
    console.log("error request", request);
    console.log("error message", message);
    console.log("error exception", exception);


  },

  render: function(){
    this.$el.html(this.template());
    return this;
  }
});