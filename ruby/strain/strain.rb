# Implement the `keep` and `discard` operation on collections.
# more details in README.md
class Array
  def keep
    reduce([]) do |extracts, element|
      yield(element) ? extracts << element : extracts
    end
  end

  def discard(&block)
    self - keep(&block)
  end
end
