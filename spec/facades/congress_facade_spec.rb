require 'rails_helper'

RSpec.describe 'CongressFacade' do
  it 'can return array of member objects given a state', :vcr do
    members = CongressFacade.members('CO')

    expect(members).to be_a Array
    # members.each do |member|
    #   expect(member).to be_a Member
    # end
    expect(members).to be_all Member
  end
end