# frozen_string_literal: true

class PagesController < ApplicationController
  def home
    @builds = Build.where(published: true)
    @parts = Part.first(4)
    render :home
  end
end
