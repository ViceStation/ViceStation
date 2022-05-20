/obj/item/projectile/bullet/shotgun_slug
	name = "12 gauge shotgun slug"
	damage = 50
	sharpness = SHARP_POINTY
	wound_bonus = 0

/obj/item/projectile/bullet/shotgun_slug/executioner
	name = "12 gauge executioner slug" // admin only, can dismember limbs
	sharpness = SHARP_EDGED
	wound_bonus = 80

/obj/item/projectile/bullet/shotgun_slug/pulverizer
	name = "12 gauge pulverizer slug" // admin only, can crush bones
	sharpness = SHARP_NONE
	wound_bonus = 80

/obj/item/projectile/bullet/shotgun_beanbag
	name = "12 gauge beanbag slug"
	damage = 10
	stamina = 70
	wound_bonus = 20
	sharpness = SHARP_NONE
	embedding = null

/obj/item/projectile/bullet/incendiary/shotgun
	name = "12 gauge incendiary slug"
	damage = 20

/obj/item/projectile/bullet/incendiary/shotgun/dragonsbreath
	name = "12 gauge dragonsbreath pellet"
	damage = 5

/obj/item/projectile/bullet/shotgun_stunslug
	name = "12 gauge stunslug"
	damage = 5
	stamina = 30
	stutter = 5
	jitter = 20
	range = 7
	icon_state = "spark"
	color = "#FFFF00"
	var/tase_duration = 50

/obj/item/projectile/bullet/shotgun_stunslug/on_hit(atom/target, blocked = FALSE)
	. = ..()
	if(!ismob(target) || blocked >= 100) //Fully blocked by mob or collided with dense object - burst into sparks!
		do_sparks(1, TRUE, src)
	if(iscarbon(target))
		var/mob/living/carbon/C = target
		SEND_SIGNAL(C, COMSIG_ADD_MOOD_EVENT, "tased", /datum/mood_event/tased)
		SEND_SIGNAL(C, COMSIG_LIVING_MINOR_SHOCK)
		C.IgniteMob()
		if(C.dna && C.dna.check_mutation(HULK))
			C.say(pick(";RAAAAAAAARGH!", ";HNNNNNNNNNGGGGGGH!", ";GWAAAAAAAARRRHHH!", "NNNNNNNNGGGGGGGGHH!", ";AAAAAAARRRGH!" ), forced = "hulk")
		else if(tase_duration && (C.status_flags & CANKNOCKDOWN) && !HAS_TRAIT(C, TRAIT_STUNIMMUNE) && !HAS_TRAIT(C, TRAIT_TASED_RESISTANCE))
			C.electrocute_act(15, src, 1, SHOCK_NOSTUN)
			C.apply_status_effect(STATUS_EFFECT_TASED_WEAK, tase_duration)

/obj/item/projectile/bullet/shotgun_meteorslug
	name = "12 gauge meteorslug"
	icon = 'icons/obj/meteor.dmi'
	icon_state = "dust"
	damage = 20
	knockdown = 80
	hitsound = 'sound/effects/meteorimpact.ogg'

/obj/item/projectile/bullet/shotgun_meteorslug/on_hit(atom/target, blocked = FALSE)
	. = ..()
	if(ismovable(target))
		var/atom/movable/M = target
		var/atom/throw_target = get_edge_target_turf(M, get_dir(src, get_step_away(M, src)))
		M.safe_throw_at(throw_target, 3, 2)

/obj/item/projectile/bullet/shotgun_meteorslug/Initialize()
	. = ..()
	SpinAnimation()

/obj/item/projectile/bullet/shotgun_frag12
	name ="FRAG-12 slug"
	damage = 25
	knockdown = 50

/obj/item/projectile/bullet/shotgun_frag12/on_hit(atom/target, blocked = FALSE)
	..()
	explosion(target, -1, 0, 1)
	return BULLET_ACT_HIT

/obj/item/projectile/bullet/pellet
	var/tile_dropoff = 0.45
	var/tile_dropoff_s = 1.25

/obj/item/projectile/bullet/pellet/shotgun_buckshot
	name = "12 gauge buckshot pellet"
	damage = 7.5
	wound_bonus = 5
	bare_wound_bonus = 5
	wound_falloff_tile = -2.5 // low damage + additional dropoff will already curb wounding potential anything past point blank

/obj/item/projectile/bullet/pellet/shotgun_rubbershot
	name = "12 gauge rubbershot pellet"
	damage = 2
	stamina = 15
	sharpness = SHARP_NONE
	embedding = null

/obj/item/projectile/bullet/pellet/Range()
	..()
	if(damage > 0)
		damage -= tile_dropoff
	if(stamina > 0)
		stamina -= tile_dropoff_s
	if(damage < 0 && stamina < 0)
		qdel(src)

/obj/item/projectile/bullet/pellet/shotgun_improvised
	tile_dropoff = 0.35		//Come on it does 6 damage don't be like that.
	damage = 6
	wound_bonus = 0
	bare_wound_bonus = 7.5

/obj/item/projectile/bullet/pellet/shotgun_improvised/Initialize()
	. = ..()
	range = rand(1, 8)

/obj/item/projectile/bullet/pellet/shotgun_improvised/on_range()
	do_sparks(1, TRUE, src)
	..()

// Mech Scattershots

/obj/item/projectile/bullet/scattershot
	damage = 20

/obj/item/projectile/bullet/seed
	damage = 4
	stamina = 1

/obj/item/projectile/bullet/pellet/shotgun_incapacitate
	name = "12 gauge incapacitating pellet"
	damage = 1
	stamina = 6

//4 gauge ammo ahead

/obj/item/projectile/bullet/pellet/sharpenel25
	name = "4 gauge buckshot pellet"
	damage = 20
	wound_bonus = 10
	bare_wound_bonus = 10
	wound_falloff_tile = -5

/obj/item/projectile/bullet/pellet/barricade
	name = "4 gauge slug"
	damage = 50
	sharpness = SHARP_POINTY
	wound_bonus = 0
	bare_wound_bonus = 0
	armour_penetration = 40

/obj/item/projectile/bullet/pellet/wave
	name = "4 gauge beanbag"
	damage = 15
	stamina = 80
	wound_bonus = 30
	sharpness = SHARP_NONE
	embedding = null
