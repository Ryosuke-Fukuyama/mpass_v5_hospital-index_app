FactoryBot.define do
  factory :hospital do
    name { '第一病院' }
    # address { '1丁目' }
    access { 'バス1分' }
    url { 'url: https://hospital-1' }
    id { 1 }
  end
  factory :second_hospital, class: 'Hospital' do
    name { '第二病院' }
    # address { '2丁目' }
    access { 'バス2分' }
    url { 'url: https://hospital-2' }
  end
  factory :third_hospital, class: 'Hospital' do
    name { '第三病院' }
    # address { '3丁目' }
    access { 'バス3分' }
    url { 'url: https://hospital-3' }
  end
end
