# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

Rank.delete_all

KiRank.create(:number => -3, :color => 'white', :description => 'shokyu')
KiRank.create(:number => -2, :color => 'white', :description => 'chukyu')
KiRank.create(:number => -1, :color => 'white', :description => 'jokyu')
KiRank.create(:number => 1, :color => 'black', :description => 'shoden')
KiRank.create(:number => 2, :color => 'black', :description => 'chuden')
KiRank.create(:number => 3, :color => 'black', :description => 'joden')
KiRank.create(:number => 4, :color => 'black', :description => 'okuden')
KiRank.create(:number => 5, :color => 'black', :description => 'kaiden')

AikidoRank.create(:number => -10, :color => 'white', :description => 'white belt')
AikidoRank.create(:number => -9, :color => 'yellow', :description => 'yellow belt')
AikidoRank.create(:number => -8, :color => 'orange', :description => 'first orange belt')
AikidoRank.create(:number => -7, :color => 'orange', :description => 'second orange belt')
AikidoRank.create(:number => -6, :color => 'blue', :description => 'first blue belt')
AikidoRank.create(:number => -5, :color => 'blue', :description => 'second blue belt')
AikidoRank.create(:number => -4, :color => 'purple', :description => 'first purple belt')
AikidoRank.create(:number => -3, :color => 'purple', :description => 'second purple belt')
AikidoRank.create(:number => -2, :color => 'brown', :description => 'first brown belt')
AikidoRank.create(:number => -1, :color => 'brown', :description => 'second brown belt')
AikidoRank.create(:number => 1, :color => 'black', :description => 'shodan')
AikidoRank.create(:number => 2, :color => 'black', :description => 'nidan')
AikidoRank.create(:number => 3, :color => 'black', :description => 'sandan')
AikidoRank.create(:number => 4, :color => 'black', :description => 'yondan')
AikidoRank.create(:number => 5, :color => 'black', :description => 'godan')
AikidoRank.create(:number => 6, :color => 'black', :description => 'rokudan')
AikidoRank.create(:number => 7, :color => 'black', :description => 'sichidan')
AikidoRank.create(:number => 8, :color => 'black', :description => 'hachidan')
AikidoRank.create(:number => 9, :color => 'black', :description => 'kyudan')
AikidoRank.create(:number => 10, :color => 'black', :description => 'jyudan')
