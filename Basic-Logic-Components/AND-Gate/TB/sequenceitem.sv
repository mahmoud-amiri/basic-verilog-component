class SequenceItem;
    rand logic a, b; // Make the inputs randomizable

    // Constraint for generating sequence items (optional)
    constraint c_valid_combinations {
        (a == 0 && b == 0) ||
        (a == 0 && b == 1) ||
        (a == 1 && b == 0) ||
        (a == 1 && b == 1);
    }

    // Function to display values - useful for debugging
    function void display();
        $display("Sequence Item: a=%0d, b=%0d", a, b);
    endfunction
endclass
