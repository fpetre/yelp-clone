YelpClone.Utils.renderErrors = function(templateParams, response) {
  this.$el.html(this.errorTemplate({message: response.responseText}));
  this.$el.append(this.template(templateParams));
  return this;
};
