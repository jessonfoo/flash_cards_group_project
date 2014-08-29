

gre_deck = Deck.create(:deck_name => "GRE Words")

words = [
Card.create(term:spartan ,definition:"showing indifference to comfort or luxury")
Card.create(term:"ribald" ,definition:"referring to sexual matters in an amusingly rude way")
Card.create(term:"mercurial" ,definition: "subject to sudden or unpredictable changes of mood or mind")
Card.create(term:"pedant" ,definition:"a person who is excessively concerned with minor details and rules")
Card.create(term: "ancillary" ,definition:"providing necessary support to the primary activities or operation of an organization, industry, institution or system")
Card.create(term: "propitious" ,definition:"indicating a good chance of success")
Card.create(term: "redound" ,definition: "contribute greatly to -or- come back upon, rebound on")
Card.create(term: "vituperation" ,definition:n: "abuse, invective, scolding")
Card.create(term: "fealty" ,definition:"sworn loyalty to a lord")
Card.create(term: "ersatz" ,definition:"made or used as a substitute for something else")
Card.create(term: "clement",definition:"adj: mild, gentle, benign")
Card.create(term: "threnody",definition:"a lament, a song or hymn of mourning composed or performed as a memorial to a dead person")
Card.create(term: "laconic" ,definition:"using very few words (of a person, speech or style of writing)")
Card.create(term: "decamp" ,definition:"depart suddenly, relocate, abscond")
Card.create(term: "iniquity" ,definition:"immoral or grossly unfair behavior")
Card.create(term: "ardor" ,definition:"enthusiasm or passion")
Card.create(term: "kismet" ,definition:"destiny, fate")
Card.create(term: "euphonious" ,definition:"pleasing to the ear")
]

gre_deck.cards << words


