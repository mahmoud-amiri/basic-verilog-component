//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.4
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//
//----------------------------------------------------------------------
//
// DESCRIPTION: This analysis component contains analysis_exports for receiving
//   data and analysis_ports for sending data.
// 
//   This analysis component has the following analysis_exports that receive the 
//   listed transaction type.
//   
//   AND_inputs_agent_ae receives transactions of type  AND_inputs_transaction #()
//
//   This analysis component has the following analysis_ports that can broadcast 
//   the listed transaction type.
//
//  AND_sb_ap broadcasts transactions of type AND_output_transaction #()
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//

class AND_predictor #(
  type CONFIG_T,
  type BASE_T = uvm_component
  ) extends BASE_T;

  // Factory registration of this class
  `uvm_component_param_utils( AND_predictor #(
                              CONFIG_T,
                              BASE_T
                              ))


  // Instantiate a handle to the configuration of the environment in which this component resides
  CONFIG_T configuration;

  
  // Instantiate the analysis exports
  uvm_analysis_imp_AND_inputs_agent_ae #(AND_inputs_transaction #(), AND_predictor #(
                              .CONFIG_T(CONFIG_T),
                              .BASE_T(BASE_T)
                              )) AND_inputs_agent_ae;

  
  // Instantiate the analysis ports
  uvm_analysis_port #(AND_output_transaction #()) AND_sb_ap;


  // Transaction variable for predicted values to be sent out AND_sb_ap
  // Once a transaction is sent through an analysis_port, another transaction should
  // be constructed for the next predicted transaction. 
  typedef AND_output_transaction #() AND_sb_ap_output_transaction_t;
  AND_sb_ap_output_transaction_t AND_sb_ap_output_transaction;
  // Code for sending output transaction out through AND_sb_ap
  // AND_sb_ap.write(AND_sb_ap_output_transaction);

  // Define transaction handles for debug visibility 
  AND_inputs_transaction #() AND_inputs_agent_ae_debug;


  // pragma uvmf custom class_item_additional begin
  // pragma uvmf custom class_item_additional end

  // FUNCTION: new
  function new(string name, uvm_component parent);
     super.new(name,parent);
    `uvm_warning("PREDICTOR_REVIEW", "This predictor has been created either through generation or re-generation with merging.  Remove this warning after the predictor has been reviewed.")
  // pragma uvmf custom new begin
  // pragma uvmf custom new end
  endfunction

  // FUNCTION: build_phase
  virtual function void build_phase (uvm_phase phase);

    AND_inputs_agent_ae = new("AND_inputs_agent_ae", this);
    AND_sb_ap =new("AND_sb_ap", this );
  // pragma uvmf custom build_phase begin
  // pragma uvmf custom build_phase end
  endfunction

  // FUNCTION: write_AND_inputs_agent_ae
  // Transactions received through AND_inputs_agent_ae initiate the execution of this function.
  // This function performs prediction of DUT output values based on DUT input, configuration and state
  virtual function void write_AND_inputs_agent_ae(AND_inputs_transaction #() t);
    // pragma uvmf custom AND_inputs_agent_ae_predictor begin
    AND_inputs_agent_ae_debug = t;
    `uvm_info("PRED", "Transaction Received through AND_inputs_agent_ae", UVM_MEDIUM)
    `uvm_info("PRED", {"            Data: ",t.convert2string()}, UVM_FULL)
    // Construct one of each output transaction type.
    AND_sb_ap_output_transaction = AND_sb_ap_output_transaction_t::type_id::create("AND_sb_ap_output_transaction");
    //  UVMF_CHANGE_ME: Implement predictor model here.  

    AND_sb_ap_output_transaction.y = t.a & t.b;
    `uvm_info("PREDICT",{"AND_OUPUT: ",AND_sb_ap_output_transaction.convert2string()},UVM_MEDIUM);
    // Code for sending output transaction out through alu_sb_ap
    AND_sb_ap.write(AND_sb_ap_output_transaction);
                

    // Code for sending output transaction out through AND_sb_ap
    // Please note that each broadcasted transaction should be a different object than previously 
    // broadcasted transactions.  Creation of a different object is done by constructing the transaction 
    // using either new() or create().  Broadcasting a transaction object more than once to either the 
    // same subscriber or multiple subscribers will result in unexpected and incorrect behavior.
    //AND_sb_ap.write(AND_sb_ap_output_transaction);
    // pragma uvmf custom AND_inputs_agent_ae_predictor end
  endfunction


endclass 

// pragma uvmf custom external begin
// pragma uvmf custom external end

