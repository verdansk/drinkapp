class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]
  before_action :set_user

  def home
  end

  private

  def set_user
    @user = current_user
  end
end
