module Prediction
  module Client
    
    class Book

      attr_reader :isbn, :title, :author, :published, :publisher, :image

      def initialize(isbn, title, author, published, publisher, image)
        @isbn = isbn
        @title = title
        @author = author
        @published = published
        @publisher = publisher
        @image = image
      end

      def to_s
        "Book: #{@isbn} / #{@title}"
      end

    end

  end
end