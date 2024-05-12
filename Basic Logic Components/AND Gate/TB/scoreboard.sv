class Scoreboard;
    event correct_response;
    event incorrect_response;

    task check(logic expected, logic actual);
        if (expected == actual)
            ->correct_response;
        else
            ->incorrect_response;
    endtask
endclass
