/obj/structure/blob/resource
	name = "resource blob"
	icon = 'icons/mob/blob.dmi'
	icon_state = "blob_resource"
	desc = "A thin spire of slightly swaying tendrils."
	max_integrity = 60
	point_return = 15
	armor = list(MELEE = 10, BULLET = 10, LASER = 0, ENERGY = 0, BOMB = 15, BIO = 0, RAD = 0, FIRE = 90, ACID = 90)
	var/resource_delay = 0

/obj/structure/blob/resource/scannerreport()
	return "Gradually supplies the blob with resources, increasing the rate of expansion."

/obj/structure/blob/resource/creation_action()
	if(overmind)
		overmind.resource_blobs += src

/obj/structure/blob/resource/Destroy()
	if(overmind)
		overmind.resource_blobs -= src
	return ..()

/obj/structure/blob/resource/Be_Pulsed()
	. = ..()
	if(resource_delay > world.time)
		return
	flick("blob_resource_glow", src)
	if(overmind)
		overmind.add_points(2)
		resource_delay = world.time + 40 + overmind.resource_blobs.len * 2.5 //4 seconds plus a quarter second for each resource blob the overmind has
	else
		resource_delay = world.time + 40
