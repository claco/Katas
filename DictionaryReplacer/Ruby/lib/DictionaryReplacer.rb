$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

class DictionaryReplacer
  VERSION = '0.0.1'
  
  def replace(input, dictionary)
    dictionary.each_pair do |name, val|
      input.gsub!("$#{name}$", val)
    end
    
    return input
  end
end