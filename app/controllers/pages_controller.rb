class PagesController < ApplicationController
  def index
  	fresh_when :last_modified
  end

  def contact
  	fresh_when :last_modified
  end

  def coaches
  	fresh_when :last_modified
  end

  def packages
  	fresh_when :last_modified
  end
end
