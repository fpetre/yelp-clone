YelpClone.Views.BusinessShow = Backbone.View.extend({
  template: JST["businesses/show"],

  initialize: function() {
    this.listenTo(this.model, "add, change, sync", this.render);
  },

  render: function() {
    this.$el.html(this.template({business: this.model}));
    return this;
  }
});