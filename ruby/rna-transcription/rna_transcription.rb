# Given a DNA strand, return its RNA complement (per RNA transcription).
# more details in README.md
class Complement
  def self.of_dna(str)
    dna_rna = { 'G' => 'C', 'C' => 'G', 'T' => 'A', 'A' => 'U' }
    result = ''
    str.each_char do |chr|
      return '' unless dna_rna.key?(chr)
      result << dna_rna[chr]
    end
    result
  end
end

module BookKeeping
  VERSION = 4 # Where the version number matches the one in the test.
end

