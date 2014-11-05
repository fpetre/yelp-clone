YelpClone.Utils.renderErrors = function(response) {
  this.$el.html(this.errorTemplate({message: response.responseText}));
  this.$el.append(this.template({review: this.model, business: this.business}));
  return this;
};
