var ANIA = "Ania"
var JAMA = "Jama"
var SAGA = "Saga"
var TOMEK = "Tomek"
var WOJTEK = "Wojtek"
var PAULINKA = "Paulinka"
var LUDZIE = [ ANIA, JAMA, SAGA, TOMEK, WOJTEK, PAULINKA ]

var WYLOSOWANE = { Ania: 89, Jama: 165, Saga: 16, Tomek: 39, Wojtek: 202, Paulinka: 179 }
// do usunięcia xD
HASLA = {}
HASLA[ANIA]= 92
HASLA[JAMA]= 167
HASLA[SAGA]= 20
HASLA[TOMEK]= 38
HASLA[WOJTEK]= 201
HASLA[PAULINKA]= 179


var ZAKAZANE_PARY = {}
function dodaj_zakaz(osoba1, osoba2) {
    ZAKAZANE_PARY[osoba1] = osoba2
    ZAKAZANE_PARY[osoba2] = osoba1
}

dodaj_zakaz(ANIA, JAMA)
dodaj_zakaz(SAGA, TOMEK)


function dobra_permutacja(permutacja) {
    var i=0;
    for (i = 0; i < LUDZIE.length; i++) {
        if (LUDZIE[i] == permutacja[i]) return false;
        if (ZAKAZANE_PARY[LUDZIE[i]] == permutacja[i]) return false;
    }
    return true
}

function losowa_permutacja(tablica) {
    return tablica
        .map(value => ({ value, sort: Math.random() }))
        .sort((a, b) => a.sort - b.sort)
        .map(({ value }) => value)
}

function znajdz_nr(osoba){
    var i=0
    for(i=0;i<LUDZIE.length;i++){
        if (LUDZIE[i] == osoba) return i;
    }
}

function ph(h) {
    return h;
}

function wylosuj_spoko(){
    var i = 0
    while(true){
        p = losowa_permutacja(LUDZIE)
        if (dobra_permutacja(p)){
            console.log("Zajęło " + i)
            console.log(LUDZIE)
            console.log(p)
            odp = {}
            var j=0
            for (j=0; j < LUDZIE.length; j++){
                var l = LUDZIE[j]
                console.log("ogarniam " + l);
                odp[l] =  zaszyfruj( znajdz_nr(p[j]), HASLA[l])
            }
            return odp
        }
        i++
    }
}

/*
  function zaszyfruj(numerek, haslo) {

  var key = new TextEncoder().encode(ph(haslo));

  //    var text = wartosc
  var textBytes = [ numerek ]; //  aesjs.utils.utf8.toBytes(text);

  // The counter is optional, and if omitted will begin at 1
  var aesCtr = new aesjs.ModeOfOperation.ctr(key, new aesjs.Counter(5));
  var encryptedBytes = aesCtr.encrypt(textBytes);

  // To print or store the binary data, you may convert it to hex
  var encryptedHex = aesjs.utils.hex.fromBytes(encryptedBytes);
  return encryptedHex
  }

  function odszyfruj(zaszyfrowane, haslo){
  var key = new TextEncoder().encode(ph(haslo));
  // When ready to decrypt the hex string, convert it back to bytes
  var encryptedBytes = aesjs.utils.hex.toBytes(zaszyfrowane);

  // The counter mode of operation maintains internal state, so to
  // decrypt a new instance must be instantiated.
  var aesCtr = new aesjs.ModeOfOperation.ctr(key, new aesjs.Counter(5));
  var decryptedBytes = aesCtr.decrypt(encryptedBytes);

  // Convert our bytes back into text
  var decryptedText = decryptedBytes[0] // aesjs.utils.utf8.fromBytes(decryptedBytes);
  return decryptedText
  // "Text may be any length you wish, no padding is required."
  }
*/




function zaszyfruj(numerek, haslo){
    return numerek ^ haslo;
}

function odszyfruj(numerek, haslo){
    return numerek ^ haslo;
}

function przygotuj(){
    var ja= document.getElementById('ja');

    for (var i = 0; i< LUDZIE.length; i++){
        var opt = document.createElement('option');
        opt.value = i;
        opt.innerHTML = LUDZIE[i];
        ja.appendChild(opt);
    }


    var input = document.getElementById('haslo');
    input.addEventListener('input', function (e) {kogo_ogar() ;});
    ja.addEventListener('change', function (e) {kogo_ogar() ;});
    kogo_ogar();
}

function kogo_ogar(){
    var wynik = document.getElementById('wynik')
    wynik.innerHTML = "ELO"
    
    var select=    document.getElementById('ja');
    var ja =+ select.options[select.selectedIndex].value;

    var haslo = + document.getElementById('haslo').value.trim();

    if (haslo == ''){
        wynik.innerHTML=""
    }else{
        try {
            var o = odszyfruj(WYLOSOWANE[LUDZIE[ja]], haslo)
            o=LUDZIE[o];
            if (o != undefined && o != null && o != "undefined" ){
                wynik.innerHTML=o
            }else{
                wynik.innerHTML="Coś jest nie tak"
            }
        } catch(error){
            wynik.innerHTML="Coś się zepsuło. Czy hasło jest dobre?"
        }
    }
}
