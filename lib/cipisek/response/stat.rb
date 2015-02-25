require 'cipisek/response'
require 'cipisek/model'

module Cipisek
  class Response < Model
    class Stat < Cipisek::Response
      attributes :impressions, :clicks, :ctr, :cpc, :price, :avgPosition,
        :conversions, :conversionRatio, :conversionAvgPrice, :conversionValue,
        :conversionAvgValue, :conversionValueRatio, :transactions,
        :transactionAvgPrice, :transactionAvgValue, :transactionAvgCount

      def date
        raw_hash.fetch("date").to_date
      end
    end
  end
end
