# frozen_string_literal: true

class AnalyticsController < ApplicationController
  before_action :require_login, only: [:home]
  def home; end
end
