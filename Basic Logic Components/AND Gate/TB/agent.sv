class Agent;
    Driver driver;
    Monitor monitor;
    Sequencer sequencer;
    virtual AndGateIf vif;

    function new(virtual AndGateIf vif);
        this.vif = vif;
        driver = new(vif);
        monitor = new(vif);
        sequencer = new();
    endfunction
endclass
