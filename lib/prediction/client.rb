require "prediction/client/version"
require "prediction/client/key"

require "csv"
require "faker"
require "predictionio"

require_relative "./user"
require_relative "./book"

module Prediction
  module Client
    
    def self.seed_user_data(filename = "sample-users.csv")
      client = PredictionIO::Client.new(Prediction::Client::KEY)
      file = File.join(File.dirname(__FILE__), '../..', 'data', filename)
      CSV.foreach(file, {:col_sep => ";"}) do |row|
        user = User.new(row[0].to_i, Faker::Name.name, row[1])
        #puts user
        client.acreate_user(user.id, {:name => user.name, :location => user.location})
      end
    end

    def self.seed_book_data(filename = "sample-books.csv")
      client = PredictionIO::Client.new(Prediction::Client::KEY)
      file = File.join(File.dirname(__FILE__), '../..', 'data', filename)
      CSV.foreach(file, {:col_sep => ";"}) do |row|
        book = Book.new(row[0], row[1], row[2], row[3].to_i, row[4], row[6])
        #puts book
        client.acreate_item(book.isbn, ["book"], params = {:title => book.title, :author => book.author, :published => book.published, :publisher => book.publisher, :image => book.image})
      end
    end

    def self.seed_ratings(filename = "sample-ratings.csv")
      client = PredictionIO::Client.new(Prediction::Client::KEY)
      file = File.join(File.dirname(__FILE__), '../..', 'data', filename)
      CSV.foreach(file, {:col_sep => ";"}) do |row|
        user_id = row[0].to_i
        isbn = row[1]
        rating = row[2].to_i
        
        #puts "#{user_id} : #{isbn} => #{rating}"
        client.identify(user_id)
        client.record_action_on_item("rate", isbn, {:pio_rate => rating})
      end
    end

    def self.get_user(uid)
      client = PredictionIO::Client.new(Prediction::Client::KEY)
      client.get_user(uid)
    end

    def self.get_recommendations_for_user(user_id)
      client = PredictionIO::Client.new(Prediction::Client::KEY)
      client.identify(user_id)
      client.get_itemrec_top_n("BookReco", 3)
    end

  end
end
