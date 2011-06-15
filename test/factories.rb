Factory.define :member do |m|
  m.first_name  'John'
  m.last_name   'Doe'
  m.birth_date  Date.new(1977, 7, 4)
  m.sequence(:membership_number) {|n| "NWUSA #{n}"}
end

Factory.define :aikido_rank do |r|
  r.sequence(:number) {|n| -10 + n}
  r.sequence(:description) {|n| "rank #{n}"}
  r.color       'white'
  r.letter      'A'
end

Factory.define :ki_rank do |r|
  r.sequence(:number) {|n| -10 + n}
  r.sequence(:description) {|n| "rank #{n}"}
  r.color       'white'
end

Factory.define :exam do |e|
  e.sequence(:the_date){|n| Date.today - 1000 + n }
end