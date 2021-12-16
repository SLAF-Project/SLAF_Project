# frozen_string_literal: true

class AdminController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :check_if_admin

  def index
    @user = User.all
    @idiom = Idiom.all
    @admin = current_user.admin
  end

  def update; end

  private

  def check_if_admin
    redirect_to root_path if current_user.admin == false
  end
end
