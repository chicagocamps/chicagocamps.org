###
# Blog settings
###

Time.zone = "America/Chicago"

activate :blog do |blog|
  # This will add a prefix to all links, template references and source paths
  # blog.prefix = "blog"

  blog.permalink = "{category}/{year}/{title}.html"
  blog.sources = "{category}/{year}-{month}-{day}-{title}.html"
  # blog.taglink = "tags/{tag}.html"
  # blog.layout = "layouts/update"
  blog.summary_separator = /(READMORE)/
  # blog.summary_length = 250
  # blog.year_link = "{year}.html"
  # blog.month_link = "{year}/{month}.html"
  # blog.day_link = "{year}/{month}/{day}.html"
  # blog.default_extension = ".markdown"

  # Enable pagination
  blog.paginate = true
  blog.per_page = 5
  blog.page_link = "{num}"
end

###
# Autoprefixer
###

activate :autoprefixer  do |config|
  config.browsers = ["last 3 versions", "Explorer >= 8"]
end

page "/feed.xml", layout: false

Sass::Script::Number.precision = 8

###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:

#
# With no layout
# page "/path/to/file.html", layout: false
#
# With alternative layout
# page "/path/to/file.html", layout: :otherlayout
#
# A path which all have the same layout
with_layout :update do
  page "podcasts/*"
  page "posts/*"
end

page "events/*", layout: :event

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
activate :livereload

# Methods defined in the helpers block are available in templates
helpers do
  def event_src(source)
    "/assets/img/#{source.data.category}/#{source.date.strftime('%Y-%m-%d')}-#{source.title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')}"
  end
  def header_image(source)
    "background-image: url('#{event_src(source)}/header.jpg');"
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
  # activate :minify_javascript

  # Enable cache buster
  # activate :asset_hash

  # Use relative URLs
  # activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/Content/images/"

end
