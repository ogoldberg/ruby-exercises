class XmlDocument

  def initialize(indent=false)
    @indent = indent
    @indent_amount = 0
  end 

  def method_missing(tag, name=nil, &block)
    output = ""
    output << ("  " * @indent_amount) if @indent
    output << "<#{tag}"
    if name
      name = name.shift
      output << " #{name[0]}='#{name[1]}'"
    end      
    if block     
      output << ">"
      output << "\n" if @indent
      @indent_amount += 1
      output << yield
      @indent_amount -= 1
      output << ("  " * @indent_amount) if @indent
      output << "</#{tag}>"
      output << "\n" if @indent
    else
      output << "/>"
      output << "\n" if @indent
    end
    output
  end
end