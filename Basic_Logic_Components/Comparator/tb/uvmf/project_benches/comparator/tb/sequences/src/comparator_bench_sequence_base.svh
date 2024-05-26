//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.4
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//
// Description: This file contains the top level and utility sequences
//     used by test_top. It can be extended to create derivative top
//     level sequences.
//
//----------------------------------------------------------------------
//
//----------------------------------------------------------------------
//


typedef comparator_env_configuration  comparator_env_configuration_t;

class comparator_bench_sequence_base extends uvmf_sequence_base #(uvm_sequence_item);

  `uvm_object_utils( comparator_bench_sequence_base );

  // pragma uvmf custom sequences begin

// This example shows how to use the environment sequence base
// It can only be used on environments generated with UVMF_2022.3 and later.
// Environment sequences generated with UVMF_2022.1 and earlier do not have the required 
//    environment level virtual sequencer
// typedef comparator_env_sequence_base #(
//         .CONFIG_T(comparator_env_configuration_t)// 
//         )
//         comparator_env_sequence_base_t;
// rand comparator_env_sequence_base_t comparator_env_seq;



  // UVMF_CHANGE_ME : Instantiate, construct, and start sequences as needed to create stimulus scenarios.
  // Instantiate sequences here
  typedef comparator_in_random_sequence  comparator_in_agent_random_seq_t;
  comparator_in_agent_random_seq_t comparator_in_agent_random_seq;
  // pragma uvmf custom sequences end

  // Sequencer handles for each active interface in the environment
  typedef comparator_in_transaction  comparator_in_agent_transaction_t;
  uvm_sequencer #(comparator_in_agent_transaction_t)  comparator_in_agent_sequencer; 


  // Top level environment configuration handle
  comparator_env_configuration_t top_configuration;

  // Configuration handles to access interface BFM's
  comparator_in_configuration  comparator_in_agent_config;
  comparator_out_configuration  comparator_out_agent_config;

  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end

  // ****************************************************************************
  function new( string name = "" );
    super.new( name );
    // Retrieve the configuration handles from the uvm_config_db

    // Retrieve top level configuration handle
    if ( !uvm_config_db#(comparator_env_configuration_t)::get(null,UVMF_CONFIGURATIONS, "TOP_ENV_CONFIG",top_configuration) ) begin
      `uvm_info("CFG", "*** FATAL *** uvm_config_db::get can not find TOP_ENV_CONFIG.  Are you using an older UVMF release than what was used to generate this bench?",UVM_NONE);
      `uvm_fatal("CFG", "uvm_config_db#(comparator_env_configuration_t)::get cannot find resource TOP_ENV_CONFIG");
    end

    // Retrieve config handles for all agents
    if( !uvm_config_db #( comparator_in_configuration )::get( null , UVMF_CONFIGURATIONS , comparator_in_agent_BFM , comparator_in_agent_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( comparator_in_configuration )::get cannot find resource comparator_in_agent_BFM" )
    if( !uvm_config_db #( comparator_out_configuration )::get( null , UVMF_CONFIGURATIONS , comparator_out_agent_BFM , comparator_out_agent_config ) ) 
      `uvm_fatal("CFG" , "uvm_config_db #( comparator_out_configuration )::get cannot find resource comparator_out_agent_BFM" )

    // Assign the sequencer handles from the handles within agent configurations
    comparator_in_agent_sequencer = comparator_in_agent_config.get_sequencer();



    // pragma uvmf custom new begin
    // pragma uvmf custom new end

  endfunction

  // ****************************************************************************
  virtual task body();
    // pragma uvmf custom body begin

    // Construct sequences here

    // comparator_env_seq = comparator_env_sequence_base_t::type_id::create("comparator_env_seq");

    comparator_in_agent_random_seq     = comparator_in_agent_random_seq_t::type_id::create("comparator_in_agent_random_seq");
    fork
      comparator_in_agent_config.wait_for_reset();
      comparator_out_agent_config.wait_for_reset();
    join
    // Start RESPONDER sequences here
    fork
    join_none
    // Start INITIATOR sequences here
    fork
      repeat (25) comparator_in_agent_random_seq.start(comparator_in_agent_sequencer);
    join

// comparator_env_seq.start(top_configuration.vsqr);

    // UVMF_CHANGE_ME : Extend the simulation XXX number of clocks after 
    // the last sequence to allow for the last sequence item to flow 
    // through the design.
    fork
      comparator_in_agent_config.wait_for_num_clocks(400);
      comparator_out_agent_config.wait_for_num_clocks(400);
    join

    // pragma uvmf custom body end
  endtask

endclass

// pragma uvmf custom external begin
// pragma uvmf custom external end

