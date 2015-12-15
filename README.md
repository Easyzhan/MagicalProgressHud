
# MagicalProgressHud

This HUD uses an Array of different Images and animate them like a GIF. It shows a waiting HUD for an ongoing task and Act Like Pull to Refresh Controller.

***

![](https://github.com/mwaqasbhati/MagicalProgressHud/blob/master/Example/ActivityHud.gif)
![](https://github.com/mwaqasbhati/MagicalProgressHud/blob/master/Example/PullHud.gif)
***
# Installation

1. First of all download the Project from repository
2. It contains a folder with name **MagicalProgressHud** 
Copy and paste that folder into your project will Install all the things you will need nothing extra to Include for this Controller.
3. Include its header file named **MagicalProgressHud.h** into the file Where you want to Use it. 

***

#Usage

Using MagicalProgressHud is really simple Show this HUD before performing a long running task and Hide the HUD when task is successfully completed. 

***

#Showing the HUD as Activity Indicator

    [MagicalProgressHud flyingHudAddedTo:self.view];

***
#Showing the HUD as Pull To Refresh 
    
    [MagicalProgressHud flyingHudAddedTo:self.tableView];
    
#Dismissing the HUD

    [MagicalProgressHud flyingHudRemoveFrom:self.view];


