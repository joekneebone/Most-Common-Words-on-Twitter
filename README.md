Most Common Words on Twitter
============================

This tool allows you to work out the most commonly used words on Twitter, by providing the frequencies of each word across multiple tweets.

This tool requires that Ruby and Python are installed on your computer. This tool also requires that you have the Twitter Ruby Gem (https://github.com/sferik/twitter).

Tweets can be collected in two different ways. The first way involves running the collect.rb script. This script is only able to collect tweets posted prior to 6 November 2010, as this is when Twitter implemented Snowflake (https://blog.twitter.com/2010/announcing-snowflake), meaning that tweets were no longer assigned sequential IDs. This way requires that you register a large number of applications with Twitter, in order to get around Twitter's rate limiting. See the notes at the beginning of the script if you wish to use any number of applications other than 100.

The other way of collecting tweets involves using a modified version of TwitterStream (https://github.com/arngarden/TwitterStream).

At any time during the collection of tweets, you can copy the output.txt file to the TweetCounter directory and run count.py. This script will tell you the number of tweets that you have collected.

Once tweets have been collected, run map.py with output.txt in the same directory, and then reduce.py with tweets.txt in the same directory. This will result in a file called frequency.txt, which contains the frequency of each word across the tweets. This can then be visualised with a tool such as Wordle (http://www.wordle.net/).

An example Wordle has been included in this repository.

Further details can be found at the beginning of each script.