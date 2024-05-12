class Sequencer;
    SequenceItem current_item;
    Driver driver;
    event sequence_done; // Event to signal the end of the sequence

    function new(Driver driver);
        this.driver = driver;
        cov = new(); // Initialize coverage group
    endfunction

    // Main task to manage sequence flow based on coverage
    task start_sequence();
        current_item = new();

        // Run the sequence until 100% coverage is achieved
        while (cov.get_coverage() < 100) begin
            assert(current_item.randomize()) else $fatal("Randomization failed");
            current_item.display(); // Display the randomized values
            driver.drive(current_item.a, current_item.b);
            cov.sample(); // Collect coverage data
            #10; // Delay between items
        end

        ->sequence_done; // Signal that full coverage is reached and the sequence is complete
    endtask
endclass
