require 'rails_helper'

RSpec.describe 'CongressFacade' do

  describe 'one testing option:' do
    it 'can return array of member objects given a state' do
      VCR.use_cassette('successful_house_members_by_state_search') do
        members = CongressFacade.members('CO')

        expect(members).to be_a Array
        # members.each do |member|
        #   expect(member).to be_a Member
        # end
        expect(members).to be_all Member
      end
    end
  end

  describe 'another testing option' do
    it 'remastered: can return an array of member objects given a state' do
      json_response = JSON.parse(File.read('spec/fixtures/members_of_house.json'), symbolize_names: true)
      allow(CongressService).to receive(:house_members_by_state).and_return(json_response)

      members = CongressFacade.members('CO')

      expect(members).to be_a Array
      expect(members).to be_all Member
    end
  end
end