FactoryGirl.define do

  factory :access_right, class: AccessRight do
    user

    before(:create) do |access_right|
      access_right.accessible = FactoryGirl.create(:shop)
    end
  end

  factory :user, class: User do
    name Faker::Name.name
    email_address 'devnull@inventid.us'
  end

  factory :admin_user, parent: :user do
    admin true
  end

  factory :event, class: Event do
    name Faker::Lorem.word
    organization

    after(:create) do |event|
      shops = FactoryGirl.create_list(:shop, 2, event: event)
    end
  end

  factory :frontend, class: Frontend do
    domain Faker::Internet.domain_name
  end

  # Done
  factory :organization, class: Organization do
    name Faker::Lorem.word

    after(:create) do |organization|
      FactoryGirl.create_list(:event, 2, organization: organization)
    end
  end

  factory :session, class: Session do
    user
  end

  factory :shop, class: Shop do
    name Faker::Lorem.word
    event
    frontend
  end

end
