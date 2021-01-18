# Countdown App

# Plan
- Code the front-end
- Learn about state- and data-management
- Code the backend and logic of the app 

# Tools Used
- Codebase: Flutter
- Local storage: Hive
- Environment: Android (Future may include IOS)

# My Notes

## MainPage
- BottomAppBar moet  achtergrond zwart worden en FAB moet paars zijn omdat in een dark mode moeten felle kleuren niet voor grote oppervlakken gebruikt worden.
- Ziet er nu clean uit maar is hard-coded dus wat we binnenkort moeten doen is uitzoeken hoe classes werken zoodat we alleen titel, icoon, description en datum hoeven te geven en hij zelf de kaart kan maken met behulp van die info

### BottomAppBar
- Hier zetten we waarschijnlijk nog een knop voor settings want het kan niet echt op een andere plaats
- Wat we ook kunnen doen is dat als je de FAB drukt er twee andere knoppen uit komen, eentje om een event toe te voegen en een andere voor settings
- We kunnen langs verschillende quotes loopen die iets met tijd te maken hebben, is ook wel een mooie opvulling misschien

### Fancy Fab
- Dit wordt denk ik de enige knop op de home pagina gezien de simpelheid en de twee knoppen zijn meer dan genoeg
- wil wel dat de twee knoppen die eruit komen misschien wat kleiner zijn maar dat is vast wel aan te passen

### Cards
- CardTitle is de felste kleur
- Description en de icons zullen minder fel zijn
- De verschillende tijd-eenheden moeten allemaal in een eigen box waaronder gelijk zijn tijd komt te staan zodat die onder elkaar staan

## CreatePage
- TopBar ziet er echt clean uit nu en het geeft echt een totaal andere look als je niet volledig paars gebruikt voor de top app bar
- Buttons mogen er mooier uit zien en cleaner op de pagina.
- Opzich is de tekst invoer mooi maar de outside color moet minder fel worden en het woord 'Title' mag wel wat duidelijker zijn

### Event Class
- Hier moet de logica zitten van de kaart, hier zit alle data maar ook de rekenfuncties die bereken hoeveel er dagen er nog over zijn etc.

## Settings

## Acknowledgements