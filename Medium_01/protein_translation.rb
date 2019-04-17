=begin

Lets write a program that will translate RNA sequences into proteins. RNA can be broken into three nucleotide sequences called codons, and then translated to a polypeptide like so:

RNA: "AUGUUUUCU" => translates to

Codons: "AUG", "UUU", "UCU"
=> which become a polypeptide with the following sequence =>

Protein: "Methionine", "Phenylalanine", "Serine"

There are 64 codons which in turn correspond to 20 amino acids; however, all of the codon sequences and resulting amino acids are not important in this exercise.

There are also four terminating codons (also known as 'STOP' codons); if any of these codons are encountered (by the ribosome), all translation ends and the protein is terminated. All subsequent codons after are ignored, like this:

RNA: "AUGUUUUCUUAAAUG" =>

Codons: "AUG", "UUU", "UCU", "UAA", "AUG" =>

Protein: "Methionine", "Phenylalanine", "Serine"

Note the stop codon terminates the translation and the final methionine is not translated into the protein sequence.--

Below are the codons and resulting Amino Acids needed for the exercise.

Codon	Protein
AUG	Methionine
UUU, UUC	Phenylalanine
UUA, UUG	Leucine
UCU, UCC, UCA, UCG	Serine
UAU, UAC	Tyrosine
UGU, UGC	Cysteine
UGG	Tryptophan
UAA, UAG, UGA	STOP

use test suite from protein_translation_test.rb
=end

class InvalidCodonError < StandardError; end

class Translation
  TERMINATING = %w[UAA UAG UGA]
  PROTEINS = {
    ['AUG'] => 'Methionine', ['UUU', 'UUC'] => 'Phenylalanine',
    ['UUA', 'UUG'] => 'Leucine', ['UCU', 'UCC', 'UCA', 'UCG'] => 'Serine',
    ['UAU', 'UAC'] => 'Tyrosine', ['UGU', 'UGC'] => 'Cysteine',
    ['UGG'] => 'Tryptophan', TERMINATING => 'STOP'
  }
  
  def self.of_codon(rna)
    PROTEINS.each do |codon, protein|
      raise InvalidCodonError unless PROTEINS.keys.flatten.include?(rna)
      return protein if codon.include?(rna)
    end
  end
  
  def self.of_rna(strand)
    proteins = []
    rna_list = strand.scan(/\w\w\w/)
    rna_list.each do |rna|
      break if TERMINATING.include?(rna)
      proteins << of_codon(rna)
    end
    proteins
  end
end