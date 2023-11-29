function[win] = winCheck(player)
%function takes in the current player's set of moves and compares them
%against the combinations in win_list to determine if the player has a
%winning combination

global win_list p1moves p2moves
if player=="player1"
    player_set=p1moves;
elseif player=="player2"
    player_set=p2moves;
end

for index=1:length(win_list)
    %intersecrt in the following line filters the common elements in player
    %set and a combination of win_list
    %only if all elements in combination of win_list exist in player set,
    %then their size would be the same meaning the player has a winning
    %combo therefore win is true
    if size(intersect(win_list{index},player_set))==size(win_list{index})
        win=true;
        return
    else
        win=false;

        
    end
end