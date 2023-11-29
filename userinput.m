function[move] = userinput(set1,set2)
%userinput takes users move and checks against certain conditions
while true
    %taking input as string so as to not get error if string inputed
    %coverting string to double
    move=str2double(input("make a move:","s")); 
    %checking if number between 1 to 9 and not in se1 and set2
    if ismember(move,1:9) && ismember(move,union(set1,set2))==false
        return
    else
        disp("invalid input")
    end
end
end