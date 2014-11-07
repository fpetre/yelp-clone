YelpClone.Views.UserForm = Backbone.View.extend({
  template: JST["users/form"],
  errorTemplate: JST["helpers/errors"],

  events:{
    "submit form": "submit",
    'change .my-photo-upload': 'handleFile'
  },


  handleFile: function (event) {
    var file = event.currentTarget.files[0];
    var view = this;
    var reader = new FileReader();
    reader.onload = function(e) {
      // note that this isn't saving
      // var attrs = {user: {my_photo: this.result}}
      view.model.set('profile_photo', this.result);

    }
    reader.readAsDataURL(file);
  },

  submit: function(event){
    var view = this;
    event.preventDefault();
    var params = $(event.currentTarget).serializeJSON();
    var user = this.model;
    user.save(params["user"], {
      error: function(model,response){

        YelpClone.Utils.renderErrors.bind(view)({user: model}, response);
      },
      success: function(user){
        YelpClone.currentUser.set(user);
        delete view.model.attributes.profile_photo;
        Backbone.history.navigate("users/"+ YelpClone.currentUser.id, {trigger: true})
      }});
  },

  render: function() {
    this.$el.html(this.template({user: this.model}));
    return this;
  }
});
