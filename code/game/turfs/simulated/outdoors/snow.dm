/turf/simulated/floor/outdoors/snow
	name = "snow"
	icon_state = "snow"
	edge_blending_priority = 6
	movement_cost = 2
	initial_flooring = /decl/flooring/snow
	/*turf_layers = list( CHOMP Removal Begin
		/turf/simulated/floor/outdoors/rocks,
		/turf/simulated/floor/outdoors/dirt
		) CHOMP Removal End*/
	var/list/crossed_dirs = list()


/turf/simulated/floor/outdoors/snow/Entered(atom/A)
	if(isliving(A))
		var/mob/living/L = A
		if(L.hovering || L.flying) // Flying things shouldn't make footprints.
			if(L.flying)
				L.adjust_nutrition(-0.5)
			return ..()
		var/mdir = "[A.dir]"
		crossed_dirs[mdir] = 1
		update_icon()
	. = ..()

/turf/simulated/floor/outdoors/snow/update_icon()
	..()
	for(var/d in crossed_dirs)
		add_overlay(image(icon = 'icons/turf/outdoors.dmi', icon_state = "snow_footprints", dir = text2num(d)))

/turf/simulated/floor/outdoors/snow/attackby(var/obj/item/W, var/mob/user)
	if(istype(W, /obj/item/shovel))
		to_chat(user, span_notice("You begin to remove \the [src] with your [W]."))
		if(do_after(user, 4 SECONDS * W.toolspeed))
			to_chat(user, span_notice("\The [src] has been dug up, and now lies in a pile nearby."))
			new /obj/item/stack/material/snow(src, 10)
			demote()
		else
			to_chat(user, span_notice("You decide to not finish removing \the [src]."))
	else
		..()

/turf/simulated/floor/outdoors/snow/attack_hand(mob/user as mob)
	visible_message("[user] starts scooping up some snow.", "You start scooping up some snow.")
	if(do_after(user, 1 SECOND))
		var/obj/S = new /obj/item/stack/material/snow(user.loc)
		user.put_in_hands(S)
		visible_message("[user] scoops up a pile of snow.", "You scoop up a pile of snow.")
	return

/turf/simulated/floor/outdoors/ice
	name = "ice"
	icon_state = "ice"
	desc = "Looks slippery."
	edge_blending_priority = 0
	can_be_plated = FALSE

/turf/simulated/floor/outdoors/ice/dark
	name = "black ice"
	icon_state = "ice_dark"
	desc = "An uneven surface of dark rocks glazed over by solid ice. Looks slippey, maybe even painful"

/turf/simulated/floor/outdoors/ice/dark_smooth
	name = "smooth black ice"
	icon_state = "ice_dark_smooth"
	desc = "Dark rock that has been smoothened to be perfectly even. It's coated in a layer of slippey ice"

/turf/simulated/floor/outdoors/ice/Entered(var/mob/living/M)
	sleep(1 * world.tick_lag)
	if(isliving(M))
		if(M.stunned == 0)
			to_chat(M, span_warning("You slide across the ice!"))
		M.SetStunned(1)
		step(M,M.dir)

// Ice that is used for, say, areas floating on water or similar.
/turf/simulated/floor/outdoors/shelfice
	name = "ice"
	icon_state = "ice"
	desc = "Looks slippery."
	movement_cost = 4
	edge_blending_priority = 0

// Extra cold variants

/turf/simulated/floor/outdoors/snow/v5
	temperature = 150
	oxygen = 8
	nitrogen = 17
	carbon_dioxide = 75

/turf/simulated/floor/outdoors/ice/v5
	temperature = 150
	oxygen = 8
	nitrogen = 17
	carbon_dioxide = 75
