equire 'rails_helper'

RSpec.describe 'Topic Object', type: :poro do

  it 'creates and object for a topic from the JSON response' do


    members = MemberService.first_25('fire+nation')
    member = members[2]

    object = MemberObject.new(member)

    expect(object).to be_instance_of(MemberObject)
    expect(object.affiliation).to eq("Fire Nation military")
    expect(object.allies).to eq("Ozai")
    expect(object.enemies).to eq("Zuko")
    expect(object.name).to eq("Bujing")
    expect(object.photourl).to eq("https:/")

  end

end
