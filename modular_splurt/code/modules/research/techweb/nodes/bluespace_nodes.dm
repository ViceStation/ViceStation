//Jessie Added this
/datum/techweb_node/bluespace_power_reactor
	id = "bluespace_power_reactor"
	display_name = "Bluespace Power Reactor Technology"
	description = "Even more powerful.. POWA!!!"
	prereq_ids = list("adv_power", "adv_bluespace","bluespace_power")
	design_ids = list("bluespace_cell_reactor")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 5000)

/datum/design/board/implantradio
	name = "Radio Implants"
	desc = "Allows for the construction of Radio implants"
	id = "impant_radio"
	build_path = /obj/item/implant/radio
	category = list("Medical Designs")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE | DEPARTMENTAL_FLAG_MEDICAL | DEPARTMENTAL_FLAG_SECURITY
