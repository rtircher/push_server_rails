class NotificationsController < ApplicationController

  def index
    @notification = Notification.new
  end

  def create
    @notification = Notification.new(params[:notification])

    p Rapns::Apns::App.find_by_name("ios_app")

    n = Rapns::Apns::Notification.new
    n.app = Rapns::Apns::App.find_by_name("ios_app")
    n.device_token = "bab40d7ddab5a6fca09eb2ab13fc5cd046da9064c4174f7e62c45477fd3a4656"
    n.alert = @notification.message
    n.attributes_for_device = {:foo => :bar}
    n.save!

    redirect_to notifications_path
  end

end
