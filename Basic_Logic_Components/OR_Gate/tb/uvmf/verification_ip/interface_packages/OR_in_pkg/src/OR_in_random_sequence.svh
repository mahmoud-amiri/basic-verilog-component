//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.4
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: 
// This sequences randomizes the OR_in transaction and sends it 
// to the UVM driver.
//
// This sequence constructs and randomizes a OR_in_transaction.
// 
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
class OR_in_random_sequence #(
      int OR_in_WIDTH = 8
      )
  extends OR_in_sequence_base #(
      .OR_in_WIDTH(OR_in_WIDTH)
      );

  `uvm_object_param_utils( OR_in_random_sequence #(
                           OR_in_WIDTH
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
      req=OR_in_transaction#(
                .OR_in_WIDTH(OR_in_WIDTH)
                )::type_id::create("req");
      start_item(req);
      // Randomize the transaction
      if(!req.randomize()) `uvm_fatal("SEQ", "OR_in_random_sequence::body()-OR_in_transaction randomization failed")
      // Send the transaction to the OR_in_driver_bfm via the sequencer and OR_in_driver.
      finish_item(req);
      `uvm_info("SEQ", {"Response:",req.convert2string()},UVM_MEDIUM)

  endtask

endclass: OR_in_random_sequence

// pragma uvmf custom external begin
// pragma uvmf custom external end

