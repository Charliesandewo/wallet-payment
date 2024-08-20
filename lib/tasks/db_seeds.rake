namespace :db do
  namespace :seed do
    desc "Run a specific seed file"
    task single: :environment do
      seed_file_name = ENV["SEED_FILE"]
      if seed_file_name.present?
        seed_file = Rails.root.join("db", "seeds", "singles", "#{seed_file_name}.rb")
        if File.exist?(seed_file)
          load seed_file
          puts "Seed file '#{seed_file_name}' executed."
        else
          puts "Seed file '#{seed_file_name}' does not exist."
        end
      else
        puts "Please specify the seed file to run."
      end
    end
  end
end
