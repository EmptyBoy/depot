# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

Product.delete_all
#
Product.create( :title       => 'Test product',
                :description => "Some text.\n Blabla.",
                :image_url   => '/images/ruby.jpg',
                :price       => 39.90 )
#
Product.create( :title       => 'Second',
                :description => "Blabla.",
                :image_url   => '/images/ruby.png',
                :price       => 255 )