(define (domain peoplebot)
(:requirements :strips :typing )
(:types message person location)

(:predicates	(robotat ?x - location)
		(personat ?x - person ?y - location)
		(messagesender ?x - person ?y - message)
		(hasmessage ?x - message)
		(hasdeliveredmessage ?x - message ?y - person)
        (hasmessagewaiting ?x - message ?y - person)
		(hasvisited ?x - location)
)



(:action move
	:parameters (?loca - location ?locb - location)
	:precondition (and (robotat ?loca))
	:effect (and (robotat ?locb) (not(robotat ?loca)) (hasvisited ?locb))
)
	
(:action getmessage
	:parameters (?msg - message ?sender - person ?loc - location)
	:precondition	(and (robotat ?loc) (personat ?sender ?loc) (messagesender ?sender ?msg))
	:effect (hasmessage ?msg)
	)

(:action delivermessage
	:parameters (?msg - message ?person - person ?loc - location)
	:precondition	(and (hasmessage ?msg) (personat ?person ?loc) (robotat ?loc))
	:effect	(and (not (hasmessage ?msg)) (hasdeliveredmessage ?msg ?person))
)
)
