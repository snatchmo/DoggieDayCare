namespace :db do
  desc "Clear the db and fill with great sample data"
  task :populate => :environment do
    require 'populator'
    require 'faker'

    #Clear out the data :destroy_all
    # SLOW WAY
    #   Owner.destroy_all
    #   Dog.destroy_all

    # Another Way
    #   [Owner, Dog]. each do |o|
    #   o.destory_all
      #this is done so often that it has a shortcut
      [Owner, Dog].each(&:destroy_all)

      #Add Owners
      Owner.populate 30 do |owner|
        owner.name = Faker::Name.name
        owner.phone = Faker::PhoneNumber.phone_number
      #Add Dogs
      Dog.populate 1..10 do |dog|
          dog.owner_id = owner.id
          dog.name = Faker::Company.name
          dog.breed = Faker::Hacker.noun
          dog.age = rand (0..20)
        end #Dog
      end #Owner
  end # task
end