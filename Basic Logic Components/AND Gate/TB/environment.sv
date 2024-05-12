class Environment;
    Agent agent;
    Scoreboard scoreboard;

    function new(virtual AndGateIf vif);
        agent = new(vif);
        scoreboard = new();
    endfunction
endclass
