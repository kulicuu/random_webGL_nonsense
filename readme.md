











### spacewar the classic DOS era game with 2D world and spaceships flying around, sometimes with a planetary gravity well.

Here we will use React to setup the menu UIs, restart game, hi scores, stuff like that, and we'll use webGL for the game screen.

This is just a prototype project to get started (again) with WebGL.  With proof of concept & competence of the tools and techniques can then move onto more interesting projects.  3D games and whatever else.


### ttd

- Start using this http://twgljs.org/docs/


### after implement 2D version, then implement a 3D version:

3D version takes place in a spherically bounded region where hitting the boundary takes you to the opposite end of the sphere, just like in the 2D version.  you should be able to see the boundary somehow in the 3D version, without it impeding view overly of the background decoration, whatever that might be.  question is where is the camera in the 3D version?  might have to be 2 separate views in the player view, right behind each craft, with a HUD cursor for aiming.  maybe have another canvas window open at the bottom showing a god's-eye view of the whole sphere.
