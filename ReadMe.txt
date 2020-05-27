SVProgressHUD: 
It is used in PokeDex Pages, Weather Situation Pages and Photo Library Page to show data is loading.

Alamofire:
It is used in Service page to handle the web request and get response of different data type. It is easy use and powerful, also it will handle the thread problem automatically.
 
SwiftyJSON:
It is used in the main pages of Pokemon Dex, Weather and Photo Library to transfer Data type data to JSON type. This JSON type is not the normal JSON type but more powerful and easy to understand and fetch the data.

Gemini:
It is a rich scroll based animation framework and used in the Photo Library to show the Collection View Animation. It contains many build-in animations. If you want to change the animation, just modify the setupAnimation() function of PhotoLibraryViewController.swift file.   

LoginTextField:
It is used in Login and Register pages to customize the username and password text field. 

LGButton:
It is used in the Login and Register page to customize the button style.

PMAlertController
It is used in the AlertManager file to customize the alert style.

CollectionViewSlantedLayout:
It is used in Pokemon Dex main page to customize the collection view style.

ViewAnimator:
It is used in Pokemon Dex main page to customize the animation of collection view style. Basically, it can customize many kinds of views.
 
LTMorphingLabel:
It supposed to be used in Pokemon Dex Detail page to customize the Label by adding animations for labels. However, there are some issues when I use it. It should be discuessed later.
 
RAMAnimatedTabBarController
It is used for Custimizing the Tab Bar Controller. I use it to add animations for the tab bar items. Once you tapped the tab bar items, you will see the animation of chosen. 

---------------------------------------------------------------------------------
5.26 Update
1. Update all the SVProgressHUD animation, now the animation should show properly
2. Weather Project:
	- In the Search Page, add city verification. If city doesn't exit or city text field is empty, it should show user the alert.
	- Adjust delegate method didChangeCity() and getWeather() method
	- Update UI if Location can't be found
	- Notice: if the location can't be found, Please follow the below options
		1. Go to the system setting of your simulater
		2. Clicked on Privacy
		3. Go into Location Service
		4. Make Sure Location Service is on
		5. Go into TabBarTasks and make sure "Allow Location Access is not 'Never' "
3. Adjust Logout Function. 
4. PhotoLibrary Project:
    - Add more animations, clicked refresh will also switch the animations
5.27 Update
1. If user register sucessfully, will show register sucessfully alert and jump back to the Login page and bring back the user name.
