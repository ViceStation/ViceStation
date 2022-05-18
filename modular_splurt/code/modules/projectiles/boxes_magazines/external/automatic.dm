/obj/item/ammo_box/magazine/m127x99mmbelt
	name = "ammo belt (.50)"
	icon_state = "762belt"
	icon = 'modular_splurt/icons/obj/ammo.dmi'
	ammo_type = /obj/item/ammo_casing/p50
	caliber = ".50"
	max_ammo = 100

/obj/item/ammo_box/magazine/m127x99mmbelt/update_icon()
	..()
	icon_state = "762belt-[round(ammo_count(),25)]"


/obj/item/ammo_box/magazine/smgm45
	ammo_type = /obj/item/ammo_casing/c45/lethal

/obj/item/ammo_box/magazine/garand
	name = "Enbloc clip (.308)"
	desc = "An enbloc clip for a Mars Service Rifle."
	icon = 'modular_splurt/icons/obj/ammo.dmi'
	icon_state = "enbloc"
	ammo_type = /obj/item/ammo_casing/a308
	caliber = ".308"
	max_ammo = 8

/obj/item/ammo_box/magazine/garand/update_icon()
	..()
	icon_state = "enbloc-[round(ammo_count())]"

/obj/item/ammo_box/magazine/garand/rubber
	name = "Enbloc clip (.308 Rubber)"
	ammo_type = /obj/item/ammo_casing/a308/rubber

/obj/item/ammo_box/magazine/garand/sleepy
	name = "Enbloc clip (.308 Soporific)"
	ammo_type = /obj/item/ammo_casing/a308/sleepy

/obj/item/ammo_box/magazine/fal
	name = "FTU 20 round magazine (.308)"
	desc = "A magazine for a FTU Rifle."
	icon = 'modular_splurt/icons/obj/ammo.dmi'
	icon_state = "r20"
	ammo_type = /obj/item/ammo_casing/a308
	caliber = ".308"
	max_ammo = 20

/obj/item/ammo_box/magazine/fal/update_icon()
	..()
	icon_state = "r20-[ammo_count() ? "20" : "0"]"

/obj/item/ammo_box/magazine/fal/rubber
	name = "FTU 20 round magazine (.308 Rubber)"
	ammo_type = /obj/item/ammo_casing/a308/rubber

/obj/item/ammo_box/magazine/fal/r10
	name = "FTU 10 round magazine (.308)"
	icon_state = "r10"
	max_ammo = 10

/obj/item/ammo_box/magazine/fal/r10/update_icon()
	..()
	icon_state = "r10-[ammo_count() ? "10" : "0"]"

/obj/item/ammo_box/magazine/fal/r10/rubber
	name = "FTU 10 round magazine (.308 rubber)"
	ammo_type = /obj/item/ammo_casing/a308/rubber

/obj/item/ammo_box/magazine/fal/r10/sleepy
	name = "FTU 10 round magazine (.308 Soporific)"
	ammo_type = /obj/item/ammo_casing/a308/sleepy

/obj/item/ammo_box/magazine/smg22
	name = "FTU SMG magazine (.22)"
	desc = "A magazine for a FTU SMG."
	icon = 'modular_splurt/icons/obj/ammo.dmi'
	icon_state = "smg22"
	ammo_type = /obj/item/ammo_casing/c22lr
	caliber = ".22"
	max_ammo = 180 //YEs really

/obj/item/ammo_box/magazine/smg22/update_icon()
	..()
	icon_state = "smg22-[ammo_count() ? "180" : "0"]"

/obj/item/ammo_box/magazine/smg22/rubber
	name = "FTU SMG magazine (.22 Rubber)"
	ammo_type = /obj/item/ammo_casing/c22lr/rubber

/obj/item/ammo_box/magazine/klobb
	name = "Klobb magazine (.32)"
	desc = "A magazine for a Klobb Machine pistol."
	icon_state = "klobb"
	ammo_type = /obj/item/ammo_casing/c32
	caliber = ".32"
	max_ammo = 20
