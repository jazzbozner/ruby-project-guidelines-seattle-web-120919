class User < ActiveRecord::Base
  has_many :accounts
  has_many :websites, through: :accounts

  def self.show_all_users
    User.all.each do |user|
      puts user.name
    end
    menu = "Press any key to continue, resumes automatically in one minute ..."
    $prompt.keypress(menu, timeout: 60)
  end

  def self.adding_user
    puts "_________________________________________________"
    puts "Please input the name of the User"
    puts "To cancel, please press (ENTER)."
    user = User.new
    user_name = gets.chomp.to_s.capitalize
    if !User.exists?(name: user_name) && user_name != ""
      user.name = user_name
      user.save
      puts "__________________________________"
      puts "User has been created #{user.name}"
    elsif User.exists?(name: user.name)
      puts "_____________________________________"
      puts "The User is active in our records."
    elsif user_name == ""
    end
  end
end
