
# Hahn - Task Assignment.

**Done By:** Mohammad Ihmouda.


## Installation

Simply open COVID WARN.xcodeproj using Xcode and build & run the app. 

## Description:


Once jump into app, the app shows the MapView as the Main View Controller with user's current location, After successfuly promote access to user location, the app call the official API **services7.arcgis.com** and retreive the feature service data  (BL / deaths / cases / death_rate / cases7_per_100k ). once successfuly retrieved it decode the json response to **FeatureData:**  root entity using codable protocol. 

A centerd map annotaton on the map used to specify the user location, each time the user update his location by navigating within the " 16 Federal states of Germeny" it called the API again with the selected gps location and so one. Also a timer repeator operate each 10 minutes and call the API again using the current user location.

The App used the **COVIDSignalUtil** as factory class to decided the COVID Signal "Green / Yellow / Red / Dark Red" based on the user location and number of incidence cases per 100.000 residents. 

The App update the user with the list of Covid-19 Regulations based on the Signal value. The list of regulations contains [ General regulations & Signal regulations]. Moreover the app coloring the regulations view / map annotation according to signal color.

The user can expand / collapse the regulation list using the ShowMore / upper Hamburger buttons. 

For more statistical info, the user can press the "system detail disclosure" button and to show list of statistical info "Death cases / Total cases / Death rate ... etc.".

If the app go to the background state, it stop the repeator timer and once get back to foreground again it operate again.

The app support English and Deutsch lanuages as well using the localization depends on the device language.

The Entities : FeatureData (Root entitiy) / FeatureItem / FeatureItemAttribute.
The Enum Entities: COVIDSignal (Root entitiy) / COVIDRegulation.

The app built using Model-View-ViewModel (MVVM) as structural design pattern that separates objects into three distinct groups: Models / Views / View models. the viewModel convert the entities to cells' representables, and the table view assign the representables to cells.

The code is fully & well-documented.

The XD Designs are attached to the project files.
