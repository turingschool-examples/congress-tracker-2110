class CongressFacade
  def self.members(state)
    # FACADE: handle data from service(s) and turn it into PORO instances, handle formatting/data manipulation
    # interacts with controller, too! Does all the work controllers need, can include DB/AR interactions
    json = CongressService.house_members_by_state(state)

    json[:results].map do |member_data|
      Member.new(member_data)
    end
  end

  def self.senate_search(query)
    members = CongressService.senate_members
    binding.pry
    found_members = members.find_all { |m| m[:last_name] == query }

    return nil unless found_members.present?

    Member.new(found_members.first)
  end
end