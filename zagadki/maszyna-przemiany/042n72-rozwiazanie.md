# Rozwiązanie

Maszynę Przemiany można zamodelować jako dwuargumentowe działanie, nazwijmy je "⚘".
Wtedy obserwacje Uważnej Urszuli można zapisać jako:

1. ∀ x, y : (x ⚘ y) ⚘ y = x
2. ∀ x, y : y ⚘ (y ⚘ x) = x

A wniosek Logicznego Leszka to twierdzenie: "działanie '⚘' jest przemienne":

∀ x, y : x ⚘ y = y ⚘ x

Żeby nie pomieszać kroków dowodu z założeniami (obserwacjami Urszuli),
zmienne w krokach dowodu będę zapisywał jako a i b zamiast x i y.
Opuszczę też kwantyfikator z przodu. A zatem celem jest:

a ⚘ b = b ⚘ a

Zacznijmy od trywialnie prawdziwego stwierdzenia:

a = a

Wykorzystajmy obserwację 1, żeby przepisać prawą stronę równania (x = a, y = b ⚘ a):

a = (a ⚘ (b ⚘ a)) ⚘ (b ⚘ a)

Wykorzystajmy obserwację 2, żeby przepisać lewą stronę równania (x = a, y = b):

b ⚘ (b ⚘ a) = (a ⚘ (b ⚘ a)) ⚘ (b ⚘ a)

Wykorzystajmy obserwację 2, żeby przepisać lewą stronę równania (x = b, y = a):

(a ⚘ (a ⚘ b)) ⚘ (b ⚘ a) = (a ⚘ (b ⚘ a)) ⚘ (b ⚘ a)


Równanie jest w postaci:

(T ⚘ (a ⚘ b)) ⚘ U = (T ⚘ (b ⚘ a)) ⚘ U

A zatem wystarczy, że od obu stron równania odetniemy nadmiarowe części (U, T) -
ale najpierw trzeba udowodnić, że można tak zrobić.
To nie jest zawsze możliwe.
Na przykład, takie równanie jest prawdziwe 
w zbiorze liczb naturalnych ze zwyczajnym mnożeniem:

1 ∙ 0 = 2 ∙ 0

ale takie już nie:

1 = 2

Na szczęście, działanie ⚘ posiada taką własność. Potrzebujemy lematów:

1. ∀ c, d, e : c ⚘ e = d ⚘ e ⇒ c = d
2. ∀ c, d, e : e ⚘ c = e ⚘ d ⇒ c = d

Udowodnimy pierwszy z nich.
Zaczynamy od założenia:

c ⚘ e = d ⚘ e

Jeśli do obu stron równania przyłożymy funkcję, to równanie dalej będzie prawdziwe: 

f(c ⚘ e) = f(d ⚘ e)

Niech funkcję będzie: f(x) = x ⚘ e, wtedy otrzymamy:

(c ⚘ e) ⚘ e = (d ⚘ e) ⚘ e

Wykorzystujemy obserwację 1 do uproszczenia lewej (x = c, y = e) i prawej (x = d, y = e) strony równania:

c = d

co kończy dowód. Drugi lemat ma analogiczny dowód, pominiemy go.

Wracając do gównego problemu:

(a ⚘ (a ⚘ b)) ⚘ (b ⚘ a) = (a ⚘ (b ⚘ a)) ⚘ (b ⚘ a)

Upraszczamy równanie używając lematu 1 (c = a ⚘ (a ⚘ b), d = a ⚘ (b ⚘ a), e = b ⚘ a):

(a ⚘ (a ⚘ b)) = (a ⚘ (b ⚘ a))

A następnie kończymy dowód używając lematu 2 (c = a ⚘ b, d = b ⚘ a, e = a):

a ⚘ b = b ⚘ a

Quod erat demonstrandum.

---

* [źródło](https://www.codewars.com/kata/5c8f5d3a542ce10001c284c3)
* [rozwiązanie w Coq](rozwiazanie.v)
