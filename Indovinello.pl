%INDOVINELLO DI EINSTEIN V.1

% The English lives in the red house
english_lives_in_red_house(Houses) :-
    member(house(_, inglese, _, _, rosso, _), Houses).

% 3) The Spanish has a dog.
spanish_has_dog(Houses) :-
    member(house(_, spagnolo, cane, _, _, _), Houses).

% 4) They drink coffee in the green house.
coffee_in_green_house(Houses) :-
    member(house(_, _, _, caffe, verde, _), Houses).

% 5) The Ukrainian drinks tea.
ukrainian_drinks_tea(Houses) :-
    member(house(_, ucraino, _, te, _, _), Houses).

% 6) The green house is next to the white house.
green_next_to_white(Houses) :-
    % Trova la casa verde e memorizza l'indice
    member(house(GreenIndex, _, _, _, verde, _), Houses),
    % Trova la casa a sinistra della casa verde
    LeftIndex is GreenIndex - 1,
    % Trova la casa a destra della casa verde
    RightIndex is GreenIndex + 1,
    % Controlla se la casa a sinistra o quella a destra della casa verde è bianca
    (member(house(LeftIndex, _, _, _, bianco, _), Houses);
     member(house(RightIndex, _, _, _, bianco, _), Houses)).


% 7) The Winston smoker has a serpent.
winston_smoker_has_serpent(Houses) :-
    member(house(_, _, serpente, _, _, winston), Houses).

% 8) In the yellow house they smoke Kool.
yellow_house_smokes_kool(Houses) :-
    member(house(_, _, _, _, giallo, kool), Houses).


% 11) The Chesterfield smoker lives near the man with the fox.
chesterfield_smoker_lives_near_fox_owner(Houses) :-
    % Trova la casa con la volpe e memorizza l'indice
    member(house(FoxIndex, _, volpe, _, _, _), Houses),
    % Trova la casa a sinistra della casa con la volpe
    LeftIndex is FoxIndex - 1,
    RightIndex is FoxIndex + 1,
    (   member(house(LeftIndex, _, _, _, _, chesterfield), Houses);
    member(house(RightIndex, _, _, _, _, chesterfield), Houses)).



% 12) In the house near the house with the horse they smoke Kool.
house_near_horse_smokes_kool(Houses) :-
    % Trova la casa con il cavallo e memorizza l'indice
    member(house(CavalloIndex, _, cavallo, _, _, _), Houses),
    % Trova la casa a sinistra della casa con il cavallo
    LeftIndex is CavalloIndex - 1,
    RightIndex is CavalloIndex + 1,
    (   member(house(LeftIndex, _, _, _, _, kool), Houses);
    member(house(RightIndex, _, _, _, _, kool), Houses)).


% 13) The Lucky Strike smoker drinks juice.
lucky_strike_smoker_drinks_juice(Houses) :-
    member(house(_, _, _, succo, _, lucky_strike), Houses).

% 14) The Japanese smokes Kent.
japanese_smokes_kent(Houses) :-
    member(house(_, giapponese, _, _, _, kent), Houses).

% 15) The Norwegian lives near the blue house.
next_to_norwegian_is_blue(Houses) :-
    % Trova la casa del norvegese
    member(house(Norwegian, norvegese, _, _, _, _), Houses),
    % Trova la casa successiva alla casa del norvegese
    RightHouseIndex is Norwegian + 1,
    LeftHouseIndex is Norwegian - 1,
    (   member(house(RightHouseIndex, _, _, _, blu, _), Houses);
    member(house(LeftHouseIndex, _, _, _, blu, _), Houses)).

% Risoluzione del puzzle
solve_houses(Houses) :-
    
    % Vincoli del puzzle
    
    H1 = house(1,norvegese, _, _, _, _),
    H2 = house(2,_, _, _, _, _),
    H3 = house(3,_, _, latte, _, _),
    H4 = house(4,_, _, _, _, _),
    H5 = house(5,_, _, _, _, _),
    Houses = [H1, H2, H3, H4, H5],
    
    
    english_lives_in_red_house(Houses),
    spanish_has_dog(Houses),
    coffee_in_green_house(Houses),
    ukrainian_drinks_tea(Houses),
    green_next_to_white(Houses),
    winston_smoker_has_serpent(Houses),
    yellow_house_smokes_kool(Houses),
    chesterfield_smoker_lives_near_fox_owner(Houses),
    house_near_horse_smokes_kool(Houses),
    lucky_strike_smoker_drinks_juice(Houses),
    japanese_smokes_kent(Houses),
    next_to_norwegian_is_blue(Houses),
    member(house(_, _, _, acqua, _, _), Houses),
	  member(house(_, _, zebra, _, _, _), Houses).
	
zebra_owner(Owner) :-
	solve_houses(Hs),
	member(house(_,Owner,zebra,_,_,_), Hs).

water_drinker(Drinker) :-
	solve_houses(Hs),
	member(house(_,Drinker,_,acqua,_,_), Hs).
