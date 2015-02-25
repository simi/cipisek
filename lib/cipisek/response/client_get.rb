require 'cipisek/response'
require 'cipisek/model'

module Cipisek
  class Response < Model
    class ClientGet < Cipisek::Response
      def user
        @user ||= Cipisek::Response::User.new(raw_hash["user"])
      end

      def foreign_accounts
        @foreign_accounts ||= raw_hash["foreignAccounts"].collect{|acc| Cipisek::Response::ForeignAccount.new(acc)}
      end
    end
  end
end
