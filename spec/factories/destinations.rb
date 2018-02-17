FactoryBot.define do
  factory :destination do
    sequence(:name) {|n| "destination #{n}" }
    zip "80219"
    description "some random description"
    image "image.jpg"
  end
end
