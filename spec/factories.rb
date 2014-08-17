FactoryGirl.define do
  factory :article do
    universe
    name 'factory name'
  end

  factory :event do
    universe
    title 'factory title'
  end
  
  factory :relation do
    association :from_article, factory: :article
    association :to_article, factory: :article
  end

  factory :universe do
  end
end
