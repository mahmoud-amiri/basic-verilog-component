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
//   comparator_in_agent_ae receives transactions of type  comparator_in_transaction #()
//
//   This analysis component has the following analysis_ports that can broadcast 
//   the listed transaction type.
//
//  comparator_sb_ap broadcasts transactions of type comparator_out_transaction #()
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//

class comparator_predictor #(
  type CONFIG_T,
  type BASE_T = uvm_component
  ) extends BASE_T;

  // Factory registration of this class
  `uvm_component_param_utils( comparator_predictor #(
                              CONFIG_T,
                              BASE_T
                              ))


  // Instantiate a handle to the configuration of the environment in which this component resides
  CONFIG_T configuration;

  
  // Instantiate the analysis exports
  uvm_analysis_imp_comparator_in_agent_ae #(comparator_in_transaction #(), comparator_predictor #(
                              .CONFIG_T(CONFIG_T),
                              .BASE_T(BASE_T)
                              )) comparator_in_agent_ae;

  
  // Instantiate the analysis ports
  uvm_analysis_port #(comparator_out_transaction #()) comparator_sb_ap;


  // Transaction variable for predicted values to be sent out comparator_sb_ap
  // Once a transaction is sent through an analysis_port, another transaction should
  // be constructed for the next predicted transaction. 
  typedef comparator_out_transaction #() comparator_sb_ap_output_transaction_t;
  comparator_sb_ap_output_transaction_t comparator_sb_ap_output_transaction;
  // Code for sending output transaction out through comparator_sb_ap
  // comparator_sb_ap.write(comparator_sb_ap_output_transaction);

  // Define transaction handles for debug visibility 
  comparator_in_transaction #() comparator_in_agent_ae_debug;


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

    comparator_in_agent_ae = new("comparator_in_agent_ae", this);
    comparator_sb_ap =new("comparator_sb_ap", this );
  // pragma uvmf custom build_phase begin
  // pragma uvmf custom build_phase end
  endfunction

  // FUNCTION: write_comparator_in_agent_ae
  // Transactions received through comparator_in_agent_ae initiate the execution of this function.
  // This function performs prediction of DUT output values based on DUT input, configuration and state
  virtual function void write_comparator_in_agent_ae(comparator_in_transaction #() t);
    // pragma uvmf custom comparator_in_agent_ae_predictor begin
    comparator_in_agent_ae_debug = t;
    `uvm_info("PRED", "Transaction Received through comparator_in_agent_ae", UVM_MEDIUM)
    `uvm_info("PRED", {"            Data: ",t.convert2string()}, UVM_FULL)
    // Construct one of each output transaction type.
    comparator_sb_ap_output_transaction = comparator_sb_ap_output_transaction_t::type_id::create("comparator_sb_ap_output_transaction");
    //  UVMF_CHANGE_ME: Implement predictor model here.  
    
    if (t.A > t.B) begin
      comparator_sb_ap_output_transaction.GT = 1;
      comparator_sb_ap_output_transaction.LT = 0;
      comparator_sb_ap_output_transaction.EQ = 0;
    end else if (t.A < t.B) begin
      comparator_sb_ap_output_transaction.GT = 0;
      comparator_sb_ap_output_transaction.LT = 1;
      comparator_sb_ap_output_transaction.EQ = 0;
    end else begin
      comparator_sb_ap_output_transaction.GT = 0;
      comparator_sb_ap_output_transaction.LT = 0;
      comparator_sb_ap_output_transaction.EQ = 1;
    end  


    
    
 
    // Code for sending output transaction out through comparator_sb_ap
    // Please note that each broadcasted transaction should be a different object than previously 
    // broadcasted transactions.  Creation of a different object is done by constructing the transaction 
    // using either new() or create().  Broadcasting a transaction object more than once to either the 
    // same subscriber or multiple subscribers will result in unexpected and incorrect behavior.
    comparator_sb_ap.write(comparator_sb_ap_output_transaction);
    // pragma uvmf custom comparator_in_agent_ae_predictor end
  endfunction


endclass 

// pragma uvmf custom external begin
// pragma uvmf custom external end

