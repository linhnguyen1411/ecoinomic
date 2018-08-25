# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('app', 'assets', 'fonts')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
Rails.application.config.assets.precompile += %w(devise_user.js devise_user.css
  user_manager.js user_manager.css landing.js landing.css admin_manager.js admin_manager.css devise_admin.js devise_admin.scss particles.js)
Rails.application.config.assets.precompile += %w( particles.js ng_admin.js)
Rails.application.config.assets.precompile += %w(.svg .eot .woff .ttf .woff2 .otf)
