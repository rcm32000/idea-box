require 'rails_helper'

describe 'admin authorization' do
  context 'as admin' do
      it 'allows admin to see all categories' do
        admin = User.create(username: 'Beth', password: 'password', role: 1)

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

        visit admin_categories_path(admin)
        expect(page).to have_content('Categories')
      end
    end

    context 'as default user' do
      it 'does not allow default user to see all categories' do
        user = User.create(username: 'Ramiro', password: 'password')

        allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

        visit admin_categories_path
        expect(page).to_not have_content('Categories')
        expect(page).to have_content("The page you were looking for doesn't exist")
      end
    end
  end
