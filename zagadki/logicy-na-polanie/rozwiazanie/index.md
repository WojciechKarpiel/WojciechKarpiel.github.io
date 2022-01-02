# Rozwiązanie:
Wszyscy niebieskonaklejkowi logicy wsiądą do autobusu 19 grudnia 2020, czyli w 80-tym dniu po ogłoszeniu Przemysława (dzień pierwszy to dzień ogłoszenia)
(dowód indukcujny jest na dole, poniżej jest próba zrozumiałego opisu)

Jeżeli byłby jeden niebieskonaklejkowy logik, to po wysłuchaniu Przemysława rozejrzałby się po polanie i nie zobaczył żadnego człowieka z niebieską naklejką. A zatem wywnioskowałby że jest jedynym logikiem z niebieską naklejką i wyjechał tego samego dnia.

Jeżeli byłoby 2 niebieskonaklejkowych logików, to każdy z nich pomyśli sobie:
"Jeżeli ten ziomek z niebieską naklejką jest jedynym z niebieską naklejką, to będzie w stanie to wywnioskować i wyjedzie dzisiaj. A jeśli nie wyjedzie dzisiaj, to znaczy że musi być ktoś drugi z niebieską naklejką. Tym drugim muszę być ja, bo inaczej bym widział dwóch ludzi z niebieską naklejką"
Każdy z nich poczeka do drugiego dnia, a drugiego dnia wyjadą

Jeśli byłoby 3 niebieskonaklejkowych logików, to każdy z nich pomyśli sobie:
"Jeżeli ci dwaj, których widzę są jedynymi logikami z niebieską naklejką, to wyjadą drugiego dnia (patrz rozumowanie powyżej). A jeżeli nie wyjadą drugiego dnia, to znaczy że musi być ktoś trzeci z niebieską naklejką. Tym trzecim muszę być ja!"
Każdy z nich poczeka do trzeciego dnia, a trzeciego dnia wyjadą

...

Jeżeli byłoby 80 niebieskonaklejkowych logików... każdy z nich poczeka do 80-tego dnia, a 80-tego dnia wyjadą


== dowód indukcujny ==

Hipoteza:
H(n) = Jeżeli jest n niebieskonaklejkowych logików, to oni wszyscy wsiądą do autobusu n-tego dnia po ogłoszeniu Przemysława (dzień pierwszy to dzień ogłoszenia)

Przypadek bazowy, n=1:
Po wysłuchaniu Przemysława, logik z niebieską naklejką rozgląda się po polanie i nie widzi żadnego człowieka z niebieską naklejką na czole. Wnioskuje, że jest jedynym z niebieską naklejką i wsiada do autobusu tego samego dnia.

Krok indukcyjny, zakładam że H(n) zachodzi i muszę udowodnić H(n+1):
Każdy z niebieskonaklejkowych logików widzi n niebieskonaklejkowych logików. Myśli:
Jeżeli nie mam niebieskiej naklejki na czole, to:
* niebieskonaklejkowych logików jest dokładnie n
* na podstawie hipotezy indukcyjnej, wszyscy oni wyjadą n-tego dnia
A zatem logik czeka do n+1 dnia. Wszyscy inni niebieskonaklejkowi logicy myśleli dokładnie tak samo, więc też czekali do n+1 dnia. N+1 dnia logik myśli:
* Skoro n-tego dnia logicy nie wyjechali, to znaczy że liczba logików jest różna od n
* A zatem ja muszę mieć niebieską naklejkę na czole, wtedy niebieskonaklejkowych logików będzie n+1
Logik pakuje się do autobusu n+1 dnia, tak samo jak n pozostałych niebieskonaklejkowych.

(każdy z inno-naklejkowych logików widzi n+1 niebieskonaklejkowych logików, więc czeka do n+2 dnia, ale n+1 dnia wszyscy niebieskonaklejkowi opuszczają polanę)

---

[źródło](https://xkcd.com/blue_eyes.html)
