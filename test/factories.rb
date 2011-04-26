Factory.define :member do |m|
  m.first_name  'John'
  m.last_name   'Doe'
  m.birth_date  Date.new(1977, 7, 4)
  m.sequence(:membership_number) {|n| "NWUSA #{n}"}
end

Factory.define :rank do |r|
  r.sequence(:number) {|n| -10 + n}
  r.sequence(:description) {|n| "rank #{n}"}
  r.color       'white'
  r.type        'AikidoRank'
end