# do the `Transform` step of an Extract-Transform-Load.
# Details in README.md
class ETL
  class << self
    def transform(old)
      new_hsh = {}
      old.each do |point, letters|
        letters.collect do |letter|
          new_hsh[letter.downcase] = point
        end
      end
      new_hsh
    end
  end
end

module BookKeeping
  VERSION = 1 # Where the version number matches the one in the test.
end
