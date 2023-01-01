* Flutter mobile app that displays a list of universities in a given country  
* Home Screen:  
  * Display the list of universities in a Listview or any other scrollable widget of your choice  
  * Next to each university name, include a favorite interactive icon (store the selection using
    sqlite)  
  * Support displaying the items in multiple columns GridView for wide screen sizes (landscape
    layout or in tablets)  
  * Each item should be clickable to open a university detail screen with a random image of a
    university building (you can use network_image_search package) (any random image will be
    ok) and details (name, website)  
* About screen: with basic developer info (for example, your photo, name, and student id)  
* Search screen: simple search form to enter a country name, and optional keyword to retrieve the
list of universities in that country that include the keyword in the title (blank keyword returns all
universities in the given country).  
* Preferences screen: includes the following:  
  * Option to switch between light/dark theme  
  * Default country  
  * Store these preferences using the shared_preferences package  
* Include a drawer that has links to:  
  * Home page (display the universities in the default country)  
  * Search  
  * About page  
  * Preferences page  
