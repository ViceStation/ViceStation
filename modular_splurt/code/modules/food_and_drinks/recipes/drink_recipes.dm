//SPLURT drinks
/* It's causing recipe conflicts for some reason, no idea how to fix
/datum/chemical_reaction/panty_dropper
	name = "Liquid Panty Dropper"
	id = /datum/reagent/consumable/ethanol/panty_dropper
	results = list(/datum/reagent/consumable/ethanol/panty_dropper = 8, /datum/reagent/drug/anaphrodisiacplus = 2)
	required_reagents = list(/datum/reagent/consumable/ethanol/vodka = 1, /datum/reagent/consumable/ethanol/gin = 1, /datum/reagent/consumable/ethanol/creme_de_coconut = 1, /datum/reagent/consumable/ethanol/rum = 1, /datum/reagent/consumable/ethanol/triple_sec = 1, /datum/reagent/consumable/pineapplejuice = 1, /datum/reagent/consumable/berryjuice = 1, /datum/reagent/consumable/orangejuice = 1)
	mix_message = "A very twisted combination begins to bubble..."
*/

/datum/chemical_reaction/lean
	name = "Lean"
	id = /datum/reagent/consumable/ethanol/lean
	results = list(/datum/reagent/consumable/ethanol/lean = 3)
	required_reagents = list(/datum/reagent/medicine/salbutamol = 1, /datum/reagent/consumable/pwr_game = 1, /datum/reagent/consumable/sugar = 1) // Salbutamol for the cough syrup. Pwr Game for the Sprite, sugar for the candies.
	mix_message = "The mixture turns a deep purple colour."

/datum/chemical_reaction/wockyslush
	name = "Wocky Slush"
	id = /datum/reagent/consumable/wockyslush
	results = list(/datum/reagent/consumable/wockyslush = 5)
	required_reagents = list(/datum/reagent/toxin/fentanyl = 1, /datum/reagent/consumable/ice = 1, /datum/reagent/consumable/lemon_lime = 1)
	mix_message = "That thang bleedin’ P!"

/datum/chemical_reaction/orange_creamsicle
    name = "Orange Creamsical"
    id = /datum/reagent/consumable/orange_creamsicle
    results = list(/datum/reagent/consumable/orange_creamsicle = 4)
    required_reagents = list(/datum/reagent/consumable/vanilla = 1, /datum/reagent/consumable/milk = 1, /datum/reagent/consumable/ice = 1, /datum/reagent/consumable/orangejuice = 1)
