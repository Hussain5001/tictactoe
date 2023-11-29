function[comp_move]=computerInputEasy()
%returns random input
global p1moves p2moves
possible_moves=setdiff(1:9,union(p1moves,p2moves));
index=randi(length(possible_moves));
comp_move = possible_moves(index);
end