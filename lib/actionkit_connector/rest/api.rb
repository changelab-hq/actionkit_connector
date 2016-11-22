require 'actionkit_connector/rest/action'
require 'actionkit_connector/rest/page'
require 'actionkit_connector/rest/multilingual_campaign'
require 'actionkit_connector/rest/donation_push'
require 'actionkit_connector/rest/donationform'
require 'actionkit_connector/rest/recurring_payment_push'
require 'actionkit_connector/rest/petitionform'
require 'actionkit_connector/rest/order'
require 'actionkit_connector/rest/donation_action'
require 'actionkit_connector/rest/language'
require 'actionkit_connector/rest/tag'
require 'actionkit_connector/rest/user'
require 'actionkit_connector/rest/recurring_payment_cancellation'
require 'actionkit_connector/rest/petition_action'
require 'actionkit_connector/rest/page_follow_up'

module ActionKitConnector
  module REST
    module API
      include ActionKitConnector::REST::Action
      include ActionKitConnector::REST::Page
      include ActionKitConnector::REST::MultilingualCampaign
      include ActionKitConnector::REST::DonationPush
      include ActionKitConnector::REST::DonationAction
      include ActionKitConnector::REST::RecurringPaymentPush
      include ActionKitConnector::REST::Donationform
      include ActionKitConnector::REST::Petitionform
      include ActionKitConnector::REST::PageFollowUp
      include ActionKitConnector::REST::Order
      include ActionKitConnector::REST::Language
      include ActionKitConnector::REST::Tag
      include ActionKitConnector::REST::User
      include ActionKitConnector::REST::RecurringPaymentCancellation
      include ActionKitConnector::REST::PetitionAction
      include ActionKitConnector::REST::PageFollowUp
    end
  end
end
