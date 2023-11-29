function[display] = displayBoard(move,player,display)
%this function takes in the move made by the player and depending on which
%player made the move displays either "x" or "o" on the tictactoe board

%also the players sets p1moves and p2moves will be give given in parameters
%as setp1 and setp2 instead of declaring them as global and comparing them

if player=="player1"
    marker="x";
elseif player=="player2"
    marker="o";
end

if move==1
    display(1) = marker;
elseif move==2
    display(2) = marker;
elseif move==3
    display(3) = marker;
elseif move==4
    display(4) = marker;
elseif move==5
    display(5) = marker;
elseif move==6
    display(6) = marker;
elseif move==7
    display(7) = marker;
elseif move==8
    display(8) = marker;
elseif move==9
    display(9) = marker;
end

fprintf( "\n\n"+...
    "     %s | %s | %s \n" + ...
    "    _________\n" + ...
    "     %s | %s | %s \n" + ...
    "    _________\n" + ...
    "     %s | %s | %s \n\n",display(7),display(8),display(9),display(4),display(5),display(6),display(1),display(2),display(3));


end
