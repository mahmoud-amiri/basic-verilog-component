class Coverage;
    byte unsigned a;
    byte unsigned b;
    covergroup cg_with;
        coverpoint a {
            bins low = {0};
            bins high = {1};
        }
        coverpoint b {
            bins low = {0};
            bins high = {1};
        }
        cross a, b; // Cross coverage of inputs 'a' and 'b'
    endgroup

    function new();
        cg_with = new();
    endfunction

    function void sample(logic a, logic b);
        this.a = a; // Assign to internal member or directly use in sample
        this.b = b;
        cg_with.sample();
    endfunction

    // Method to get coverage percentage
    function real get_coverage();
        return cg_with.get_coverage();
    endfunction
endclass
