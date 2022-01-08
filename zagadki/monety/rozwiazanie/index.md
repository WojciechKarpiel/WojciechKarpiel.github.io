# Rozwiazanie

Ponumerujmy monety od 1 do 12.

1. Ważymy [1,2,3,4,5,6] i [7,8,9,10,11,12]

    Zapali się jedna dioda, nazwijmy ją A.
    Dioda A nie może oznaczać "=", ponieważ wśród ważonych monet znajduje się podróbka.
    
    Zdobyta informacja:
    
    * A oznacza "<" lub ">"
1. Ważymy [1, 2] i [11, 12]
    
    Jeżeli zapali się dioda A, to podrobiona moneta znajduje się wśród ważonych, ponieważ dioda A nie oznacza "=".
    Zdobyta informacja:
    
    * Podrobiona moneta jest wśród [1, 2, 11, 12].

    Jeśli zaświeci się inna dioda, nazwijmy ją B, to B musi oznaczać "=".
    Dlaczego? Bo monety, które brały udział w obu ważeniach, w obu ważeniach były na tej samej szalce co przy pierwszym ważeniu.
    Na przykład: Moneta 2 była na lewej szalce w obu ważeniach.
    Jeśli moneta 2 była lżejsza niż pozostałe, to przy pierwszym ważeniu zaświeciła się dioda "<".
    Przy drugim ważeniu też musiała zaświecić się dioda "<", ponieważ lżejsza moneta dalej jest na lewej szalce.
    Zdobyte informacje:
    
    * Dioda B oznacza "="
    * Podrobiona moneta jest wśród [3, 4, 5, 6, 7, 8, 9, 10]
    
    Dalej rozważamy oba przypadki
    
    1. Gdy zaświeciła się dioda A, ważymy [1] i [11]
       
        Jeśli zaświeciła się dioda A, to:
        
        * podrobiona moneta jest wśród [1, 11]
        
        W przeciwnym wypadku musiała zaświecić się dioda B oznaczająca równość (rozumowanie j/w), i wtedy;
        
        * podrobiona moneta jest wśród [2, 12]
        
        Zostało ostatnie ważenie: 
        
        1. Jeśli zaświeciła się dioda A, ważymy [1] i [2]
        
            Jeśli dalej świeci się dioda A, to 1 jest podrobioną monetą, w przeciwym wypadku 11
        
        1. Jeśli zaświeciła się dioda B, też ważymy [1] i [2]
        
            Jeśli dalej świeci się dioda B, to 12 jest podrobioną monetą, w przeciwnym wypadku 2
        
    1. Gdy zaświeciła się dioda B (oznaczająca "="), ważymy [3, 4, 7] i [5, 6, 8]
   
        Do tej pory wiemy, że dioda A oznacza "<" lub ">", a dioda B oznacza "=".
        Kluczowe w tym ważeniu jest to, że monety 5, 6 i 7 są na innych szalkach niż przy pierwszym
        ważeniu, więc jeśli któraś z nich jest podrobiona, to powinna się zaświecić dioda oznaczająca
        nierówność w drugą stronę niż A.
        
        Jeśli zaświeci się dioda B oznaczająca "=", to zdobywamy informację:
        
        * podrobiona moneta jest wśród [9, 10]
        
        Jeśli zaświeci się dioda A, to znaczy, że podrobiona moneta znajduje się na tej samej
        szalce co w poprzednich ważeniach. Zdobywamy informację:
        
        * podrobiona moneta znajduje się wśród [3, 4, 8], 
        
        Jeśli zaświeci się dioda C, to ona musi oznaczać "<" lub ">", ale nie to samo co A.
        Podrobiona moneta musi się znajdować na innej szalce niż w poprzednich ważeniach.
        Zdobywamy informację:
        
        * podrobiona moneta znajduje się wśród [5, 6, 7]
        
        Zostało ostatnie ważenie:
        
        1. Gdy zaświeciła się dioda B, to ważymy [1] i [9]
        
            Jeśli zaświeci się dioda B oznaczająca "=", to 10 jest podrobioną monetą, w przeciwnym wypadku 9.
        
        1. Gdy zaświeciła się dioda A, to ważymy [2] i [3]
        
            Moneta 2 jest na tej samej szalce co w poprzednich ważeniach, a moneta 3 jest na innej szalce niż była
            
            * Jeśli zaświeci się dioda B, to podrobioną monetą jest 8
            * Jeśli zaświeci się dioda A, to podrobioną monetą jest 2
            * Jeśli zaświeci się dioda C, to podrobioną monetą jest 3
        
        1. Gdy zaświeciła się dioda C, to ważymy [5] i [6]
        
            Moneta 5 jest na tej samej szalce co przy pierwszym ważeniu,
            a moneta 6 na innej niż była przy pierwszym ważeniu
            
            * Jeśli zaświeci się dioda B, to podrobioną monetą jest 7
            * Jeśli zaświeci się dioda A, to podrobioną monetą jest 5
            * Jeśli zaświeci się dioda C, to podrobioną monetą jest 6

---

[źródło](https://puzzling.stackexchange.com/questions/112907/12-coins-problem-but-you-cant-understand-the-scale)

[powrót](../)
