YelpClone.Collections.Users = Backbone.Collection.extend ({
  url: "/api/users",

  model: YelpClone.Models.User,

});

YelpClone.Collections.users = new YelpClone.Collections.Users();