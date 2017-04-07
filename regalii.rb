require 'httparty'

class Regalii
  attr_accessor :uuid, :bills, :name, :email

  def initialize(name, email)
    @name  = name
    @email = email
  end

  def post_accounts
    options = {
      name:  @name,
      email: @email
    }

    response = HTTParty.post('https://deudas.herokuapp.com/accounts', query: options)
    @uuid    = response["uuid"]
    @bills   = response["bills"]
    response
  end

  def put_accounts
    options = {
      average: calculate_average
    }
    HTTParty.put("https://deudas.herokuapp.com/accounts/#{@uuid}", query: options)
  end

  private

  def calculate_average
    sum = 0.0
    @bills.each do |bill|
      sum += Base64.decode64(bill["amount"][0..-3]).to_f
    end
    sum / @bills.size
  end
end

