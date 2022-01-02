rozwiazanie(ImieWisniewskiej , Swiat) :-
    mezczyzni(Mezczyzni),
    nazwiska(Nazwiska),
    Swiat =  [malzenstwo(beata, MB, NB),   malzenstwo(helena, MH, NH),  malzenstwo(malgorzata, MM, NM),
              rodzenstwo(beata, BB, NPB),  rodzenstwo(helena, BH, NPH), rodzenstwo(malgorzata, BM, NPM)],
    member(malzenstwo(ImieWisniewskiej,_, wisniewski), Swiat),
    NM = kowalski,
    rozlaczne(MB,MH,MM,Mezczyzni),
    rozlaczne(NB,NH,NM,Nazwiska),
    rozlaczne(NPB,NPH,NPM,Nazwiska),
    rozlaczne(BB,BH,BM,Mezczyzni),
    rozlaczne(MB,BB,_,Mezczyzni), rozlaczne(MH,BH,_,Mezczyzni),rozlaczne(MM,BM,_,Mezczyzni),
    rozlaczne(NB,NPB,_,Nazwiska), rozlaczne(NH,NPH,_,Nazwiska), rozlaczne(NM,NPM,_,Nazwiska),
    
    % mężczyzna nie zmienia nazwiska po ślubie:
    toSamoNazw(MB,BH,NB,NPH), toSamoNazw(MB,BM,NB,NPM),
    toSamoNazw(MH,BM,NH,NPM), toSamoNazw(MH,BB,NH,NPB),
    toSamoNazw(MM,BH,NM,NPH), toSamoNazw(MM,BB,NM,NPB),
    

    %% Siostra pana Kowalskiego, która jest żoną szwagra brata Heleny, poślubiła swego męża w dniu swych urodzin w styczniu.
    member(rodzenstwo(SiostraKowalskiego,_,kowalski), Swiat),
    member(malzenstwo(SiostraKowalskiego,SzwagierBrataHeleny,_),Swiat),
    szwagier(SzwagierBrataHeleny,BratHeleny,Swiat),
    member(rodzenstwo(helena,BratHeleny,_),Swiat),
    daty(Swiat,SiostraKowalskiego),
    
    % wilhelm jest nowak
    member(malzenstwo(_,wilhelm,nowak),Swiat),

    member(rodzenstwo(SiostraArtura,artur,_),Swiat),
    %siostra artura to nie beata bo są różnego wzrostu
    rozlaczne(beata,SiostraArtura,_,[beata,malgorzata,helena])
.

malzenstwo(K,M,N) :- kobieta(K), mezczyzna(M), nazwisko(N).
rodzenstwo(K,M,N) :- kobieta(K), mezczyzna(M), nazwisko(N).

%Szwagier to brat żony lub mąż siostry
szwagier(A,B,Swiat) :- member(rodzenstwo(C,A,_),Swiat), member(malzenstwo(C,B,_),Swiat).
szwagier(A,B,Swiat) :- member(malzenstwo(C,A,_),Swiat), member(rodzenstwo(C,B,_),Swiat).

    % Helena jest strarsza od meza 26tyg
    % sistra kowalskiego poslubila meza w styczniu
    %jan urodzil sie w roku w ktorym od strycznia do sierpnia bylo >26tyg
daty(_, SiostraKowalskiego) :- rozlaczne(SiostraKowalskiego,helena,_,[helena,beata,malgorzata]).
daty(Swiat, helena) :- member(malzenstwo(ZonaJana, jan, _), Swiat), rozlaczne(helena, ZonaJana,_, [helena,beata,malgorzata]).

toSamoNazw(Maz,Brat,NM,NB) :- rozlaczne(Maz,Brat,_,II),rozlaczne(NM,NB,_,NN),  mezczyzni(II), nazwiska(NN).
toSamoNazw(X,X,Y,Y).

nazwisko(kowalski).
nazwisko(nowak).
nazwisko(wisniewski).
nazwiska([kowalski,nowak,wisniewski]).

kobieta(helena).
kobieta(malgorzata).
kobieta(beata).

mezczyzna(artur).
mezczyzna(wilhelm).
mezczyzna(jan).
mezczyzni([artur,wilhelm,jan]).

permutacja(A,B,C,               A,B,C).
permutacja(A,B,C,               A,C,B).
permutacja(A,B,C,               B,A,C).
permutacja(A,B,C,               B,C,A).
permutacja(A,B,C,               C,A,B).
permutacja(A,B,C,               C,B,A).


rozlaczne(A,B,C,[X,Y,Z]) :- A=Ax, B=Bx, C=Cx, permutacja(X,Y,Z,Ax,Bx,Cx).

