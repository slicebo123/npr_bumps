# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :playlist_program_relation do
    playlist
    program
  end
end
