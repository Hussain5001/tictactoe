function [best_score]=computerInputHard(maximising_player)
%uses the minimax recursive function to determine future states and then
%plays accordingly
global p1moves p2moves
win=winCheck("player2");
if win
    best_score=1;
    return
elseif size(union(p1moves,p2moves))==size(1:9) %check for tie
    best_score=0;
    return
else
    win=winCheck("player1");
    if win
        best_score=-1;
        return
    end
end

if maximising_player
    
    best_score = -Inf;
    orignal_set=p2moves;
    possible_moves=setdiff(1:9,union(p1moves,p2moves));
    for index=1:length(possible_moves)
        p2moves=[p2moves possible_moves(index)];
        %reccursion
        score=computerInputHard(false);
        
        p2moves=orignal_set;
        %if current scre better then updates best score and best move
        if score>best_score
            best_score=score;
            move=possible_moves(index);
        end
     end
     return
end

        
if maximising_player==false
    best_score = Inf;
    orignal_set=p1moves;
    possible_moves=setdiff(1:9,union(p1moves,p2moves));
    for index=1:length(possible_moves)
        p1moves=[p1moves possible_moves(index)];
        %reccursion9

        score=computerInputHard(true);
        
        p1moves=orignal_set;
        %if current scre better then updates best score and best move
        if score<best_score
            best_score=score;
            move=possible_moves(index);
        end
    end
    return

end

end

