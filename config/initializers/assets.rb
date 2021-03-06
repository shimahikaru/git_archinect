# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path
# Add Yarn node_modules folder to the asset load path.
Rails.application.config.assets.paths << Rails.root.join('node_modules')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
Rails.application.config.assets.precompile += %w( top.css )
Rails.application.config.assets.precompile += %w( devise/user.css )
Rails.application.config.assets.precompile += %w( users.css )
Rails.application.config.assets.precompile += %w( products.css )
Rails.application.config.assets.precompile += %w( product/new.css )
Rails.application.config.assets.precompile += %w( product/show.css )
Rails.application.config.assets.precompile += %w( product/comment.css )
Rails.application.config.assets.precompile += %w( swiper.css )
Rails.application.config.assets.precompile += %w( user/index.css )
Rails.application.config.assets.precompile += %w( user/products.css )
Rails.application.config.assets.precompile += %w( products.js )
Rails.application.config.assets.precompile += %w( notices.css )
Rails.application.config.assets.precompile += %w( user/notices.css )
Rails.application.config.assets.precompile += %w( swiper.js )
Rails.application.config.assets.precompile += %w( user/new.css )
