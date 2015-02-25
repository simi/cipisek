require 'cipisek/response'
require 'cipisek/model'
require 'cipisek/response/premise'
require 'cipisek/response/target_devices'

module Cipisek
  class Response < Model
    class Campaign < Cipisek::Response
      attributes :id, :name, :deleted, :status, :dayBudget, :exhaustedDayBudget,
        :adSelection, :totalBudget, :exhaustedTotalBudget, :totalClicks,
        :exhaustedTotalClicks

      def create_date
        @create_date ||= raw_hash["createDate"].to_date
      end

      def premise
        @premise ||= Cipisek::Response::Premise.new(raw_hash["premise"])
      end

      def target_devices
        @target_devices ||= Cipisek::Response::TargetDevices.new(raw_hash["targetDevices"])
      end
    end
  end
end
