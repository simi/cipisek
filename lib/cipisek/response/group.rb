require 'cipisek/response'
require 'cipisek/model'
require 'cipisek/response/premise'
require 'cipisek/response/target_devices'

module Cipisek
  class Response < Model
    class Group < Cipisek::Response
      attributes :id, :name, :status, :active, :suspend, :deleted, :cpc,
        :cpcContext, :cpt, :createDate, :maxUserDailyImpression

      def create_date
        raw_hash["createDate"].to_date
      end
    end
  end
end
