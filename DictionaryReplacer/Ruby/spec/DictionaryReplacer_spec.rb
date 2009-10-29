require File.dirname(__FILE__) + '/spec_helper.rb'
require 'DictionaryReplacer'

# Time to add your specs!
# http://rspec.info/
describe DictionaryReplacer do
  before(:each) do
    @replacer = DictionaryReplacer.new
  end

  it "can be created" do
    replacer = DictionaryReplacer.new
  end

  it "returns an empty string when given an empty string" do
    @replacer.replace("", {}).should eql("")
  end

  it "returns a string for a single dictionary entry" do
    @replacer.replace('$temp$', {'temp' => 'temporary'}).should eql('temporary')
  end

  it "returns a string for a multiple entry dictionary" do
    @replacer.replace("$temp$ here comes the name $name$", 
      {'temp'=>'temporary', 'name'=>'John Doe'}
    ).should eql('temporary here comes the name John Doe')
  end
end
