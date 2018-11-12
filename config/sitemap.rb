# require 'fog/aws'

# SitemapGenerator::Sitemap.adapter = SitemapGenerator::S3Adapter.new(fog_provider: 'AWS',
#   aws_access_key_id: Rails.application.credentials.aws[:access_key_id],
#   aws_secret_access_key: Rails.application.credentials.aws[:secret_access_key],
#   fog_directory: 'primeperf',
#   fog_region: 'us-east-1'
# )

# SitemapGenerator::Sitemap.public_path = 'tmp/'
# SitemapGenerator::Sitemap.sitemaps_host = "https://s3.console.aws.amazon.com/s3/buckets/owlc/sitemaps/?region=us-west-2&tab=overview"
# SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'


# Set the host name for URL creation
# SitemapGenerator::Sitemap.default_host = "https://www.primeperformancesc.com"

SitemapGenerator::Sitemap.create(
  default_host: "https://www.primeperformancesc.com",
  sitemaps_path: 'sitemaps/',
  ) do

  # Put links creation logic here.
  #
  # The root path '/' and sitemap index file are added automatically for you.
  # Links are added to the Sitemap in the order they are specified.
  #
  # Usage: add(path, options={})
  #        (default options are used if you don't specify)
  #
  # Defaults: :priority => 0.5, :changefreq => 'weekly',
  #           :lastmod => Time.now, :host => default_host
  #
  # Examples:
  #
  # Add '/articles'
  #
  #   add articles_path, :priority => 0.7, :changefreq => 'daily'
  #
  # Add all articles:
  #

    add blogs_path, :priority => 0.5, :changefreq => 'daily'
    Blog.find_each do |b|
      add blog_path(b), :lastmod => b.updated_at, :priority => 0.5
    end

    add workouts_path, :priority => 0.5, :changefreq => 'daily'
    Workout.find_each do |w|
      add workout_path(w), :lastmod => w.updated_at, :priority => 0.5, :changefreq => 'daily'
    end

    add coaches_path :priority => 0.5
    add contact_path :priority => 0.5
    add packages_path :priority => 0.5

    Article.find_each do |article|
      add article_path(article), :lastmod => article.updated_at, :priority => 0.5
    end

    Tag.find_each do |tag|
      add tag_path(tag), :lastmod => tag.created_at, :priority => 0.5
    end

end
