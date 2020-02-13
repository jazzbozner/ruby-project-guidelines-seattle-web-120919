class Account < ActiveRecord::Base
  belongs_to :user
  belongs_to :website

  def self.view_all_accounts
    Account.all.each do |account|
      puts "__________________________________________".colorize(:yellow)
      puts "Account# #{account.id}"
      puts "Website - #{account.website.url}"
      puts "Username: #{account.username}"
      puts "Password: #{account.password}"
    end
    sleep 0.5
  end

  def self.add_account
    command = "Please select User. (Use arrow keys, press Space to select and Enter to finish)"
    options = User.all.map { |user| user.name }
    name_selection = $prompt.select(command, options)
    new_account = Account.new
    new_account_name = name_selection
    if User.exists?(name: new_account_name)
      user_account = User.find_by(name: new_account_name)
      new_account.user_id = user_account.id
      command = "Please select Website. (Use arrow keys, press Space to select and Enter to finish)"
      options = Website.all.map { |website| website.url }
      web_selection = $prompt.select(command, options)
      new_account_website = web_selection
      # binding.pry
      if Website.exists?(url: new_account_website)
        website = Website.find_by(url: new_account_website)
        new_account.website_id = website.id
        if Account.exists?(user_id: user_account.id, website_id: website.id)
          puts "_________________________________________________________________________________________________"
          puts "This account already exists.".colorize(:red)
          return
        end
        puts "_________________________________________________________________________________________________"
        puts "Please log Username for #{web_selection}."
        new_username = gets.chomp.to_s
        new_account.username = new_username
        puts "_________________________________________________________________________________________________"
        puts "Please log Password for #{web_selection}."
        new_password = gets.chomp.to_s
        new_account.password = new_password
        new_account.save
        puts "_________________________________________________________________________________________________"
        puts "Thank you for creating a Account: - #{web_selection}".colorize(:green)
        puts "Username: #{new_username}"
        puts "Password: #{new_password}"
      else
        puts "_________________________________________________________________________________________________"
        puts "The URL you have entered does not exist.".colorize(:red)
        puts "Please input URL in (ADD WEBSITE) menu"
      end
    else
      puts "_________________________________________________________________________________________________"
      puts "The User you have entered does not exist.".colorize(:red)
      puts "Please add User to (ADD USER) menu"
    end
  end

  def self.update_account_info
    command = "Please select to update? (Use arrow keys, press Space to select and Enter to finish)"
    options = ["Username", "Password"]
    selection = $prompt.select(command, options)
    if selection == "Username"
      self.view_all_accounts
      puts "_________________________________________________________________________________________________"
      puts "Please select Account# you wish to update"
      account_number = gets.chomp
      if Account.exists?(id: account_number)
        puts "_________________________________________________________________________________________________"
        puts "Input new Username."
        new_username = gets.chomp
        Account.update(account_number, username: new_username)
        puts "_________________________________________________________________________________________________"
        puts "Account Updated!".colorize(:green)
      else
        puts "_________________________________________________________________________________________________"
        puts "Account Not found".colorize(:red)
      end
    elsif selection == "Password"
      self.view_all_accounts
      puts "_________________________________________________________________________________________________"
      puts "Please select Account# you wish to update"
      account_number = gets.chomp
      if Account.exists?(id: account_number)
        puts "_________________________________________________________________________________________________"
        puts "Input new Password."
        new_password = gets.chomp
        Account.update(account_number, password: new_password)
        puts "________________"
        puts "Account Updated!".colorize(:green)
      else
        puts "_________________"
        puts "Account Not Found".colorize(:red)
      end
    end
  end

  def self.delete_account
    self.view_all_accounts
    puts "_________________________________________________________________________________________________"
    puts "Please select which account you wish to delete"
    account_number = gets.chomp
    if Account.exists?(id: account_number)
      Account.delete(account_number)
    end
    puts "_________________________________________________________________________________________________"
    puts "Account has been deleted!".colorize(:green)
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
