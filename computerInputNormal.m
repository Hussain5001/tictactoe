function[next_move]=computerInputNormal()
%checks game endstates for wins and returns nextmove accordingly if not
%endstate returns random value
global p1moves p2moves
player_set=p1moves ; computer_set=p2moves;
possible_moves=setdiff(1:9,union(p1moves,p2moves));
next_move=[];

%checking for possible computer wins
for index=1:length(possible_moves)
    p2moves=[p2moves possible_moves(index)];%temporarily changing value to call function on
    possible_win=winCheck("player2");
    p2moves=computer_set;%changing value back to orignal
    if possible_win
        next_move=possible_moves(index);
        return
    end
end

%checking for possible user wins to block
for index=1:length(possible_moves)
    p1moves=[p1moves possible_moves(index)];%temporarily changing value to call function on
    possible_oponent_win=winCheck("player1");
    p1moves=player_set;%changing value back to orignal
    if possible_oponent_win
        next_move=possible_moves(index);
        return
    end

%if no player has possible win in next move make a random move using
%computerInputEasy function
next_move=computerInputEasy;
end