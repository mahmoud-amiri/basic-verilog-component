class Monitor;
    virtual AndGateIf vif;
    event y_changed;

    function new(virtual AndGateIf vif);
        this.vif = vif;
    endfunction

    task monitor_output();
        forever begin
            @(vif.y);
            ->y_changed; // Trigger event when output changes
        end
    endtask
endclass
