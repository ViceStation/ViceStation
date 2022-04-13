//Adding a few cool race restricted items cause why does this not exist already?
/datum/uplink_item/race_restricted/tribal_claw
	name = "Old Tribal Scroll"
	desc = "We found this scroll in a abandoned lizard settlement of the Knoises clan. \
			It teaches you how to use your claws and tail to gain an advantage in combat, \
			don't buy this unless you are a lizard or plan to give it to one as only they can understand the ancient draconic words."
	item = /obj/item/book/granter/martial/tribal_claw
	cost = 18
	surplus = 0
	restricted_species = list("lizard")

/datum/uplink_item/race_restricted/catfight
	name = "Kōkō kanfūneko"
	desc = "With the rise of the cat-eared tyrant, we knew somewhere deep beneath the musk filled tombs hid a secret left untouched... Though this manga book has clearly been touched a lot- In fact a bit too much."
	cost = 20
	item = /obj/item/book/granter/martial/cat_fight
	restricted_species = list("felinid")

/datum/uplink_item/race_restricted/goofu
	name = "Slime Scroll"
	desc = "Xenobiology is the next step in our war effort, though during a tussle against one of Nanotrasens Military Stations, one of our men managed to find this little guy lying around. With due excitement we immediately brought it back and uncovered it's mysterious. It's a shame it only blorbles..."
	cost = 19
	item = /obj/item/book/granter/martial/goo_fu
	restricted_species = list("jelly", "slime", "slimeperson", "slimelumi", "stargazer")

/datum/uplink_item/race_restricted/possessedflyswatter
	name = "Possessed Flyswatter"
	desc = "With the many strange and bizarre artifacts that settle within the endless void of our reality this one has to be by far one of the strangest, found in an old Wizard Settlement and now reproduced for personal use! Oddly enough completely useless for actually swatting flies."
	cost = 9
	item = /obj/item/melee/flyswatter_syndie
	restricted_species = list("arachnid", "insect", "fly")

/datum/uplink_item/role_restricted/echainsaw
	name = "Energy Chainsaw"
	desc = "An incredibly deadly modified chainsaw with plasma-based energy blades instead of metal and a slick black-and-red finish. While it rips apart matter with extreme efficiency, it is heavy, large, and monstrously loud."
	item = /obj/item/chainsaw/energy
	cost = 10
	player_minimum = 10
	restricted_roles = list("Botanist", "Cook", "Bartender")

/datum/uplink_item/role_restricted/guidetoillusions
	name = "Guide to Illusions"
	desc = "Found this buried beneath an ancient temple that didn't exist, along with the soil around it... We can't seem to wrap our head around it."
	item = /obj/item/book/granter/spell/manifestmimesuit
	cost = 12
	restricted_roles = list("Mime")

/datum/uplink_item/role_restricted/carpsiereligionbungle
	name = "Carp'Sie Megacarp Kit"
	desc = "With the many Elder Gods being worshipped about, a select few people seem to think Space Carp are the true gods above all, whatever the case may be this box contains three mega carp monkey cubes along with a full carp outfit. We are not responsible for any loss of limbs, flesh or life."
	item = /obj/item/storage/box/syndie_kit/carpsiereligionbungle
	cost = 15
	restricted_roles = list("Chaplain", "Cook")
