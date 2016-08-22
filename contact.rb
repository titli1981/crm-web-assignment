# Copy your entire Contact class from the old crm assignment here.
# Then, run the following at the command line:
#
#   ruby test/contact_test.rb
#
# If your implementation of the Contact class is 'right', then you should see that all tests pass!
gem 'activerecord', '=4.2.7'
require 'active_record'
require 'mini_record'
#we do not have to define a field for :id anymore. ActiveRecord will take care of creating an :id field that automatically increments!
ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'crm-web.sqlite3')

class Contact < ActiveRecord::Base
  field :first_name, as: :string # : (data name) string(data type)
  field :last_name,  as: :string
  field :email,      as: :string
  field :note,       as: :text

  def full_name
       "#{first_name} #{last_name}"
  end

end
Contact.auto_upgrade!
#Once the database fields are defined, we must add the following statement Contact.auto_upgrade! after the end of the class definition.
#This one takes care of effecting any changes to the underlying structure of the tables or columns.
