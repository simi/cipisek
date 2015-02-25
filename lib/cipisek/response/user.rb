require 'cipisek/model'

module Cipisek
  class Response < Model
    class User < Cipisek::Model
      attributes :userId, :username, :agencyStatus, :walletCredit,
        :walletCreditWithWat, :walletVerified, :dayBudgetSum, :accountLimit
    end
  end
end
