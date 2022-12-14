require 'rails_helper'

describe 'navigate' do
  describe 'index' do 
    it 'can be reached successfully' do
        visit posts_path
        expect(page.status_code).to eq(200)
    end
    it 'has a title of Posts' do
        visit posts_path
        expect(page).to have_content(/Posts/)
    end
  end
  describe 'creation' do 
    before do visit new_post_path
    end

    it 'it has a new form that can be reached' do
        expect(page.status_code).to eq(200)
    end
    it 'it can be created from new form page' do
        fill_in 'post[date]', with: Date.today
        fill_in 'post[rationale]', with: "some rationale" 
        click_on "Save"

        expect(page).to have_content("some rationale")
    end
  end
end 