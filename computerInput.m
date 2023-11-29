function[move] = computerInput()
global level p1moves p2moves

if level==1
    move=computerInputEasy;

elseif level==2
    move = computerInputNormal;

elseif level==3
    %initialize the recursive algorithm to determine best move
    best_score = -Inf;
    orignal_set=p2moves;
    possible_moves=setdiff(1:9,union(p1moves,p2moves));
    for index=1:length(possible_moves)
        p2moves=[p2moves possible_moves(index)];
        
        score=computerInputHard(false);
        
        p2moves=orignal_set;
        
        if score>best_score
            best_score=score;
            move=possible_moves(index);
        end
    
    end


end