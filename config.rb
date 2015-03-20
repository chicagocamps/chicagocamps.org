###
# Blog settings
###

Time.zone = "America/Chicago"

activate :blog do |blog|
  blog.name = "events"
  blog.permalink = "{category}/{year}/{title}.html"
  blog.sources = "events/{year}-{month}-{day}-{title}.html"
  blog.layout = "layouts/event"
  blog.publish_future_dated = true
end

activate :blog do |blog|
  blog.name = "updates"
  blog.permalink = "{category}/{year}/{title}.html"
  blog.sources = "updates/{year}-{month}-{day}-{title}.html"
  blog.layout = "layouts/update"
  blog.summary_separator = /(READMORE)/
  blog.paginate = true
  blog.per_page = 10
  blog.page_link = "{num}"
end

###
# Autoprefixer
###

activate :autoprefixer  do |config|
  config.browsers = ["last 3 versions", "Explorer >= 8"]
end

Sass::Script::Number.precision = 8

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
activate :livereload

# Methods defined in the helpers block are available in templates
helpers do
  def header_image(source)
    "background-image: url('/assets/img/updates/#{source.title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')}/header.jpg');"
  end
  def event_header(source)
    "background-image: url('/assets/img/events/headers/#{source.data.alias}.jpg');"
  end
  def event_logo(source)
    "background-image: url('/assets/img/events/logos/#{source.data.alias}.png'); background-image: url('/assets/img/events/logos/#{source.data.alias}.svg');"
  end
  def event_logo_alt(source)
    "background-image: url('/assets/img/events/logos/#{source.data.alias}-alt.png'); background-image: url('/assets/img/events/logos/#{source.data.alias}-alt.svg');"
  end
end

activate :directory_indexes

set :css_dir,    "assets/css"
set :js_dir,     "assets/js"
set :images_dir, "assets/img"

# Build-specific configuration
configure :build do

  ignore "style.html.haml"

  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash

  # Compress images
  activate :imageoptim

  # gzip all the things
  activate :gzip
  
  # Use relative URLs
  # activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"

end
