require '../spec_helper'

describe User do
  it 'should have six new users with a photo each' do

    steph = User.create!({name: "Stephanie", user_name: "Steph", email: "steph@gmail.com", password: "password"})
    dan = User.create!({name: "Daniel", user_name: "Dan", email: "dan@gmail.com", password: "password"})
    sandy = User.create!({name: "Sandra", user_name: "Sandy", email: "sandy@gmail.com", password: "password"})
    jet = User.create!({name: "Scott", user_name: "Jet", email: "jet@gmail.com", password: "password"})
    rand = User.create!({name: "Andrew", user_name: "Rand", email: "rand@gmail.com", password: "password"})
    mon = User.create!({name: "Monica", user_name: "Mon", email: "mon@gmail.com", password: "password"})

    expect(User.all.length).to eq 6

    expect(users.first).to eq(
      "id" => steph.id,
      "name" => "Stephanie",
      "user_name" => "Steph",
      "email" => "steph@gmail.com",
      "password" => "password"
      )

    steph.photos << Photo.create!
    steph.reload
    dan.photos << Photo.create!
    dan.reload
    sandy.photos << Photo.create!
    sandy.reload
    jet.photos << Photo.create!
    jet.reload
    rand.photos << Photo.create!
    rand.reload
    mon.photos << Photo.create!
    mon.reload

    expect(steph.photos).to include ({photo_id: 1})
    expect(dan.photos).to include ({photo_id: 2})
    expect(sandy.photos).to include ({photo_id: 3})
    expect(jet.photos).to include ({photo_id: 4})
    expect(rand.photos).to include ({photo_id: 5})
    expect(mon.photos).to include ({photo_id: 6})
  end
end

describe Trait do
  it 'should have twenty-five trait objects' do
    word_bank = [
      "mysterious",
      "serious",
      "intelligent",
      "easy-going",
      "ambitious",
      "fun",
      "unique",
      "sexy",
      "vain",
      "athletic",
      "artistic",
      "wholesome",
      "wild",
      "unusual",
      "attractive",
      "outdoorsy",
      "kinky",
      "weird",
      "professional",
      "wealthy",
      "high-maintenance",
      "health-conscious",
      "traditional",
      "social",
      "unhealthy"
    ]

    word_bank.each do |trait|
      Trait.create(word: trait)
    end

    Traits.all.length.should == 25

  end
end

