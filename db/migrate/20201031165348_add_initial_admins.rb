class AddInitialAdmins < ActiveRecord::Migration[6.0]
  def up
    User.create(email: 'admin@adverts.com',
                password: '123456',
                login: 'admin',
                full_name: 'admin',
                birthday: '123',
                address: '123',
                city: '123',
                state: '123',
                country: '123',
                zip: '123',
                role: 'Admin')
  end

  def down
    User.find_by_role('admin').delete_all
  end
end
