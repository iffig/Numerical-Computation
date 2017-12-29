function j= jacobi(guess, iteration)
   
    % System Equations -- Normal
    %function retn_val = x1(x2, x3)
    %   retn_val = 1 + 8*x2 + 2*x3;
    %end

    %function retn_val = x2(x1, x3)
    %    retn_val = 4 - x1 - 5*x3 ;
    %end

    %function retn_val = x3(x1, x2)
    %    retn_val = x2 - 3*x1 - 2;
    %end
    
    % System Equations -- Diagonally Dominant 
    function retn_val = x1(x2, x3)
       retn_val = (-2 + x2 -x3) / 3;
    end

    function retn_val = x2(x1, x3)
        retn_val = (1 - x1 + 2 * x3) / (-8);
    end

    function retn_val = x3(x1, x2)
        retn_val = (4 - x1 - x2)/5;
    end
    
    guess = [-1 -0.25 1];
    
    for i = 1:iteration+1
        display(guess);
        x1_next = x1(guess(2),guess(3));
        x2_next = x2(guess(1),guess(3));
        x3_next = x3(guess(1),guess(2));
        
        guess(1) = x1_next;
        guess(2) = x2_next;
        guess(3) = x3_next;   
    end  
end