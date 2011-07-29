Factory.define :user do |user|
  user.name "rails"
  user.email "rails@test.com"
  user.avatar File.new "#{Rails.root}/public/images/rails.png"
end
