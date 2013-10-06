#!/usr/bun/ruby
require "Twitter"; # https://github.com/sferik/twitter
OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE;

# NOTES
	# This will only collect tweets that were tweeted prior to 6 November 2010
	# Replace the consumer_keys, consumer_scerets, oauth_tokens and oauth_token_secrets with your own, following the same order with each array (for example, the second consumer_key is for the same Twitter API application as the second consumer_secret)
	# Also replace each appearance of "1685124174-" with your own Twitter user id, followed by a "-"
	# Running this script will result in a lot of prints to the command line, as a large number of tweets from before 6 November 2010 are no longer available
	# To use more or less than 100 Twitter applications, replace '100' on line 46 with the actual number of Twitter applications

output = File.open("output.txt", "a+");

consumer_keys = ["gGy...", "5bB...", "more..."];
consumer_secrets = ["0Wl...", "Mhu...", "more..."];
oauth_tokens = ["pVU...", "aKu...", "more..."];
oauth_token_secrets = ["Su1...", "ybW...", "more..."];
threads = [];
i = 0;
j = 0;

Twitter.configure do |config|
	config.consumer_key = consumer_keys[i]
	config.consumer_secret = consumer_secrets[i]
	config.oauth_token = "1685124174-" + oauth_tokens[i]
	config.oauth_token_secret = oauth_token_secrets[i]
end

until j === 200
	threads[j] = Thread.new() {
		
		while 1
			Thread.current["todo"] = rand(29700500268);
			
			begin
				tweet = Twitter.status(Thread.current["todo"]);
				
				if tweet.retweeted_status.nil?
					tweet = tweet.text.gsub("\n", " ");
					
					output.write(tweet.to_s + "\n\n");
				end
				
			rescue Twitter::Error::TooManyRequests => error
				i = i + 1;
				if i == 100
					i = 0
				end
				Twitter.configure do |config|
					config.consumer_key = consumer_keys[i]
					config.consumer_secret = consumer_secrets[i]
					config.oauth_token = "1685124174-" + oauth_tokens[i]
					config.oauth_token_secret = oauth_token_secrets[i]
				end
			rescue Twitter::Error => e
				print "Error: " + e.to_s + "\n";
			end
		end
		
	}
	
	j = j + 1;
end

threads.each { |t|
	t.join;
}

output.close();