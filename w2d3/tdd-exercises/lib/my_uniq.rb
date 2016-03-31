
class Array
  def my_uniq(&prc)
    prc ||= Proc.new{|el| el}
    result = []
    prc_returns = []
    each do |el|
      result << el unless prc_returns.include?(prc.call(el))
      prc_returns << prc.call(el)
    end
    result
  end
end
