/obj/structure/closet/secure_closet/captains/PopulateContents()
    . = ..()
    new /obj/item/storage/secure/briefcase/cap_e45_pack(src)

/obj/structure/closet/secure_closet/warden/PopulateContents()
	. = ..()
	new /obj/item/clothing/under/rank/security/warden/peacekeeper(src)
	new /obj/item/clothing/head/warden/peacekeeper(src)
	new /obj/item/clothing/head/beret/sec/peacekeeper/warden(src)
	new /obj/item/clothing/suit/armor/vest/warden/peacekeeper(src)
	new /obj/item/clothing/head/helmet/sec/warden(src)

/obj/item/paper/fluff/letter/cap45 //Little passive agressive? Maybe. Adememd, this is now unused.
	name = "To the future Captain:"
	info = "Due to miuse of the 45 Caliber side arm known as the Mk. 58 Enforcer, the Captain will no longer be supplied with it. In order to obtain it, you must requesition it through cargo. Please and thank you - Central Command Logistics"
