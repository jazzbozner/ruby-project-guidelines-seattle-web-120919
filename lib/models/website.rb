class Website < ActiveRecord::Base
  has_many :accounts
  has_many :users, through: :accounts

  # shows all the websites available in the database
  def self.show_all_websites
    Website.all.map do |website|
      puts website.url
    end
    menu = "Press any key to continue, resumes automatically in one minute ..."
    $prompt.keypress(menu, timeout: 60)
  end

  # allows you to add a website to the database
  # checks to see if that website already exists based off of URL
  def self.adding_website
    puts "_________________________________________________________________________________________________"
    puts "Please input the URL of the website"
    puts "To cancel, please press (ENTER)."
    website = Website.new
    website_url = gets.chomp.to_s
    if !Website.exists?(url: website_url) && website_url != ""
      website.url = website_url
      website.save
      puts "_________________________________________________________________________________________________"
      puts "Website has been created #{website.url}".colorize(:green)
    elsif Website.exists?(url: website_url)
      puts "_________________________________________________________________________________________________"
      puts "The Website is active in our records.".colorize(:red)
    elsif website.url == ""
    end
  end
end
