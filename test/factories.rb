Factory.define :member do |m|
  m.first_name  'John'
  m.last_name   'Doe'
  m.birth_date  Date.new(1977, 7, 4)
  m.sequence(:membership_number) {|n| "NWUSA #{n}"}
end