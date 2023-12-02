[
  "内科",      # 1
  "外科",      # 2
  "整形外科",   # 3
  "皮膚科",    # 4
  "脳神経外科", # 5
  "眼科",      # 6
  "耳鼻科",    # 7
  "小児科",    # 8
  "歯科",      # 9
  "接骨院"     # 10
].each do |name|
    HospitalLabel.create!(name: name)
end

[
  ["サンプルクリニック", [1]],
  ["DIC総合病院", [1, 2, 3, 4, 5]],
  ["眼科", [6]],
  ["耳鼻科", [7]],
  ["小児科", [1, 8]],
  ["歯科", [9]],
  ["歯科クリニック", [9]],
  ["接骨院", [10]],
  ["休日診療所", [1]],
  ["医院", [1]], ["医院", [1]], ["医院", [1]], ["医院", [1]], ["医院", [1]], ["医院", [1]], ["医院", [1]], ["医院", [1]], ["医院", [1]], ["医院", [1]], ["医院", [1]], ["医院", [1]]
].each do |name, hospital_label_ids|
  Hospital.create!({
    name:               Gimei.last.katakana  + name,
    access:             "〇〇駅 徒歩◆◆分",
    url:       "http://sample-url",
    hospital_label_ids: hospital_label_ids
  })
end

admin.create!(
  password:              password,
  password_confirmation: password,
)