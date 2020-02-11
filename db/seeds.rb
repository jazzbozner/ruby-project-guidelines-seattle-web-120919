User.create(name: "Jazz", username: "Dj-jazzyjeff", password: "456")
User.create(name: "Zian", username: "Lt.Din'ah", password: "123")

Website.create(title: "Google", url: "http://www.google.com")
Website.create(title: "Youtube", url: "http://www.youtube.com")
Website.create(title: "Twitch", url: "http://www.twitch.tv")
Website.create(title: "Tinder", url: "http://www.tinder.com")
Website.create(title: "Farmers Only", url: "http://www.farmersonly.com")

10.time do
  Account.create(user_id: User.all.sample.id, website_id: Website.all.sample.id)
end
