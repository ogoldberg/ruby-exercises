class Dictionary
  attr_accessor :entries
  attr_accessor :keywords

  def initialize
    @entries = {}
    @keywords = []
  end

  def add(entry)
    if entry.is_a?(Hash)
      @entries.merge!(entry)
    elsif entry.is_a?(String)
      @entries.merge!({entry => nil})
    end
  end

  def keywords
    @keywords = @entries.keys
    @keywords = @keywords.sort
  end

  def include?(word)
    keywords
    @keywords.each {|w| return true if w == word}
    return false
  end

  def find(term)
    @results = {}
    keywords
    @keywords.each { |word| search_entries(term, word)}
    @results
  end

  def search_entries(term, word)
    word.match(/^#{term}/) {|match| @results.merge!(@entries.select {|k,v| k == word})}
  end

  def printable
    print_out = ""
    find("*")
    @results.each do |k,v|
       print_out = print_out + %Q{[#{k}] "#{v}"\n}
    end
    print_out[0..-2]
  end
end