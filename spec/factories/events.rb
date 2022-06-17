FactoryBot.define do
  factory :event do
   date { 1.day.from_now.to_date } 
   time { Time.now + 1.day }
   location {"Any Location !"}
   title { "An adequate title" }
   description { "An adequate description" }
   creator { create(:user) }
  end 



end
