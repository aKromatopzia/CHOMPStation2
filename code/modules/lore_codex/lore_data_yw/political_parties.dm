/datum/lore/codex/category/political_factions
	name = "Political Factions"
	data = span_italics("For some weird reason, this section is blank. This looks like a publishing error.")
	/*data = "Those wishing to immigrate to somewhere in Borealis, or otherwise plan to stay for a long time should get to know human politics.  \
	There are presently three major political parties that exist throughout USG space, being the Icarus Front, the Shadow Coalition, and \
	the Sol Economic Organization, and several smaller ones which tend to align themselves among one of the major parties.  In the Borealis system, the \
	Icarus Front's influence is much less than somewhere closer to Sol, and the other two parties being more popular."*/ // ToDo: A lot.
	children = list(
		/datum/lore/codex/page/blank
		)

/datum/lore/codex/page/blank/add_content()
	name = "Blank Page"
	keywords += list("Blank")
	data = span_italics("For some weird reason, this section is blank. This looks like a publishing error.") // ToDo: A lot.
