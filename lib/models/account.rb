class Account < ActiveRecord::Base
  belongs_to :user
  belongs_to :website

  def self.view_all_accounts
    Account.all.each do |account|
      puts "__________________________________________"
      puts "Account# #{account.id}"
      puts "Website - #{account.website.url}"
      puts "Username: #{account.username}"
      puts "Password: #{account.password}"
    end
  end

  def self.add_account
    puts "_____________________________"
    puts "Please enter the User's name."
    new_account = Account.new
    new_account_name = gets.chomp.to_s.capitalize
    if User.exists?(name: new_account_name)
      user_account = User.find_by(name: new_account_name)
      new_account.user_id = user_account.id
      puts "____________________________________"
      puts "Please enter the User's desired URL."
      desired_url = gets.chomp.to_s
      if Website.exists?(url: desired_url)
        website = Website.find_by(url: desired_url)
        new_account.website_id = website.id
        puts "______________________________"
        puts "Please enter Account Username."
        new_username = gets.chomp.to_s
        new_account.username = new_username
        puts "___________________________"
        puts "Please log User's Password."
        new_password = gets.chomp.to_s
        new_account.password = new_password
        new_account.save
        puts "__________________________________________________"
        puts "Thank you for creating a Account: - #{desired_url}"
        puts "Username: #{new_username}"
        puts "Password: #{new_password}"
      else
        puts "________________________________________"
        puts "The URL you have entered does not exist."
        puts "Please input URL in (ADD WEBSITE) menu"
      end
    else
      puts "_________________________________________"
      puts "The User you have entered does not exist."
      puts "Please add User to (ADD USER) menu"
    end
  end

  def self.update_account_info
    choices1 = "Please select to update? (Use ↑/↓ arrow keys, press Space to select and Enter to finish)"
    options = ["Username", "Password"]
    selection = $prompt.select(choices1, options)
    if selection == "Username"
      self.view_all_accounts
      puts "_________________________________________"
      puts "Please select Account# you wish to update"
      account_number = gets.chomp
      if Account.exists?(id: account_number)
        puts "________________________________________________"
        puts "Please enter desired Username you wish to update"
        new_username = gets.chomp
        Account.update(account_number, username: new_username)
        puts "________________"
        puts "Account Updated!"
      else
        puts "_________________"
        puts "Account Not found"
      end
    elsif selection == "Password"
      self.view_all_accounts
      puts "_________________________________________"
      puts "Please select Account# you wish to update"
      account_number = gets.chomp
      if Account.exists?(id: account_number)
        puts "________________________________________________"
        puts "Please enter desired Username you wish to update"
        new_password = gets.chomp
        Account.update(account_number, password: new_password)
        puts "________________"
        puts "Account Updated!"
      else
        puts "_________________"
        puts "Account Not Found"
      end
    end
  end

  def self.delete_account
    self.view_all_accounts
    puts "______________________________________________"
    puts "Please select which account you wish to delete"
    account_number = gets.chomp
    if Account.exists?(id: account_number)
      Account.delete(account_number)
    end
    puts "_________________________"
    puts "Account has been deleted!"
  end

  def self.last_updated_account
    Account.all.sort do |account|
    end
    Account.find_by(account.update_at)
  end

  def self.account_age
    Account.all.each do |account|
      account_age = Time.now - account.updated_at
    end
    account_age
  end
end
