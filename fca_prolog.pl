% ==========================================================
% BÖLÜM 1: BİLGİ TABANI (GEZEGENLER)
% ==========================================================
% Gezegenler ve Özellikleri [cite: 16]

iliski(merkur, kayasal).
iliski(merkur, sicak).
iliski(venus, kayasal).
iliski(venus, sicak).
iliski(dunya, kayasal).
iliski(dunya, yasam_var).
iliski(dunya, uydulu).
iliski(mars, kayasal).
iliski(mars, soguk).
iliski(mars, uydulu).
iliski(jupiter, gaz_devi).
iliski(jupiter, soguk).
iliski(jupiter, halkali).
iliski(jupiter, uydulu).
iliski(saturn, gaz_devi).
iliski(saturn, soguk).
iliski(saturn, halkali).
iliski(saturn, uydulu).

% ==========================================================
% BÖLÜM 2: ZİNCİR YAPISI VE HATA AYIKLAMA
% ==========================================================

% Eleman kontrolü (z yapısına göre) [cite: 31]
eleman_mi(X, z(X, _)).
eleman_mi(X, z(_, Devami)) :-
    eleman_mi(X, Devami).

% Hata Analizi: 
% Orijinal kodda kapsar_mi(son, _) gibi bir durma noktası olmadığı için 
% liste bittiğinde program patlıyordu. [cite: 34, 39]
kapsar_mi(son, _). 
kapsar_mi(z(X, Kuyruk), AnaListe) :-
    eleman_mi(X, AnaListe),
    kapsar_mi(Kuyruk, AnaListe).

% ==========================================================
% BÖLÜM 3: FCA OPERATÖRLERİ
% ==========================================================

% Ortak nitelikleri bulma [cite: 42]
ortak_nitelikler(Nesneler, NitelikZinciri) :-
    Tum = z(kayasal, z(gaz_devi, z(halkali, z(yasam_var, z(sicak, z(soguk, z(uydulu, son))))))),
    nitelik_kontrol(Tum, Nesneler, NitelikZinciri).

nitelik_kontrol(son, _, son).
nitelik_kontrol(z(N, Kuyruk), NesneListesi, z(N, YeniKuyruk)) :-
    hepsi_mi(NesneListesi, N),
    nitelik_kontrol(Kuyruk, NesneListesi, YeniKuyruk).
nitelik_kontrol(z(_, Kuyruk), NesneListesi, YeniKuyruk) :-
    nitelik_kontrol(Kuyruk, NesneListesi, YeniKuyruk).

hepsi_mi(son, _).
hepsi_mi(z(Nesne, Kuyruk), Ozellik) :-
    iliski(Nesne, Ozellik),
    hepsi_mi(Kuyruk, Ozellik).

% Ortak nesneleri bulma [cite: 44]
ortak_nesneler(Nitelikler, NesneZinciri) :-
    TumN = z(merkur, z(venus, z(dunya, z(mars, z(jupiter, z(saturn, son)))))),
    nesne_kontrol(TumN, Nitelikler, NesneZinciri).

nesne_kontrol(son, _, son).
nesne_kontrol(z(Nesne, Kuyruk), NitelikListesi, z(Nesne, YeniKuyruk)) :-
    sahip_mi(Nesne, NitelikListesi),
    nesne_kontrol(Kuyruk, NitelikListesi, YeniKuyruk).
nesne_kontrol(z(_, Kuyruk), NitelikListesi, YeniKuyruk) :-
    nesne_kontrol(Kuyruk, NitelikListesi, YeniKuyruk).

sahip_mi(_, son).
sahip_mi(Nesne, z(N, Kuyruk)) :-
    iliski(Nesne, N),
    sahip_mi(Nesne, Kuyruk).

% ==========================================================
% BÖLÜM 4: KAVRAM BULMA (CLOSURE) [cite: 46]
% ==========================================================

kavram_bul(Giris, SonucNesne, SonucNitelik) :-
    ortak_nitelikler(Giris, SonucNitelik), % Adım 1: Intent [cite: 48]
    ortak_nesneler(SonucNitelik, SonucNesne). % Adım 2: Extent [cite: 48]
