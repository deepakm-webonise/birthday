class HomeController < ApplicationController
  def show
    @today = User.where('birthday >= ? AND birthday < ?', Time.zone.today.beginning_of_day, Time.zone.today.end_of_day)
    @tomorrow = User.where('birthday >= ? AND birthday < ?', Time.zone.tomorrow.beginning_of_day, Time.zone.tomorrow.end_of_day)
    @this_week = User.where('birthday > ? AND birthday < ?', 2.days.from_now.in_time_zone.beginning_of_day, 7.days.from_now.in_time_zone.end_of_day)
  end
end
