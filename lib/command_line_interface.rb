class CommandLineInterface
  $prompt = TTY::Prompt.new

  ## RUN METHOD ##

  def run
    greet
    sleep 1.5
    login
    main_menu
  end

  ## MAIN MENU METHODS ##

  def greet
    puts "                                        "
    puts "     Welcome to Not So Safe Vault       ".colorize(:green)
    puts "________________________________________".colorize(:yellow)
    puts "Lets keep your account info not so safe."
    puts "                                        "
  end

  def login
    name = $prompt.ask("What is your name?", default: "User")
    puts ""
    puts "_________________________________________________________________________________________________".colorize(:yellow)
    puts "Welcome, #{name}!"
  end

  def main_menu
    puts ""
    choices = "What would you like to accomplish? (Use arrow keys, press Enter to finish)"
    options = [
      "Show all Websites",
      "Show all Users",
      "Show all Accounts",
      "Add Website",
      "Add User",
      "Add Account",
      "Update Account Info",
      "Delete Account Info",
      "Exit",
    ]
    selection = $prompt.select(choices, options)
    if selection == "Show all Websites" #complete
      Website.show_all_websites
      main_menu
    elsif selection == "Show all Users" #complete
      User.show_all_users
      main_menu
    elsif selection == "Show all Accounts" #complete
      Account.view_all_accounts
      main_menu
    elsif selection == "Add Website" #complete
      Website.adding_website
      main_menu
    elsif selection == "Add User" #complete
      User.adding_user
      main_menu
    elsif selection == "Add Account" #complete
      Account.add_account
      main_menu
    elsif selection == "Update Account Info" #complete
      Account.update_account_info
      main_menu
    elsif selection == "Delete Account Info" #complete
      Account.delete_account
      main_menu
    elsif selection == "Exit" #complete
      exit_message
    end
  end

  def exit_message
    puts "_____________________________________".colorize(:yellow)
    puts "Thank you for being not so safe."
    sleep 1
    puts "Good Bye"
    sleep 1
  end
end
