#root/spec/factories.rb
#
FactoryGirl.define do
  factory :job do
      end
  factory :user do
     email { "#{user_name}@example.com".downcase }
     password "11111111"
     birthday { 35.years.ago }
  end
  factory :interview do
  end

  factory :invitation do
    end
  factory :line_item do
    end
  factory :work do
  end
  factory :relationship do
  end
  factory :review do
  end
  factory :talent_pool do
  end
  factory :saving_list do
  end

end

