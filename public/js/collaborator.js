LoginView = Backbone.View.extend({
	events:{
		'click #login': 'login'
	},
	login: function(){
		var username = $('#username').val();
		var password = $('#password').val();

		//alert($('#username').val());
		//alert($('#password').val());
		$.post('/login', {username: username, password: password}, function(data){
			alert(data);
		});
	},

	render: function(){
		var template = _.template($("#login_template").html(),{});
		this.$el.html(template);
	}
});


//this is the model for IndexView
IndexView = Backbone.View.extend({
	render: function(){
		var login = new LoginView({el: this.$el});
		login.render();	
	}
});


//this creates a router for our application - this is the controller
Collaborator = Backbone.Router.extend({
	routes: {
		"": "index"
	},

	index: function() {
		var index = new IndexView({el:'.main'})
		index.render()
	}
});