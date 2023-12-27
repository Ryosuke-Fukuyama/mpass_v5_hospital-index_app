require 'rails_helper'

RSpec.describe 'Hospitals', type: :system do
  let!(:hospital_label_1) { FactoryBot.create(:hospital_label, id: 1) }
  let!(:hospital_label_2) { FactoryBot.create(:second_hospital_label, id: 2) }
  let!(:hospital_1) { FactoryBot.create(:hospital, hospital_label_ids: [1]) }
  let!(:hospital_2) { FactoryBot.create(:second_hospital, hospital_label_ids: [2]) }
  let!(:hospital_3) { FactoryBot.create(:third_hospital, hospital_label_ids: [1]) }
  # before do
  #   visit root_path
  #   click_on '病院一覧'
  # end

  describe 'index' do
    before do
      visit hospitals_path
    end
    it 'sort name_asc' do
      hospital_2.name = 'あ病院'
      visit hospitals_path
      list_top = first('tbody tr td')
      expect(list_top).to have_content hospital_2.name
    end
    context 'search' do
      subject { page }
      example 'name_search' do
        fill_in '病院名:', with: '第三'
        click_button '検索'
        is_expected.to have_content hospital_3.name
        is_expected.not_to have_content hospital_1.name
        is_expected.not_to have_content hospital_2.name
      end
      example 'label_search' do
        select '内科', from: '診療科:'
        click_button '検索'
        is_expected.to have_content hospital_1.name
        is_expected._to have_content hospital_3.name
        is_expected.not_to have_content hospital_2.name
      end
    end
    # xit 'transition' do
    #   click_on '第一病院'
    #   is_expected.to have_content hospital_1.name
    #   is_expected.to have_content hospital_1.email
    #   is_expected.to have_content hospital_1.tel
    # end
  end
end

