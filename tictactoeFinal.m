%final version

clc
fprintf("INSTRUCTIONS\n" + ...
    "this is a game of tic tac toe\n" + ...
    "imagine your keypad as a tic tac toe board and use keys accordingly\n\n" + ...
    "KEYS\n" + ...
    " 7 | 8 | 9 \n" + ...
    "_________\n" + ...
    " 4 | 5 | 6 \n" + ...
    "_________\n" + ...
    " 1 | 2 | 3 \n")

global win_list p1moves p2moves against_computer level
%as p1moves and p2moves stores the player's moves therefore declared as
%global for ease of use within functions and similarly as win_list will
%remain constant therefore declared as global for easy use within functions

%defining variables in which player's moves are stored
p1moves=[]; p2moves=[];  

%combinations for possible wins
win_list={[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [3, 5, 7], [1, 5, 9]};

%stores the markers("o"/"x") on specific positions for display 
board=["","","","","","","","",""];

%counter for number of games won
player1_wins=0; player2_wins=0;

victory=false; %determines if a player has won

against_computer=false;
current_game=1;

%first input to start game
while true
    user_inpt=lower(input("enter 'start' to start the game and 'quit' to quit: ","s"));
    if ismember(user_inpt,["start","quit"])
        break
    else
        disp("invalid input");
    end
end


if user_inpt=="start"
    %input for number of games
    while true
        num_games=str2double(input("enter number of games you want to play(max 10): ","s"));
        if ismember(num_games,1:10)
            break
        else
            disp("please enter a number between 1-10");
        end
    end
    
    while true
        oponent=str2double(input("enter 1-PvP enter 2-PvC:","s"));
        if ismember(oponent,1:2)
            if oponent==1
                against_computer = false;
            elseif oponent==2
                against_computer = true;
                disp("I am player2 now")
                while true
                    level=str2double(input("\nchoose between levels(enter a number)\nenter 1-EASY \nenter 2-NORMAL \nenter 3-IMPOSSIBLE: ","s"));
                    if ismember(level,1:3)
                        break
                    else
                        disp("enter either 1 2 or 3")
                    end
                end
            end
            break
        else
            disp("enter either 1 or 2")
              
        end
    end

    while current_game~=num_games+1
        players = ["player1","player2"];
        %randomly choosing who plays first
        who_plays_first = players(randi(length(players)));
        
        % deciding turn1 and turn2 player
        if who_plays_first == "player1"
            
            turn1="player1"; turn2="player2";
            if against_computer == true
                fprintf("\n YOU will play first-'x'(chosen randomly):\n")
            else
                fprintf("\nPlayer 1 will play first-'x'(chosen randomly):\n")
            end
       
        elseif who_plays_first == "player2"
            
            turn1="player2"; turn2 = "player1";
            if against_computer == true
                fprintf("\n I will play first-'x'(chosen randomly):\n")
            else
                fprintf("\nPlayer 1 will play first-'x'(chosen randomly):\n")
            end
        end

        
        fprintf("\n GAME %d\n",current_game)
        %game round satrts
        while true

            %turn1 move
            [board,victory] = playerMove(turn1,board);
            %checking for victory after every move
            if victory == true
                fprintf("\n %s won this round\n",turn1)
                %updating number of games won according of player
                switch turn1
                    case "player1"
                        player1_wins = player1_wins + 1;
                    case "player2"
                        player2_wins = player2_wins + 1; 
                end
                %breaking out of the loop if victory is true
                break
            end
            
            %checking for a tie only after turn1 makes their move as tic
            %tac toe has 9 possible moves which is a odd number and therefore 
            %a tie can only occur after turn1 makes its move which will be
            %the final 9th move
            %checking size of union of both player's move to check if all
            %possible 9 inputs have been entered without victory
            if size(union(p1moves,p2moves))==size(1:9)
                fprintf("IT'S A TIE!")
                break
            end
            
            %turn2 move
            [board,victory] = playerMove(turn2,board);
            %checking for victory after every move
            if victory == true
                fprintf("\n %s won this round\n",turn2)
                %updating number of games won according of player
                switch turn2
                    case "player1"

                        player1_wins = player1_wins + 1;
                    case "player2"
                        player2_wins = player2_wins + 1; 
                end
                %breaking out of the loop if victory is true
                break
            end
            
        end
        %resetting values for next round
        p1moves=[]; p2moves=[];
        board=["","","","","","","","",""];
        current_game=current_game+1;

    end
    %checking for who won more games
    if player1_wins>player2_wins
        if against_computer==true
            fprintf("\nYOU WON THE TOURNAMENT\nplayer1:%d playre2:%d\n",player1_wins,player2_wins)
        else
            fprintf("\nPLAYER1 WON THE TOURNAMENT\nplayer1:%d playre2:%d\n",player1_wins,player2_wins)
        end
        
    elseif player2_wins>player1_wins
        if against_computer==true
            fprintf("\nI WON THE TOURNAMENT\nplayer1:%d playre2:%d\n",player1_wins,player2_wins)
        else
            fprintf("\nPLAYER2 WON THE TOURNAMENT\nplayer1:%d playre2:%d\n",player1_wins,player2_wins)
        end
        
    else
        fprintf("\nTHE ENTIRE TOURNAMENT WAS A TIE!\nplayer1:%d playre2:%d\n",player1_wins,player2_wins)
    end
    
end