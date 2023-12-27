FactoryBot.define do
  factory :hospital do
    name { '第一病院' }
    access { 'バス1分' }
    url { 'url: https://hospital-1' }
    # address { '1丁目' }
  end
  factory :second_hospital, class: 'Hospital' do
    name { '第二病院' }
    access { 'バス2分' }
    url { 'url: https://hospital-2' }
    # address { '2丁目' }
  end
  factory :third_hospital, class: 'Hospital' do
    name { '第三病院' }
    access { 'バス3分' }
    url { 'url: https://hospital-3' }
    # address { '3丁目' }
  end
end
