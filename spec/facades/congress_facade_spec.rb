require 'rails_helper'

RSpec.describe CongressFacade do
  it '.members' do
    members = CongressFacade.members('CO')

    expect(members).to be_a Array
    members.each do |member|
      expect(member).to be_a Member
    end

    # members.first.to be_a Member
  end
end
