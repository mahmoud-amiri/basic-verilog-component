//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.4
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: 
// This sequences randomizes the decoder_out transaction and sends it 
// to the UVM driver.
//
// This sequence constructs and randomizes a decoder_out_transaction.
// 
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
class decoder_out_random_sequence #(
      int decoder_out_WIDTH = 2**8
      )
  extends decoder_out_sequence_base #(
      .decoder_out_WIDTH(decoder_out_WIDTH)
      );

  `uvm_object_param_utils( decoder_out_random_sequence #(
                           decoder_out_WIDTH
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
      req=decoder_out_transaction#(
                .decoder_out_WIDTH(decoder_out_WIDTH)
                )::type_id::create("req");
      start_item(req);
      // Randomize the transaction
      if(!req.randomize()) `uvm_fatal("SEQ", "decoder_out_random_sequence::body()-decoder_out_transaction randomization failed")
      // Send the transaction to the decoder_out_driver_bfm via the sequencer and decoder_out_driver.
      finish_item(req);
      `uvm_info("SEQ", {"Response:",req.convert2string()},UVM_MEDIUM)

  endtask

endclass: decoder_out_random_sequence

// pragma uvmf custom external begin
// pragma uvmf custom external end

