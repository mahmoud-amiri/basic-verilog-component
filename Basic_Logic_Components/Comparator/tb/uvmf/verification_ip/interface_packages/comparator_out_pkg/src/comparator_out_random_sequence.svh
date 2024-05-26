//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.4
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: 
// This sequences randomizes the comparator_out transaction and sends it 
// to the UVM driver.
//
// This sequence constructs and randomizes a comparator_out_transaction.
// 
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
class comparator_out_random_sequence #(
      int comparator_out_WIDTH = 8
      )
  extends comparator_out_sequence_base #(
      .comparator_out_WIDTH(comparator_out_WIDTH)
      );

  `uvm_object_param_utils( comparator_out_random_sequence #(
                           comparator_out_WIDTH
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
      req=comparator_out_transaction#(
                .comparator_out_WIDTH(comparator_out_WIDTH)
                )::type_id::create("req");
      start_item(req);
      // Randomize the transaction
      if(!req.randomize()) `uvm_fatal("SEQ", "comparator_out_random_sequence::body()-comparator_out_transaction randomization failed")
      // Send the transaction to the comparator_out_driver_bfm via the sequencer and comparator_out_driver.
      finish_item(req);
      `uvm_info("SEQ", {"Response:",req.convert2string()},UVM_MEDIUM)

  endtask

endclass: comparator_out_random_sequence

// pragma uvmf custom external begin
// pragma uvmf custom external end

