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
    if source.data.related_event == 'prototyes-process-play-2018'
      "background-image: url('/assets/img/events/headers/prototypes-process-play-2018.jpg');"
    elsif source.data.related_event == 'prototyes-process-play-2017'
      "background-image: url('/assets/img/events/headers/prototypes-process-play-2017.jpg');"
    elsif source.data.related_event == 'prototyes-process-play-2016'
      "background-image: url('/assets/img/events/headers/prototypes-process-play-2016.jpg');"
    elsif source.data.related_event == 'prototyes-process-play-2015'
      "background-image: url('/assets/img/events/headers/prototypes-process-play-2015.jpg');"
    else
      "background-image: url('/assets/img/updates/#{source.title.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')}/header.jpg');"
    end
  end
  def event_header(source)
    if source.data.alias == 'prototypes-process-play'
      "background-image: url('/assets/img/events/headers/#{source.data.alias}-#{Date.parse(source.data.date).strftime('%Y')}.jpg');"
    else
      "background-image: url('/assets/img/events/headers/#{source.data.alias}.jpg');"
    end
  end
  def event_logo(source)
    if source.data.alias == 'prototypes-process-play' and Date.parse(source.data.date).strftime('%Y') == '2017'
      "background-image: url('/assets/img/events/logos/#{source.data.alias}-2017.png'); background-image: url('/assets/img/events/logos/#{source.data.alias}-2017.svg');"
    else
      "background-image: url('/assets/img/events/logos/#{source.data.alias}.png'); background-image: url('/assets/img/events/logos/#{source.data.alias}.svg');"
    end
  end
  def event_logo_alt(source)
    if source.data.alias == 'prototypes-process-play' and Date.parse(source.data.date).strftime('%Y') == '2017'
      "background-image: url('/assets/img/events/logos/#{source.data.alias}-alt-2017.png'); background-image: url('/assets/img/events/logos/#{source.data.alias}-alt-2017.svg');"
    else
      "background-image: url('/assets/img/events/logos/#{source.data.alias}-alt.png'); background-image: url('/assets/img/events/logos/#{source.data.alias}-alt.svg');"
    end
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
