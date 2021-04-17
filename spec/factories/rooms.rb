FactoryBot.define do
  factory :room do
    name {Faker::Team.name}
    association :learn

    
    #association :learn
    #association :relearn
  end
end
