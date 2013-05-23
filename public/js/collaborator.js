GroupView = Backbone.View.extend({

	render: function(){
		var group = Handlebars.compile($("#group_template").html());
		this.$("#group-list").append(template(JSON.stringify(group));
		alert("I can't take this anymore")
	}
});

LoginView = Backbone.View.extend({

	events:{
		'click #login': 'login'
	},
	login: function(){
		var username = $('#username').val();
		var password = $('#password').val();

		//alert($('#username').val());
		//alert($('#password').val());
		$.post('/login', {username: username, password: password}, function (data) {
			if(data['logged_in'] == true){
				collaborator.navigate("groups", {trigger: true});
				}else{
				alert("bugger off!");
				}

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
		"": "index",
		"groups": "groupList"
	},

	index: function() {
		var index = new IndexView({el:'.main'});
		index.render();
	},

	groupList: function(){
		var group = new GroupView({el:'.main'});
		group.render();
	}
});