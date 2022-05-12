require 'rails_helper'

RSpec.describe Member do
  it 'exists' do
    data = {
      name: 'Jamison',
      role: 'President',
      party: 'Pizza',
      district: '5'
    }

    member = Member.new(data)

    expect(member).to be_a Member
    expect(member.name).to eq(data[:name])
    expect(member.role).to eq(data[:role])
    expect(member.party).to eq(data[:party])
    expect(member.district).to eq(data[:district])
  end
end