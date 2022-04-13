/obj/item/storage/box/syndie_kit/origami_bundle
	name = "origami kit"
	desc = "A box full of a number of rather masterfully engineered paper planes and a manual on \"The Art of Origami\"."

/obj/item/storage/box/syndie_kit/origami_bundle/PopulateContents()
	new /obj/item/book/granter/action/origami(src)
	for(var/i in 1 to 5)
		new /obj/item/paper(src)
	var/obj/item/paper/construction/redpaper = new /obj/item/paper/construction(src)
	redpaper.color = "#FF0000" //Red paper, for an extra special calling card flair
