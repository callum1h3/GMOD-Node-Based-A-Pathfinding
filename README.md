# GMOD Node Based A* Pathfinding

This project was intended to be a client side path finding system so you can tell your own player to move to a specific location on the map.
It is very unfinished but it includes:

1. A node editor so you can place down nodes onto the map you want to path find on.
2. Different types of nodes such as "Door" Nodes that tell the bot theres a door that needs to be opened (I didn't get to finish it I think it bugs out if its locked)
3. Ability to add different types of nodes in a config.
4. A inspector menu so you which you can customize to edit the settings on each of the nodes.

I haven't touched the project in a while but I'll try to explain some of the setup. The server file is required for you to setup doors for the map, because the door
nodes requires the angle of the door to check if its closed or not. Good luck lol
