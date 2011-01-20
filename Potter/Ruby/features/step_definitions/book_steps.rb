Given /^I have a collection of books$/ do
  @books = (1..5).collect{ Factory.stub(:book) }
end

Given /^I have (\d+) book in my cart$/ do |count|
  @cart = @books.slice(0, count.to_i)
  @cart.length.should equal(count.to_i)
end

When /^I calculate the cost$/ do
  @total = Cart.calculate( @cart )
end

Then /^the total shoud be \$([0-9.]+)$/ do |total|
  @total.should == total.to_f
end

