require 'cipisek/response'
require 'cipisek/model'

module Cipisek
  class Response < Model
    class Keyword < Cipisek::Response
      attributes :id, :name, :matchType, :deleted, :status, :disabled,
        :cpc, :url, :minCpc

      def create_date
        raw_hash.fetch("createDate").to_date rescue nil
      end
    end
  end
end
