=begin
	
Your text analyzer will provide the following basic statistics: • Charactercount
• Charactercount(excludingspaces)
• Linecount
• Wordcount
• Sentencecount
• Paragraphcount
• Averagenumberofwordspersentence
• Averagenumberofsentencesperparagraph
	
=end

=begin
	
METHOD ONE
	

line_count = 0
text = ""

File.open("text.txt").each do |line| 

	line_count += 1
	text << line
end

puts "#{line_count} lines"
puts text



#lines = File.readlines("text.txt") #reads the entire file into an array, separated by CR as \n
lines = File.readlines(ARGV[0]) #the program takes the file name from the command line

line_count = lines.size
text = lines.join

puts "#{line_count} lines"

#Total characters

total_characters = text.length
puts "#{total_characters} total characters"

#Total characters without whitespace
total_characters_nospaces = text.gsub(/s+/, "").length
puts "#{total_characters_nospaces} total characters without spaces"

#Total words, method 1
total_words = text.scan(/\w+/).length
puts "total words, method 1: " + total_words.to_s

#Total words, method 2
total_word_split = text.split.length
puts "total words, split method: " + total_word_split.to_s

#Count sentences
total_sentences = text.split(/\.|\?|!/).length
puts "#{total_sentences} total sentences"

#Count paragraphs
total_paragraphs = text.split(/\n\n/).length
puts "#{total_paragraphs} total paragraphs"

#Average number of words per sentence
words_per_sentence = total_words / total_sentences
puts "words per sentence : " + words_per_sentence.to_s

#Average sentences per paragraph
sentences_per_paragraph = total_sentences / total_paragraphs
puts "#{sentences_per_paragraph} sentences per paragraph"

# EXTENDED FEATURES
# Stop words

stop_words = %w(the a by on for of are with just but and to the my I has some in)
p stop_words

=end

# ^^^^^^ THAT WAS MY VERSION

# BELOW IS HIS VERSION

# analyzer.rb -- Text Analyzer
stop_words = %w{the a by on for of are with just but and to the my I has some in}
lines = File.readlines("text.txt")
line_count = lines.size
text = lines.join
# Count the characters
character_count = text.length
character_count_nospaces = text.gsub(/\s+/, '').length
# Count the words, sentences, and paragraphs
word_count = text.split.length
sentence_count = text.split(/\.|\?|!/).length
paragraph_count = text.split(/\n\n/).length
# Make a list of words in the text that aren't stop words,
# count them, and work out the percentage of non-stop words
# against all words
all_words = text.scan(/\w+/)
good_words = all_words.select{ |word| !stop_words.include?(word) }
good_percentage = ((good_words.length.to_f / all_words.length.to_f) * 100).to_i
# Summarize the text by cherry picking some choice sentences
sentences = text.gsub(/\s+/, ' ').strip.split(/\.|\?|\!/)
sentences_sorted = sentences.sort_by { |sentence| sentence.length }
one_third = sentences_sorted.length / 3
ideal_sentences = sentences_sorted.slice(one_third, one_third + 1)
ideal_sentences = ideal_sentences.select { |sentence| sentence =~ /is|are/ }
# Give the analysis back to the user
puts "#{line_count} lines"
puts "#{character_count} characters"
puts "#{character_count_nospaces} characters (excluding spaces)"
puts "#{word_count} words"
puts "#{sentence_count} sentences"
puts "#{paragraph_count} paragraphs"
puts "#{sentence_count / paragraph_count} sentences per paragraph (average)"
puts "#{word_count / sentence_count} words per sentence (average)"
puts "#{good_percentage}% of words are non-fluff words"
puts "Summary:\n\n" + ideal_sentences.join(". ")
puts "-- End of analysis"
















