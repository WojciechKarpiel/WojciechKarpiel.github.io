# Rozwiązanie

1. Ponumerować sługi
1. Ponumerować beczki i na każdej beczce napisać jej numerek zapisany w systemie dwójkowym
1. Kazać każdemu ze sług pić z tych beczek, gdzie na pozycji odpowiadającej numerkowi sługi znajduje się "1" w zapisie dwójkowym numeru beczki
1. Numerki sług, którzy umrą wskażą, na których pozycjach w zapisie dwójkowym numeru zatrutej beczki znajduje się "1"

Przykład:

Beczka o numerze 723 będzie miała napisane "1011010011".
A zatem z tej beczki będą pili słudzy o numerach
1, 2, 5, 7, 8, 10.

     1011010011
     ^ ^^ ^  ^^
     | || |  ||
    10 87 5  21

Jeśli umrą właśnie ci słudzy, to znaczy, że beczka 723 była zatruta,
gdyż jest jedyną beczką, z której pili tylko oni i nikt inny.

## Uwagi

Rozwiązanie działało by nawet przy większej liczbie beczek, aż do 1024 (2<sup>10</sup>).
W ogólności można znaleźć zatrutą beczkę wśród 2<sup>N</sup> beczek poświęcając
co najwyżej N sług.
