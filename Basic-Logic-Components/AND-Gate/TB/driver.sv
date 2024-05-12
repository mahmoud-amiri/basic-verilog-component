class Driver;
    virtual AndGateIf vif;

    function new(virtual AndGateIf vif);
        this.vif = vif;
    endfunction

    task drive(logic a, logic b);
        vif.a = a;
        vif.b = b;
    endtask
endclass
