dormitory-web
=============

== TODO

	pozriet sa ci sa do disqus-u moze prihlasit uzivatel zo serveru
		nasiel som gem https://github.com/missiondata/disqus
	jazyky
		https://github.com/Vermonster/copycat
		https://github.com/romanbsd/translate
		http://ruby-i18n.org/wiki

	autentifikacia
		devise gem

			1. Ensure you have defined default url options in your environments files. Here 
			     is an example of default_url_options appropriate for a development environment 
			     in config/environments/development.rb:

			       config.action_mailer.default_url_options = { :host => 'localhost:3000' }

			     In production, :host should be set to the actual host of your application.

			  2. Ensure you have defined root_url to *something* in your config/routes.rb.
			     For example:

			       root :to => "home#index"

			  3. Ensure you have flash messages in app/views/layouts/application.html.erb.
			     For example:

			       <p class="notice"><%= notice %></p>
			       <p class="alert"><%= alert %></p>

			  4. If you are deploying on Heroku with Rails 3.2 only, you may want to set:

			       config.assets.initialize_on_precompile = false

			     On config/application.rb forcing your application to not access the DB
			     or load models when precompiling your assets.

			  5. You can copy Devise views (for customization) to your app by running:

			       rails g devise:views


		neskor riesit rozne stupne autentifikacie - facebook, mojeid, google+,
		autorizacia - https://github.com/ryanb/cancan
		tuto: https://github.com/plataformatec/devise/wiki/Example-Applications

	novinky
		scaffold, pridat autorizaciu

	galeria
		gem instagram,flickr, facebook po prihlaseni

	wiki
		gem

	stena podobna facebooku s roznymi oddeleniami: inzercia, party, poziciavanie,spam,
		riesit to stromovo?
		najst gem