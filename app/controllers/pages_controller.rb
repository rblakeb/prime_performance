class PagesController < ApplicationController
  def index
  end

  def contact
  end

  def coaches
  end

  def packages
  end

  def schedule
  end

  def waiver
  end

  def privacy_policy
  end

  def sitemap
    redirect_to 'https://s3.us-east-2.amazonaws.com/primeperf/sitemaps/sitemap.xml.gz'
  end
end
