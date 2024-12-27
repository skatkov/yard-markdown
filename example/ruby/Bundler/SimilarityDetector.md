# Class: Bundler::SimilarityDetector
**Inherits:** Object
    




#Instance Methods
## initialize(corpus) [](#method-i-initialize)
initialize with an array of words to be matched against

**@return** [SimilarityDetector] a new instance of SimilarityDetector

## similar_word_list(word, limit3) [](#method-i-similar_word_list)
return the result of 'similar_words', concatenated into a list (eg "a, b, or
c")

## similar_words(word, limit3) [](#method-i-similar_words)
return an array of words similar to 'word' from the corpus

