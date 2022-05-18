/obj/item/gun/ballistic/automatic/sniper_rifle/sleepy
	desc = "A second-hand .50 cal sniper rifle. This one only seems to be capable of firing soporific rounds."
	mag_type = /obj/item/ammo_box/magazine/sniper_rounds/soporific

/obj/item/gun/ballistic/automatic/wt550/wtrubber
	name = "security semi-auto PDW (rubber)"
	desc = "An outdated personal defence weapon. Uses 4.6x30mm rounds and is designated the WT-550 Semi-Automatic SMG. This one seems to only fire rubber bullets."
	mag_type = /obj/item/ammo_box/magazine/wt550m9/wtrubber

// PLEASE BE CAREFUL WITH THIS!!! -Radar
/obj/item/gun/ballistic/automatic/m2a1
	name = "\improper M2A1 HMG (.50)"
	desc = "A favorite by spaceship door gunners. This one has been ripped off it's mount."
	icon_state = "m2a1closed100"
	icon = 'modular_splurt/icons/obj/guns/projectile.dmi'
	item_state = "m2a1closedmag"
	lefthand_file = 'modular_splurt/icons/mob/inhands/weapons/guns_lefthand.dmi'
	righthand_file = 'modular_splurt/icons/mob/inhands/weapons/guns_righthand.dmi'
	fire_sound = "sound/weapons/gunshotshotgunshot.ogg"
	w_class = WEIGHT_CLASS_HUGE
	slot_flags = 0
	mag_type = /obj/item/ammo_box/magazine/m127x99mmbelt
	weapon_weight = WEAPON_HEAVY
	var/cover_open = FALSE
	can_suppress = FALSE
	burst_size = 5
	burst_shot_delay = 5
	spread = 10 //You are firing a .50 cal machine gun from a staning position
	pin = /obj/item/firing_pin
	automatic_burst_overlay = FALSE

/obj/item/gun/ballistic/automatic/m2a1/restricted //for if Central command wants to have some fun
	pin = /obj/item/firing_pin/implant/mindshield

/obj/item/gun/ballistic/automatic/m2a1/examine(mob/user)
	. = ..()
	if(cover_open && magazine)
		. += "<span class='notice'>It seems like you could use an <b>empty hand</b> to remove the magazine.</span>"

/obj/item/gun/ballistic/automatic/m2a1/attack_self(mob/user)
	cover_open = !cover_open
	to_chat(user, "<span class='notice'>You [cover_open ? "open" : "close"] [src]'s cover.</span>")
	if(cover_open)
		playsound(user, 'sound/weapons/sawopen.ogg', 60, 1)
	else
		playsound(user, 'sound/weapons/sawclose.ogg', 60, 1)
	update_icon()

/obj/item/gun/ballistic/automatic/m2a1/update_icon_state()
	icon_state = "m2a1[cover_open ? "open" : "closed"][magazine ? CEILING(get_ammo(0)/25, 1)*25 : "-empty"]"
	item_state = "m2a1[cover_open ? "openmag" : "closedmag"]"

/obj/item/gun/ballistic/automatic/m2a1/afterattack(atom/target as mob|obj|turf, mob/living/user as mob|obj, flag, params)
	if(cover_open)
		to_chat(user, "<span class='warning'>[src]'s cover is open! Close it before firing!</span>")
	else
		. = ..()
		update_icon()

/obj/item/gun/ballistic/automatic/m2a1/on_attack_hand(mob/user, act_intent = user.a_intent, unarmed_attack_flags)
	if(loc != user)
		..()
		return	//let them pick it up
	if(!cover_open || (cover_open && !magazine))
		..()
	else if(cover_open && magazine)
		//drop the mag
		magazine.update_icon()
		magazine.forceMove(drop_location())
		user.put_in_hands(magazine)
		magazine = null
		update_icon()
		to_chat(user, "<span class='notice'>You remove the magazine from [src].</span>")
		playsound(user, 'sound/weapons/magout.ogg', 60, 1)

/obj/item/gun/ballistic/automatic/m2a1/attackby(obj/item/A, mob/user, params)
	if(!cover_open && istype(A, mag_type))
		to_chat(user, "<span class='warning'>[src]'s cover is closed! You can't insert a new mag.</span>")
		return
	..()


/obj/item/gun/ballistic/automatic/m1garand //PING!
	name = "Old Mars Service Rifle (.308)"
	desc = "A Mars copy of the greatest battle implement ever devised."
	icon = 'modular_splurt/icons/obj/guns/projectile.dmi'
	icon_state = "m1garand"
	item_state = "moistnugget"
	fire_sound = 'sound/weapons/rifleshot.ogg'
	weapon_weight = WEAPON_HEAVY
	mag_type = /obj/item/ammo_box/magazine/garand
	fire_delay = 8
	burst_size = 1
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BACK
	automatic_burst_overlay = FALSE
	var/auto_eject = 1
	var/auto_eject_sound = 'modular_splurt/sound/weapons/garand_ping.ogg'

/obj/item/gun/ballistic/automatic/m1garand/update_icon()
	..()
	icon_state = "[initial(icon_state)]"

/obj/item/gun/ballistic/automatic/m1garand/afterattack(atom/target, mob/living/user) //The code that makes the ping
	..()
	if(auto_eject && magazine && magazine.stored_ammo && !magazine.stored_ammo.len && !chambered)
		magazine.dropped()
		user.visible_message(
			"<span class='warning'>[magazine] flies out and clatters on the floor!</span>",
			to_chat("[magazine] flies out and clatters on the floor!")
		)
		if(auto_eject_sound)
			playsound(user, auto_eject_sound, 40, 1)
		magazine.forceMove(get_turf(src.loc))
		magazine.update_icon()
		magazine = null
		update_icon()

/obj/item/gun/ballistic/automatic/m1garand/nomag
	spawnwithmagazine = FALSE

/obj/item/gun/ballistic/automatic/fal //Insert Ahoy qoute here
	name = "Old FTU Rifle (.308)"
	desc = "The right arm of the Free Trade Union "
	icon = 'modular_splurt/icons/obj/guns/projectile.dmi'
	icon_state = "fnfal"
	item_state = "moistnugget"
	fire_sound = 'sound/weapons/rifleshot.ogg'
	weapon_weight = WEAPON_HEAVY
	mag_type = /obj/item/ammo_box/magazine/fal
	fire_delay = 3
	burst_size = 3
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BACK
	automatic_burst_overlay = FALSE
	spread = 8 //You are shooting a full power catraige from a light automatic rifle, what do you expect?

/obj/item/gun/ballistic/automatic/fal/nomag
	spawnwithmagazine = FALSE

/obj/item/gun/ballistic/automatic/smg22 //SWARM OF FUCKING BEES!
	name = "Old FTU SMG (.22)"
	desc = "The left arm of the Free Trade Union "
	icon = 'modular_splurt/icons/obj/guns/projectile.dmi'
	icon_state = "smg22"
	item_state = "shotgun"
	fire_sound = 'sound/weapons/rifleshot.ogg'
	weapon_weight = WEAPON_MEDIUM
	mag_type = /obj/item/ammo_box/magazine/smg22 //This magazine may never be used, who knows
	fire_delay = 3
	burst_size = 5
	w_class = WEIGHT_CLASS_NORMAL
	slot_flags = ITEM_SLOT_BACK
	automatic_burst_overlay = FALSE
	spread = 5 //For balacing

/obj/item/gun/ballistic/automatic/smg22/nomag
	spawnwithmagazine = FALSE

/obj/item/gun/ballistic/automatic/klobb
	name = "\improper Klobb Machine Pistol (.32 Auto)"
	desc = "A lightweight, burst-fire machine pistol based on the Vz. 61 'Skorpian' from the Sol system. Uses .32 Auto rounds."
	icon_state = "klobb"
	icon = 'modular_splurt/icons/obj/guns/projectile.dmi'
	mag_type = /obj/item/ammo_box/magazine/klobb
	w_class = WEIGHT_CLASS_SMALL
	weapon_weight = WEAPON_LIGHT
	fire_delay = 3
	burst_size = 2
	automatic_burst_overlay = FALSE
	spread = 3 //For balacing

/obj/item/gun/ballistic/automatic/klobb/update_icon_state()
	icon_state = "[initial(icon_state)][suppressed ? "-suppressed" : ""][magazine ? "" : "-e"]"
