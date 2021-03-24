require 'rails_helper'

describe User, type: :model do
  context 'Associations' do
    it { should have_one_attached(:photo) }
    it { should have_one_attached(:coverimage) }
    it { should have_many(:followers), foreign_key: :followed_id, class_name: :Following }
    it { should have_many(:follows), foreign_key: :follower_id, class_name: :Following }
    it { should have_many(:tweets), foreign_key: :autho_id, class_name: :Tweet }
  end

  context 'Validations' do
    it { should validate_presence_of(:username).with_message('Username needs to be present') }
    it { should validate_uniqueness_of(:username).with_message('Username already taken. Please try a new one') }
    it{ should validate_length_of(:username)
        .is_at_least(3)
        .with_message('Username should be atleast 3 characters long')
    }
    it { should validate_presence_of(:fullname).with_message('Fullname needs to be present') }
     it{ should validate_length_of(:fullname)
        .is_at_least(3)
        .with_message('Fullname should be atleast 3 characters long')
    }


   it {should validate_content_type_of(:photo).allowing('image/png', 'image/jpg','image/jpeg')}
    
   it {should validate_size_of(:photo).less_than(500.kilobytes) }

    it {should validate_content_type_of(:coverimage).allowing('image/png', 'image/jpg','image/jpeg')}
    
    it {should validate_size_of(:coverimage).less_than(500.kilobytes)}
  end
end
