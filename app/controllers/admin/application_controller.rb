class Admin::ApplicationController < ApplicationController

  before_filter :admin_required

  private

  def admin_required
    access_denied unless admin?
  end

end
