namespace :dev do
  
  task fake: :environment do
    User.destroy_all
    User.create(email: "xxx@xxx.com", password: "12345678", role: "admin", name: "79979")
    User.create(email: "yyy@yyy.com", password: "12345678", role: "admin", name: "10101")
    User.create(email: "zzz@zzz.com", password: "12345678", role: "admin", name: "33256")
    
    puts "3 個 admin 已創建"
    
    20.times do |i|
      name = FFaker::Name::first_name
      file = File.open("#{Rails.root}/public/avatar/user#{i+1}.jpg")
      
      user = User.new(
        name: name,
        email: "#{name}@xxx.co",
        password: "12345678",
        introduction: FFaker::Lorem::sentence(30),
        avatar: file
      )
      
      user.save!
      # puts user.name
    end
    puts "20 個普通使用者已創建"
    
    Tweet.destroy_all
    30.times do |i|
      Tweet.create!(
        description: FFaker::Lorem.sentence,
        user_id: User.all.sample.id
        )
    end
    puts "30 個 Tweets 已創建"
    
    Reply.destroy_all
    68.times do |i|
      Reply.create!(
        comment: "這是有的沒的回覆",
        user_id: User.all.sample.id,
        tweet_id: Tweet.all.sample.id
        )
    end
    puts "68 個 Replies 已創建"
    
    
    
  end
  
  
end
