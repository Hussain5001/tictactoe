function[board,win] = playerMove(player_num,board)
%calls other function in logical order while checking if game is pvc and
%calls functions accordingly
global p1moves p2moves against_computer
if player_num == "player1"
    move = userinput(p1moves,p2moves);
    p1moves = [p1moves move];
elseif player_num == "player2"
    if against_computer == true
        move = computerInput;
        
        p2moves = [p2moves move];
    elseif against_computer == false
        move = userinput(p1moves,p2moves);
        p2moves = [p2moves move];
    end
end
board = displayBoard(move,player_num,board);
win = winCheck(player_num);

end 