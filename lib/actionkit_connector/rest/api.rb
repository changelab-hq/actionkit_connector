require 'actionkit_connector/rest/action'
require 'actionkit_connector/rest/page'
require 'actionkit_connector/rest/donation_push'
require 'actionkit_connector/rest/donationform'
require 'actionkit_connector/rest/petitionform'

module ActionKitConnector
  module REST
    module API
      include ActionKitConnector::REST::Action
      include ActionKitConnector::REST::Page
      include ActionKitConnector::REST::DonationPush
      include ActionKitConnector::REST::Donationform
      include ActionKitConnector::REST::Petitionform

    end
  end
end