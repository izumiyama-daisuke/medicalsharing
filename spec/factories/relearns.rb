FactoryBot.define do
  factory :relearn do
    restudytitle                { Faker::Name.initials(number: 13) }
    restudy                     { Faker::Lorem.sentence }
    area_provided               { Faker::Lorem.sentence }  #必要ではない
    condition                   { Faker::Lorem.sentence }  #必要ではない

    job_id                    { '2' }
    gender_id                 { '2' }
    prefecture_id             { '2' }
    area_id                   { '2' }
    learn_num_id              { '2' }

    association :user
    association :learn
    
  end
end


