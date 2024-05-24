//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.4
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: 
// This sequences randomizes the AND_output transaction and sends it 
// to the UVM driver.
//
// This sequence constructs and randomizes a AND_output_transaction.
// 
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
class AND_output_random_sequence #(
      int AND_INPUTS_WIDTH = 8
      )
  extends AND_output_sequence_base #(
      .AND_INPUTS_WIDTH(AND_INPUTS_WIDTH)
      );

  `uvm_object_param_utils( AND_output_random_sequence #(
                           AND_INPUTS_WIDTH
                           ))

  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end
  
  //*****************************************************************
  function new(string name = "");
    super.new(name);
  endfunction: new

  // ****************************************************************************
  // TASK : body()
  // This task is automatically executed when this sequence is started using the 
  // start(sequencerHandle) task.
  //
  task body();
  
      // Construct the transaction
      req=AND_output_transaction#(
                .AND_INPUTS_WIDTH(AND_INPUTS_WIDTH)
                )::type_id::create("req");
      start_item(req);
      // Randomize the transaction
      if(!req.randomize()) `uvm_fatal("SEQ", "AND_output_random_sequence::body()-AND_output_transaction randomization failed")
      // Send the transaction to the AND_output_driver_bfm via the sequencer and AND_output_driver.
      finish_item(req);
      `uvm_info("SEQ", {"Response:",req.convert2string()},UVM_MEDIUM)

  endtask

endclass: AND_output_random_sequence

// pragma uvmf custom external begin
// pragma uvmf custom external end

