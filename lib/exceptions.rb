module Exceptions
  class AuthorizationRequiredError < StandardError
    attr_accessor :record, :authorization_method
  end

  class ProductNotAvailableError < StandardError
  end
end
