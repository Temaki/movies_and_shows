FactoryBot.define do

  # service_array = ["Test Service", "Test Service Two"]
  # letter = ["a", "b", "c", "d"]

  factory :movie, class: Movie do
    title { Faker::Lorem.sentence }
    plot { Faker::Lorem.paragraph }
    after :create do |movie|
      create_list :purchase_option, 1, purchaseable: movie, video_quality: 'SD', price_cents: 2.99
      create_list :purchase_option, 1, purchaseable: movie, video_quality: 'HD', price_cents: 3.99
    end
  end

  factory :season, class: Season do
    title { Faker::Lorem.sentence }
    plot { Faker::Lorem.paragraph }
    after :create do |season|
      create_list :purchase_option, 1, purchaseable: season, video_quality: 'SD', price_cents: 2.99
      create_list :purchase_option, 1, purchaseable: season, video_quality: 'HD', price_cents: 3.99
      create_list :episode, 12, season: season
    end
  end

  factory :episode, class: Episode do
    title { Faker::Lorem.sentence }
    plot { Faker::Lorem.paragraph }
  end

  factory :purchase_option, class: PurchaseOption do
    video_quality { 'SD' }
    price_cents { 2.99 }
    price_currency { 'EUR' }
  end

  factory :user, class: User do
    email { Faker::Internet.email }

    factory :user_with_content do

      transient do
        titles_count { 20 }
        active_titles_count { 5 }
      end

      after(:create) do |user, evaluator|
        Movie.all.each_with_index { |m,i|
          if i < evaluator.active_titles_count
            create(:purchase, user: user, purchase_option: m.purchase_options.sample)
          else
            create(:purchase, user: user, purchase_option: m.purchase_options.sample, created_at: 3.days.ago)
          end
          break if i == evaluator.titles_count
        }
      end

    end

  end

  factory :purchase, class: Purchase do

  end

end