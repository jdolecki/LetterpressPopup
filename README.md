### Letterpress-style popup

You can use this popup to flash a message on the device. The popup just extends
a UILabel, so you can modify most of the properties that a normal UILabel would
have.

The way this is done is through a custom animation done with an animation group.
The forward animation goes, there is a wait period when user can read what the
popup says, and the reverse animation goes.

I kind of hacked a solution to the problem of a single view having rounded
corners and a shadow, but it works. I wanted a single view because I wanted this
to just extend a UILabel and have all of the nice things that UILabel gives you.

I hacked this pretty quickly, so let me know what you think and how we can
improve it!
