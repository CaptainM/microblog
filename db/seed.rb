require 'active_record'
ActiveRecord::Base.establish_connection({
	database: 'microblog_db',
	adapter: 'postgresql'
	})

#models
require_relative '../models/author.rb'
require_relative '../models/micropost.rb'
require_relative '../models/tag.rb'

#Start from scratch
Author.destroy_all
Tag.destroy_all
Micropost.destroy_all

author_names = ["Sara", "Ross", "Rebecca", "Susan", "Duncan", "Rob", "Freddie"]
author_occupation = ["Jedi Master", "Philanthropist", "(Ex)Terminator", "Wild Child", "Accountant", "Analrapist", "Midwife"]
author_age = [7, 36, 23, 77, 14, 59, 90]
author_image = ["http://i.imgur.com/bNv4oBZ.jpg", "http://i.imgur.com/c5lJ5vq.jpg", "http://i.imgur.com/VoZkGrc.jpg", "http://i.imgur.com/PgE3fZ6.jpg", "http://i.imgur.com/hziGj7h.jpg" ]

5.times do 
	Author.create(
		name: author_names.sample,
		occupation: author_occupation.sample,
		age: author_age.sample,
		image_url: author_image.sample
		)
end

tag_values = ["Inspirational", "sad", "happy", "Love", "DIY", "LOL", "upworthy", "relationships", "family",
"notworthit", "real estate", "cantstopwontstop", "Obama"]


tag_values.each do |x|
	Tag.create(
		value: x
		)
end

micropost_title = ["Be Realistic", "Take it Easy", "Experiment", "Have the Desire", "Say Thank You" ]
micropost_post =["Everyday life is bound to give you shocks. Be prepared to minimise impact and shrug it off. For instance, you may get too hassled everyday while driving to work or trying to park your car. When you accept the fact that certain things cannot be changed, you'll be more at ease with yourself and those around too.",
"Do not remain idle and brood. Take up positive activities with others or in isolation. Share a joke, narrate a pleasant incident, take part in sporting activities, go for a run in the evening after work and you'll find yourself bubbling with positive energy.",
"One way to becoming positive is to seek positive company as both positivity and negativity are infectious. If the people you spend most of your time with are grumpy or have a pessimistic standpoint, you'll find yourself mirroring the same emotions before a different set of people inadvertently. In order to inculcate positivity it is imperative that your friend circle is a positive, energetic, and a happy bunch. You'll find yourself carrying the same positivity everywhere you go.",
"Do not try to become a saint. Becoming a positive person does not mean you can never have any negative emotion or encounter any negative situation. It is the overall attitude that matters. Don't get bogged down by failure, and disappointed when your expectations are not met. Mentally, you should always be calculating a way out of difficult situations come what may.",
"Thank god, thank your parents, friends, and thank yourself for all the hard work you did, for everything you achieved. Says Abhilasha, Saying thank you frequently makes you humble, and a humble person is seldom cynical."]
micropost_date = ["10/4/2003", "5/5/2013", "2/28/1999", "12/8/2014", "7/19/2013", "4/30/2014", "11/11/2011", "4/14/2014", "3/27/2013"]
10.times do
	micropost = Micropost.new ({
		title: micropost_title.sample,
		post: micropost_post.sample,
		date_created: micropost_date.sample,
		author_id: Author.all.sample.id
		#microposts each have three tags
		})
	micropost.save!
	micropost.tags = Tag.all.sample(3)
end


