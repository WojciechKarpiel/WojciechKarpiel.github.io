(*
Przemek ma 12 złotych monet. Jedna z nich jest fałszywa.
Fałszywa moneta różni się od pozostałych wagą, ale różnica wag jest na tyle mała,
że potrzeba specjalistycznej wagi żeby wykryć różnicę.
Wszystkie prawdziwe monety ważą tyle samo.
Przemek ma specjalistyczną wagę z Aliekspresu.
Po położeniu monet na szalkach i włączeniu wagi
zapala się jedna z trzech świecących diód.
Jedna z nich oznacza, że ciężar na prawej szalce jest większy niż na lewej;
drugia - że ciężar na lewej jest większy;
trzecia - że ciężar na obu szalkach jest równy.
Niestety, instrukcja jest po chińsku i Przemek nie wie, która dioda jest która.

W jaki sposób Przemek może znaleźć fałszywą monetę, dokonując co najwyżej czterech ważeń?

*)

type moneta = int

type wskazanie = int

type wzkazanie_zlej = Lewa | Prawa | Rowne

let permutacje = [|
  [|Lewa;Prawa;Rowne|];
  [|Lewa;Rowne;Prawa|];
  [|Rowne;Lewa;Prawa|];
  [|Rowne;Prawa;Lewa|];
  [|Prawa;Lewa;Rowne|];
  [|Prawa;Rowne;Lewa|]
|]

type swiat = {
    zla : moneta;
    permutacja: int      
  }

let rec znajdz a x n =
  if a.(n) = x then n 
  else znajdz a x (n+1)

let zawiera_zla swiat monety =
  Option.is_some (List.find_opt (fun x -> x =  swiat.zla) monety)

let wskazanie swiat rzeczywiste =
  let p = Array.get permutacje swiat.permutacja in
  znajdz p rzeczywiste 0

(*+ liczba ważeń *)
let wazenie (wazenia: int ref) (swiat: swiat) (monety_l : moneta list) monety_p : wskazanie =
  wazenia := !wazenia+1;
  assert (!wazenia <= 4);
  assert (List.length monety_l == List.length monety_p);
  let rzeczywiste =
    if zawiera_zla swiat monety_l then Lewa
    else if zawiera_zla swiat monety_p then Prawa
    else Rowne in
  wskazanie swiat rzeczywiste

let sprawdz swiat rozw =
  let x = ref 0 in
  let wazenie l1 l2 = wazenie x swiat l1 l2 in
  let odp = rozw wazenie in
  if odp = swiat.zla then None else Some odp
      

let sprawdz_dla_wszystkich rozw =
  let rec dla_mon m =
    if m = 12 then None (* nic wincyj do spr *)
    else
      let rec dla_perm p = if p = 6 then None else
          let s = { zla = m ; permutacja = p } in
          let b = sprawdz s rozw in
          match b with
          | Some odp -> Some (m,p,odp)
          | None -> dla_perm (p+1)
      in let r = dla_perm 0 in
      if Option.is_none r then dla_mon (m+1)
      else r
  in dla_mon 0
              
                

let rozwiazanie (wazenie : moneta list -> moneta list -> wskazanie) : moneta = 
let w1 = wazenie [0;1;2;3;4;5] [6;7;8;9;10;11] in
let nier = w1 in
let w2 = wazenie [0;1] [10;11] in
if nier = w2 then
  let w3 = wazenie [0] [10] in
  if w3 = nier then
    let w4 = wazenie [0] [1] in 
    if w4 = w3 then 0 else 10
  else
     let w4 = wazenie [0] [1] in 
     if w4 = w3 then 11 else 1
else (*w1 != w2*)
  let rown = w2 in
  let w3 = wazenie [2;3;6] [4;5;7] in
  if w3 = rown then
    (* 8 lub 9 *)
    let w4 = wazenie [0] [8] in
    if w4 = rown then 9 else 8
  else if w3 = nier then
    (* zachowana kol - 237*)
    let w4 = wazenie [2] [3] in
    if w4 = rown then 7
    else if w4 = nier then 2 else 3
  else
    (* niezachowana - 456 *)
    let w4 = wazenie [4] [5] in
    if w4 = rown then  6
    else if w4 = nier then 4 else 5
    
    
  


let main () = match (sprawdz_dla_wszystkich rozwiazanie) with
  | None -> print_string "UDAŁO SIĘ!"
  | Some (a,b,c ) -> (Printf.printf "rypło dla monety %d - perm %d; odpowiedział: %d\n" a b c)
;;
(* main ();; *)
