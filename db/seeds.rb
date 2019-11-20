User.create(username: "Cara", email: "ephemere@protonmail.com", password:"11111111")
User.create(username: "Serina", email: "serina@cloudburst.com", password:"testtest123")
User.create(username: "Steve", email: "steve@cloudburst.com", password:"testtest123")
User.create(username: "Newman", email: "neewman1234@whatever.com", password:"testtest123")
User.create(username: "Patrick", email: "patrick234@whatever.com", password:"testtest123")
User.create(username: "Russel", email: "russel1234@whatever.com", password:"testtest123")
User.create(username: "Collette", email: "collette@cloudburst.com", password:"testtest123")

Beer.create(name: "Talk And Not Talk", description: "This amazing relationship between Idaho 7, Mosaic, Citra, & Centennial and it’s really very physical. They still push each other’s buttons. And they all have a lot in common - tropical notes, citrus notes, piney notes, talking, not talking. These hops could not talk and talk for forever and they’d still find things to not talk about.")
Beer.create(name: "Hi Bill Hiii", description: "Hey Bill! Hi! Look what we did over here! This beer! It’s like yours! But different! We should hang out! You never call! ...")
Beer.create(name: "Party of Five", description: "It’s a liquid story about a family of 5 hops that lose their parents to spider mites and have to help each other out from juicy, citrusy flavors to watermelon & peach fuzz aromas. Every sip is passion, conflict, plot twist, coma(!?), resolution, and an off-site family vacation finale.")
Beer.create(name: "Show Your Work", description: "It’s all written down right there. No, we didn’t skip a step. Yes, we filled in every line. Trust us. This is how we got to the IPA! Ok fine, let’s compare. Yeah, um....somebody should probably double check. ")
Beer.create(name: "To Be Frank", description: "IPA with Wet Zappa from @cls_farms . Frankly, we aren’t familiar with Zappa’s music catalogue nor were we familiar with this new hop variety. But guess what, it’s crazy awesome - lots of pineapple, key lime, papaya & spice. Mmm Mr. Green Genes!")
Beer.create(name: "Chasing Waterfalls", description: "Stick to the rivers and lakes that we’re used to?! Pshhh. We’re gonna have it our way or nothing it all, because we’re moving too fast because we HAVE to. THESE HOPS ARE WET!!")
Beer.create(name: "Yakima Caviar", description: "Yakima Caviar is an IPA with Wet Citra from our friends @loftusranches - these little green pearls of awesomeness exude luxurious notes of yellow peach flesh, tangerines, & mango. Diamonds are forever, but wet hops are for NOW - treat yourself.")
Beer.create(name: "Green Means Go", description: "DIPA brewed with 24#/bbl of WET CENTENNIAL from our friends @cls_farms Rumor has it this year’s Centennial Crop is 🔥🔥🔥 and we can confirm with big notes of blackberry, lemon, pine & melon, a full body and leafy finish")
Beer.create(name: "Pumpkin Beer Still Sucks", description: "Pumpkin Beer Still Sucks is, um, a pumpkin beer. And yes, it’s spiced. Because you know what? Sometimes we actually WANT to drink a delicious, basic AF pumpkin spice beer but 1. that style is dying and 2. most ones around town are brewed by a FAKE “craft” brewery that sold out to @abinbev - so all the charm (& independence) is gone. And frankly, that sucks. Which is why every year, you can count on us to offer you a small, local, independent pumpkin beer option with a snarky name. That’s a Cloudburst promise.")

Opinion.create(user_id: 1, beer_id: 1, user_rating: 5, tasting_notes: "Drank way too much of this. Light and refreshing. Very good Session beer.")
Opinion.create(user_id: 2, beer_id: 1, user_rating: 4, tasting_notes: "Very good Session beer. Refreshing in the Taproom")
Opinion.create(user_id: 2, beer_id: 4, user_rating: 7, tasting_notes: "Wet Citra Deliciousness")
Opinion.create(user_id: 1, beer_id: 9, user_rating: 2, tasting_notes: "I do not like the pumpking beeer")
Opinion.create(user_id: 5, beer_id: 2, user_rating: 3, tasting_notes: "Tried Russel's - light and refreshing. Still not a damn dark beer.")
Opinion.create(user_id: 5, beer_id: 8, user_rating: 3, tasting_notes: "Tried Russel's - Refreshing. He got drunk quickly and started talking nonsense on this one.")
Opinion.create(user_id: 5, beer_id: 9, user_rating: 2, tasting_notes: "Only dark beer on tap godammnit!")
Opinion.create(user_id: 6, beer_id: 3, user_rating: 5, tasting_notes: "Light and refreshing and Fruity...kinda like patrick.")
Opinion.create(user_id: 6, beer_id: 9, user_rating: 1, tasting_notes: "Patrick made me drink this on a dare. I'm not a dark beer guy.")
Opinion.create(user_id: 4, beer_id: 6, user_rating: 5, tasting_notes: "Mmmmmmm wet hops. Why can't this season last all year?")
Opinion.create(user_id: 4, beer_id: 8, user_rating: 4, tasting_notes: "Light and refreshing.")
