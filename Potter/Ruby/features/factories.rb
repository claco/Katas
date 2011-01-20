require 'factory_girl'

class Book
  attr_accessor :id, :name, :price
end

class Cart
  def self.calculate( books=[] )
    total = 0.0
    books.map{ |b| total += b.price }

    total
  end
end

Factory.define(:book) do |f|
  f.sequence(:id) {|n| n}
  f.sequence(:name) {|n| "Book #{n}" }
  f.price 8.00
end

