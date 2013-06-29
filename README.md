MAMP Launcher
===
**MAMP Launcher is a simple Mac application which allows you to control your MAMP server from a simple GUI.**  
I decided to create this app to avoid using Terminal to start/stop my server, after I had set up one using [MacPorts](http://www.macports.org/). Even though it is still in development, it works but requires a server (Apache/MySQL/PHP) installed through **MacPorts**; more info later.  
  
![MAMP Launcher](http://www.matthewlabs.com/resources/external/MAMPLauncherGitHub.png "MAMP Launcher")  
  
Set Up MAMP Launcher
---
1. Download the latest code version from the repository (using the Download Source button or your preferred command-line tool).
2. If you have to, extract the archive.
3. Open the project using Xcode and compile it (tested with **Xcode 4.6.3**).
4. Locate the **.app** file in Finder and copy it in your Applications folder to start using it.

License
---
The license for this source code is included in the **Source Code License** file.  
For warranties and other info about this code, read that license file.  
Icon file courtesy of [Web Design Library](http://www.webdesign.org/photoshop/special-effects/toggle-switch-photoshop-tutorial.19795.html).  

Requirements
---
- Mac OS X 10.8 Mountain Lion or later (because of _graceful_ command for Apache)
- MAMP server installed using MacPorts (located in /opt/local)
- Apache 2
- MySQL 5.5.x
- PHP 5.4.x
- phpMyAdmin (optional)

TODO
---
As I said before, this app is for everyone who set up a MAMP server through MacPorts since it allows not to use Terminal to start and stop it (it's my first Mac app).  
I'm working on a preferences system so Apache and MySQL start/stop commands can be set to provide support for other kind of MAMP installation, e.g. without MacPorts.  
I also want to improve how the app checks if Apache or MySQL daemons are running.  
  
Changelog
---
**Version 0.1 @ June 29th, 2013**  
  
* Initial release: there is so much to work on and to be improved… However, this is my contribute to [Objective-C Hackathon](https://objectivechackathon.appspot.com "Objective-C Hackathon")  

Credits
---
**Matteo Del Vecchio**  
**Matthew Labs**  
  
Web: [Matthew Labs](http://www.matthewlabs.com/ "Matthew Labs")  
Twitter: [@MatthewLabs](http://twitter.com/MatthewLabs "Matthew Labs on Twitter")  
Facebook: [facebook.com/MatthewLabsDev](http://www.facebook.com/MatthewLabsDev "Matthew Labs on Facebook")  
Google+: [Matthew Labs Page](https://plus.google.com/117759042318503506347 "Matthew Labs on Google+")

	