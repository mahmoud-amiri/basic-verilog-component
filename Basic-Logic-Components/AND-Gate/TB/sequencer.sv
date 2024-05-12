`include "driver.sv"
`include "coverage.sv"
`include "sequenceitem.sv"

class Sequencer;
    SequenceItem current_item;
    Driver driver;
    Coverage coverage; // Coverage class instance
    event sequence_done; // Event to signal the end of the sequence

    function new(Driver driver);
        this.driver = driver;
        coverage = new(); // Initialize the coverage class
    endfunction

    // Main task to manage sequence flow based on coverage
    task start_sequence();
        current_item = new();

        // Run the sequence until 100% coverage is achieved
        while (coverage.get_coverage() < 100) begin
            assert(current_item.randomize()) else $fatal("Randomization failed");
            driver.drive(current_item.a, current_item.b);
            coverage.sample(current_item.a, current_item.b); // Collect coverage data
            #10; // Delay between items
        end

        ->sequence_done; // Signal that full coverage is reached and the sequence is complete
    endtask
endclass
