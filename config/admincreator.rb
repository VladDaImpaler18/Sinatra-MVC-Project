class AdminCreator

    def initialize
    end

    def run
        admin=Owner.new
        while 42 #admin username\password creation
            confirmed= false
            while admin[:username].nil?
                puts ""
                puts "Enter the admin username. Requires at least one uppercase letter, any leading or trailing spaces will be removed."
                input = gets.strip
                puts ""
                if input.scan(/[A-Z]/).size > 0
                    puts "Username: '#{input}' :: Accepted"
                    admin[:username]= input
                else
                    puts "Username: '#{input}' :: Rejected"
                    puts "-- Doesn't meet criteria -- Requires AT LEAST one uppercase letter."
                    puts "==========================================\n"
                end
            end

            while admin[:password_digest].nil?
                puts ""
                puts "Enter the password for admin account. Any leading or trailing spaces will be removed."
                input = gets.strip
                puts "Please re-enter the password to confirm"
                input_conf = gets.strip
                puts ""

                if input==input_conf
                    puts ""
                    puts "Password: '#{input}' :: Accepted"
                    admin[:password_digest] = BCrypt::Password.create(input)
                else
                    puts ""
                    puts "Password: '#{input}' :: Rejected"
                    puts "--Password failed confirmation. Try again."
                    puts "==========================================\n"
                end
            end
            
            puts ""
            puts "Please confirm the admin account."
            puts "Enter Admin Username:"
            input_username = gets.strip
            puts ""

            puts "Enter Admin Password:"
            input_password = gets.strip
            puts ""
            if admin[:username].eql?(input_username) && admin.authenticate(input_password)
                puts "Congratulations! The admin account has been created successfully..."
                puts "Log in via the website to access the Admin Portal."
                puts "Lastly, environmental settings must be set.\n"
                confirmed= true
            elsif input_username.eql?("Restart") && input_password.eql?("Restart")
                admin[:username]= nil
                admin[:password_digest]= nil
            else
                puts "Login failed. Try again or enter 'Restart' in both username and password fields to redo the process. Restart is case sensitive"
                puts "==========================================\n"
            end
            break if confirmed
        end #end of admin username\password creation
        admin[:id]= 1
        admin.save(validate: false)

        while 42 #.env file variables
            puts ""
            puts "Picture filenames must be salted. Salt is formed by number of WORDS, and number of CHARACTERS."
            puts "Extreme WORD:CHARACTERS ratios will result in a low quality salt."
            puts "Enter the number of WORDS to be used. Only Integers are accepted. (Recommended: 2)"
            input_words = gets.strip.to_i
            puts ""

            puts "Enter the number of CHARACTERS to be used. Only Integers are accepted. (Recommended: 20)"
            input_characters = gets.strip.to_i
            puts ""
            
            quality = quality_check(:words => input_words, :letters => input_characters)
            
            if quality >= 75
                puts "Words: #{input_words}, Letters: #{input_characters} :: Accepted"
                puts "--Quality of salt is #{quality}%."
                write_env_file(:num_of_words => input_words, :num_of_characters => input_characters, :admin_username => admin[:username])
                quality = "Good"
            else
                puts "Words: #{input_words}, Letters: #{input_characters} :: Rejected"
                puts "--Quality of salt is #{quality}%, which is below the 75% threshold. Please try again"
            end

            break if quality == "Good"
        end #end of .env file variables + creation of .env file

    end

    def write_env_file(num_of_words:, num_of_characters:, admin_username:)
        File.open("./config/settings.env", 'wb') do |f|
            f.write("WORDS=#{num_of_words}")
            f.write("\n")
            f.write("LETTERS=#{num_of_characters}")
            f.write("\n")
            f.write("ADMIN_USERNAME=#{admin_username}")
        end
    end

    def quality_check(words:, letters:)
        total=0
        x=100
        x.times do
            total += RandomWordGenerator.composed(words,letters,'-').size
        end
        average = total / x
        difference = (letters-average).abs
        quality = (100-((difference.to_f/letters) * 100)).abs
        sprintf('%.2f', quality).to_f
    end
end