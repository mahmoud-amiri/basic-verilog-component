//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.4
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: 
// This sequences randomizes the decoder_in transaction and sends it 
// to the UVM driver.
//
// This sequence constructs and randomizes a decoder_in_transaction.
// 
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
class decoder_in_random_sequence #(
      int decoder_in_WIDTH = 8
      )
  extends decoder_in_sequence_base #(
      .decoder_in_WIDTH(decoder_in_WIDTH)
      );

  `uvm_object_param_utils( decoder_in_random_sequence #(
                           decoder_in_WIDTH
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
      req=decoder_in_transaction#(
                .decoder_in_WIDTH(decoder_in_WIDTH)
                )::type_id::create("req");
      start_item(req);
      // Randomize the transaction
      if(!req.randomize()) `uvm_fatal("SEQ", "decoder_in_random_sequence::body()-decoder_in_transaction randomization failed")
      // Send the transaction to the decoder_in_driver_bfm via the sequencer and decoder_in_driver.
      finish_item(req);
      `uvm_info("SEQ", {"Response:",req.convert2string()},UVM_MEDIUM)

  endtask

endclass: decoder_in_random_sequence

// pragma uvmf custom external begin
// pragma uvmf custom external end

