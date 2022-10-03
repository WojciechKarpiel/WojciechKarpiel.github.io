var ANIA = "Ania"
var SAGA = "Saga"
var TOMEK = "Tomek"
var WOJTEK = "Wojtek"
var PAULINKA = "Paulinka"
var KAPUSTA = "Asia"
var WACEK = "Wacek"
var JUSTYNA = "Justyna"
var JAMA = "Jama"
var LUDZIE = [ ANIA, SAGA, TOMEK, WOJTEK, PAULINKA , KAPUSTA, WACEK, JUSTYNA , JAMA]
var MX = LUDZIE.length


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


function wylosuj_spoko(){
    var i = 0
    var HASLA = {}
    for(i=0;i<LUDZIE.length;i++){
        HASLA[LUDZIE[i]] = Math.floor(Math.random() * LUDZIE.length); 
    }
    i =0;
    while(true){
        p = losowa_permutacja(LUDZIE)
        if (dobra_permutacja(p)){
            console.log("Zajęło " + i)
            odp = {}
            var j=0
            for (j=0; j < LUDZIE.length; j++){
                var l = LUDZIE[j]
                odp[j] =  zaszyfruj( znajdz_nr(p[j]), HASLA[l])
            }

            // odp b64 tylko po to, żebym nie widział rozwiązania od razu, to nie szyfr
            return {"odp": btoa(JSON.stringify( odp)), "hasła": HASLA}
        }
        i++
    }
}



function zaszyfruj(numerek, haslo){
    return (numerek + (LUDZIE.length - haslo) ) % LUDZIE.length;
}

function odszyfruj(numerek, haslo){
    return (numerek + haslo) % LUDZIE.length;
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
    for (var i = 0; i< LUDZIE.length; i++){
        var opt = document.createElement('option');
        opt.value = i;
        opt.innerHTML = i;
        input.appendChild(opt);
    }


    
    input.addEventListener('input', function (e) {kogo_ogar() ;});
    ja.addEventListener('input', function (e) {kogo_ogar() ;});
    kogo_ogar();
}

function kogo_ogar(){
    var wynik = document.getElementById('wynik')
    wynik.innerHTML = "ELO"
    
    var select=    document.getElementById('ja');
    var jaq = select.options[select.selectedIndex].value;

    var halo = document.getElementById('haslo').value.trim()
    


    // KTO WYMYŚLIŁ, ŻE 0 == '' XDDDDD
    if (halo === '' || halo === ' ' || jaq === '' || jaq === ' ' ){
        wynik.innerHTML=""
    }else{
        try {
                var    ja = + jaq;
                var haslo = +(halo);
            var xx = JSON.parse( atob(WYLOSOWANE))
          
            var o = odszyfruj(xx[ja], haslo)
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

function haslo_git(){
    for(var i=0;i<LUDZIE.length;i++){
        for (var j=0; j<LUDZIE.length;j++){
            var z = zaszyfruj(i,j)
            var o = odszyfruj(z,j)
            console.log((i===o) + " "+  i + " " + j + " " + z + " " + o  )
        }
    }
}
