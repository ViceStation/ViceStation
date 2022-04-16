/obj/item/clothing/suit/space/hardsuit/sundowner
	name = "Red Sun Armor"
	desc = "I'M FUCKING INVINCIBLE!!!"
	alt_desc = "I'M FUCKING INVINCIBLE!!!"
	icon = 'modular_nostra/icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'modular_nostra/icons/mob/clothing/suit.dmi'
	anthro_mob_worn_overlay = 'modular_nostra/icons/mob/clothing/suit_digi.dmi'
	icon_state = "sundowner_suit"
	item_state = "sundowner_suit"
	hardsuit_type = "syndi"
	slowdown = 1.3
	w_class = WEIGHT_CLASS_HUGE
	armor = list("melee" = 30, "bullet" = 65, "laser" = 50, "energy" = 45, "bomb" = 95, "bio" = 0, "rad" = 10, "fire" = 50, "acid" = 50, "wound" = 20)
	allowed = list(/obj/item/claymore/bloodlust, /obj/item/tank/internals)
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/sundowner
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS					//Uncomment to enable firesuit protection
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	//visor_flags = STOPSPRESSUREDAMAGE

	///obj/item/clothing/head/helmet/space/hardsuit/invismime/update_icon_state()
	//icon_state = "beretblack"

/obj/effect/proc_holder/spell/targeted/conjure_item/fuckinginvincible
	name = "Deploy Shield"
	desc = "Allows the ability to deploy/retract your shield. Requires two-hands."
	invocation_type = "none"
	//invocation = null
	include_user = 1
	range = -1
	clothes_req = NONE
	item_type = /obj/item/shield/redshield
	school = "conjuration"
	charge_max = 100
	cooldown_min = 15
	action_icon = 'modular_nostra/icons/obj/actions_minor_antag.dmi'
	action_icon_state = "sundowner_deploy"
	delete_old = TRUE

/obj/effect/proc_holder/spell/targeted/conjure_item/fuckinginvincible/cast(list/targets, mob/user = usr)
	if (delete_old && item && !QDELETED(item))
		QDEL_NULL(item)
		playsound(loc, 'modular_nostra/sound/weapons/shieldretract.ogg', 30)
		//invocation = null
	else
		for(var/mob/living/carbon/C in targets)
			if(!C.get_active_held_item() && !C.get_inactive_held_item())
				//invocation = "I'M FUCKING INVINCIBLE!!!!"
				C.put_in_hands(make_item(), TRUE)
				playsound(loc, 'modular_nostra/sound/weapons/shieldeploy.ogg', 30)
			else
				to_chat(C, "<span class = 'userdanger'>You must have both hands empty!</span>")
				//invocation = null
				return

/obj/effect/proc_holder/spell/targeted/conjure_item/fuckinginvincible/Destroy()
	if(item)
		qdel(item)
	return ..()

/obj/effect/proc_holder/spell/targeted/conjure_item/fuckinginvincible/make_item()
	item = new item_type
	return item

/obj/item/clothing/suit/space/hardsuit/sundowner/equipped(mob/user, slot)
	. = ..()
	if(ishuman(user) && slot == ITEM_SLOT_OCLOTHING)
		//var/mob/living/carbon/human/H = user
		user.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/conjure_item/fuckinginvincible(src))

/obj/item/clothing/suit/space/hardsuit/sundowner/dropped(mob/user)
	. = ..()
	if(!ishuman(user))
		return
	var/mob/living/carbon/human/H = user
	if(H.get_item_by_slot(ITEM_SLOT_OCLOTHING) == src)
		user.mind.RemoveSpell(/obj/effect/proc_holder/spell/targeted/conjure_item/fuckinginvincible)

/obj/item/clothing/head/helmet/space/hardsuit/sundowner
	name = "Red Sun Helmet"
	desc = "Red Sun, Red Sun over PARADISE!"
	icon = 'modular_nostra/icons/obj/clothing/hats.dmi'
	mob_overlay_icon = 'modular_nostra/icons/mob/clothing/head.dmi'
	anthro_mob_worn_overlay = 'modular_nostra/icons/mob/clothing/head_muzzled.dmi'
	icon_state = "sundowner_suit"
	item_state = "sundowner_suit"
	hardsuit_type = "syndi"
	armor = list("melee" = 25, "bullet" = 50, "laser" = 45, "energy" = 40, "bomb" = 95, "bio" = 0, "rad" = 5, "fire" = 50, "acid" = 50, "wound" = 20)
	heat_protection = HEAD
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT

/obj/item/clothing/head/helmet/space/hardsuit/sundowner/update_icon_state()
	icon_state = "sundowner_suit"


/obj/item/clothing/suit/armor/minuano
	name = "Minuano"
	desc = "Mind if I cut in?"
	icon = 'modular_nostra/icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'modular_nostra/icons/mob/clothing/suit.dmi'
	anthro_mob_worn_overlay = 'modular_nostra/icons/mob/clothing/suit_digi.dmi'
	icon_state = "jetstream_sam"
	item_state = "jetstream_sam"
	body_parts_covered = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	cold_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	heat_protection = CHEST|GROIN|LEGS|FEET|ARMS|HANDS
	armor = list(MELEE = 70, BULLET = 25, LASER = 25, ENERGY = 25, BOMB = 0, BIO = 0, RAD = 0, FIRE = 100, ACID = 100, WOUND = 45)
	blocks_shove_knockdown = TRUE
	strip_delay = 80
	equip_delay_other = 60
	slowdown = 0

/obj/item/clothing/suit/armor/minuano/equipped(mob/user, slot)
	. = ..()
	if(slot == ITEM_SLOT_OCLOTHING)
		slowdown = -0.5

/obj/item/clothing/suit/armor/minuano/dropped(mob/user)
	. = ..()
	slowdown = 0
