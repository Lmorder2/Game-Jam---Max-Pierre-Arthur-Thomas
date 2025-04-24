extends Node

@export var mobs: Array[Node] = []

func _ready():
	Events.room_entered.connect(lock_rooms)
	unlock_rooms()

	for mob in mobs:
		if mob.has_signal("death"):
			mob.connect("death", Callable(self, "_on_mob_death"))

func lock_rooms(emitter):
	if(mobs.size() > 0):
		for child in get_children():
			for grandchild in child.get_children():
				if grandchild is CollisionShape2D:
					grandchild.set_deferred("disabled", false)

func unlock_rooms():
	for child in get_children():
		for grandchild in child.get_children():
			if grandchild is CollisionShape2D:
				grandchild.set_deferred("disabled", true)
func _on_mob_death(mob):
	mobs.erase(mob)  # Remove the dead mob from the list

	if mobs.is_empty():
		unlock_rooms()
