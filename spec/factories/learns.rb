FactoryBot.define do
  factory :learn do
    studytitle                { Faker::Name.initials(number: 13) }
    study                     { Faker::Lorem.sentence }
    area_provided             { Faker::Lorem.sentence }  #必要ではない
    thankyou_money            { 10000 }                #必要ではない
    condition                 { Faker::Lorem.sentence }  #必要ではない

    job_id                    { '2' }
    gender_id                 { '2' }
    prefecture_id             { '2' }
    area_id                   { '2' }
    learn_num_id              { '2' }

    association :user
    
  end
end
