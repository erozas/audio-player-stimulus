class PagesController < ApplicationController
  def home
    @episode = Episode.first
  end
end
