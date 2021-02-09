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

## Rough Priority ToDoList:
- CountDownPage moet kunnen aftellen
- EventCard moet kunnen aftellen
- CreatePage moet save kunnen en Iconen daaraan toevoegen (we moeten ook de mogelijkheid toevoegen om een tijd te kiezen)
- Kaarten moet je kunnen editen en verwijderen
- Meldingen (Dit moet denk ik wel bij V1.0)

## Local Storage
- We hebben denk ik genoeg aan 1 hive box die we een bepaalde naam moeten geven
- Wat we erin opslaan:
    - de events
        - deze kunnen we opslaan als een lijst van events in de box en die steeds oppikken als je hem nodig hebt
        - als je hem hebt kan je bij het hoofdscherm bijvoorbeeld een for loop maken dat ie voor ieder event een kaart maakt 

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

## Settings

## About

### Acknowledgements

### Github link 

### Updates
- Als we ooit een update doen waarin de database veranderd zouden we wat code moeten schrijven die de elementen van de ene database naar de andere kan overbrengen gezien Events bijvoorbeeld niet hetzelfde zullen gedragen of je kan andere soort van hacky manieren vinden om shit te splitsen in Event info en Cardinfo