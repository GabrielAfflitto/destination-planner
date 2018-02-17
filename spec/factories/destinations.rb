FactoryBot.define do
  factory :destination do
    name "dog"
    zip "80219"
    description "some random description"
    image_url File.open("./spec/support/images/test_image.jpg")
  end
end
