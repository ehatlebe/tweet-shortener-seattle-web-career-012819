require 'pry'

def dictionary
  dictionary = {
    "hello" => "hi",
    "to" => "2",
    "two" => "2",
    "too" => "2",
    "for" => "4",
    "four" => "4",
    "be" => "b",
    "you" => "u",
    "at" => "@",
    "and" => "&"
  }
end

def word_substituter(tweet)
  tweet.split.collect do |word|
  # .split => converts tweet's words into individual values of an array
  # word = individual word elements of the split array
  # .collect iterates through the array by invoking the below block on each element, will change the return value
    if dictionary.keys.include?(word.downcase)
      word = dictionary[word.downcase]
      # if a word from tweet array (in downcase) matches one of the keys in dictionary method's dictionary hash, replace it with the related dictionary hash value
    else
      word
      # if the word doesn't match any keys from dictionary hash, leave it as it is
    end
  end.join(" ")
  # converts the array with some replaced elements back into a string, rejoining word elements with a space (" ") speration
end

def bulk_tweet_shortener(tweets)
  tweets.each do |tweet|
  # tweet is one of the elements in tweets array
    puts word_substituter(tweet)
  end
end

def selective_tweet_shortener(tweet)
  if tweet.length > 140
    word_substituter(tweet)
  else
    tweet
  end
end

def shortened_tweet_truncator(tweet)
  if tweet.length > 140
    "#{word_substituter(tweet)[0..136]}..."
    # since character limit is 140, if tweet length is longer that that, string elements from 0 to 136 are listed then ... brings to the 140 limit
  else
    tweet
  end
end
