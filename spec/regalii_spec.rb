require 'spec_helper'

describe 'Regalii', :type => :model do
  it 'averageis calculated well' do
    r = Regalii.new('x', 'q@q.com')
    r.bills = [
      {"type"=>"bill", "statement_date"=>"2016-11-28", "amount"=>"MTg5LjA=\n"},
      {"type"=>"bill", "statement_date"=>"2016-12-28", "amount"=>"JDIwMy4x\n"},
      {"type"=>"bill", "statement_date"=>"2017-01-28", "amount"=>"MTc0LjI=\n"},
      {"type"=>"bill", "statement_date"=>"2017-02-28", "amount"=>"JDE3My4z\n"}
    ]
    avg = r.send(:calculate_average)
    expect(avg).to eq(90.8)
  end
end
