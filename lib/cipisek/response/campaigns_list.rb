require 'cipisek/response'
require 'cipisek/model'
require 'cipisek/response/campaign'

module Cipisek
  class Response < Model
    class CampaignsList < Cipisek::Response
      def campaigns
        @foreign_accounts ||= raw_hash["campaigns"].collect{|campaign| Cipisek::Response::Campaign.new(campaign)}
      end
    end
  end
end
