//----------------------------------------------------------------------
// Created with uvmf_gen version 2023.4
//----------------------------------------------------------------------
// pragma uvmf custom header begin
// pragma uvmf custom header end
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//     
// DESCRIPTION: This file contains macros used with the AND_inputs package.
//   These macros include packed struct definitions.  These structs are
//   used to pass data between classes, hvl, and BFM's, hdl.  Use of 
//   structs are more efficient and simpler to modify.
//
//----------------------------------------------------------------------
//----------------------------------------------------------------------
//

// ****************************************************************************
// When changing the contents of this struct, be sure to update the to_struct
//      and from_struct methods defined in the macros below that are used in  
//      the AND_inputs_configuration class.
//
  `define AND_inputs_CONFIGURATION_STRUCT \
typedef struct packed  { \
     uvmf_active_passive_t active_passive; \
     uvmf_initiator_responder_t initiator_responder; \
     } AND_inputs_configuration_s;

  `define AND_inputs_CONFIGURATION_TO_STRUCT_FUNCTION \
  virtual function AND_inputs_configuration_s to_struct();\
    AND_inputs_configuration_struct = \
       {\
       this.active_passive,\
       this.initiator_responder\
       };\
    return ( AND_inputs_configuration_struct );\
  endfunction

  `define AND_inputs_CONFIGURATION_FROM_STRUCT_FUNCTION \
  virtual function void from_struct(AND_inputs_configuration_s AND_inputs_configuration_struct);\
      {\
      this.active_passive,\
      this.initiator_responder  \
      } = AND_inputs_configuration_struct;\
  endfunction

// ****************************************************************************
// When changing the contents of this struct, be sure to update the to_monitor_struct
//      and from_monitor_struct methods of the AND_inputs_transaction class.
//
  `define AND_inputs_MONITOR_STRUCT typedef struct packed  { \
  bit [AND_INPUTS_WIDTH-1:0] _a ; \
  bit [AND_INPUTS_WIDTH-1:0] _b ; \
     } AND_inputs_monitor_s;

  `define AND_inputs_TO_MONITOR_STRUCT_FUNCTION \
  virtual function AND_inputs_monitor_s to_monitor_struct();\
    AND_inputs_monitor_struct = \
            { \
            this._a , \
            this._b  \
            };\
    return ( AND_inputs_monitor_struct);\
  endfunction\

  `define AND_inputs_FROM_MONITOR_STRUCT_FUNCTION \
  virtual function void from_monitor_struct(AND_inputs_monitor_s AND_inputs_monitor_struct);\
            {\
            this._a , \
            this._b  \
            } = AND_inputs_monitor_struct;\
  endfunction

// ****************************************************************************
// When changing the contents of this struct, be sure to update the to_initiator_struct
//      and from_initiator_struct methods of the AND_inputs_transaction class.
//      Also update the comments in the driver BFM.
//
  `define AND_inputs_INITIATOR_STRUCT typedef struct packed  { \
  bit [AND_INPUTS_WIDTH-1:0] _a ; \
  bit [AND_INPUTS_WIDTH-1:0] _b ; \
     } AND_inputs_initiator_s;

  `define AND_inputs_TO_INITIATOR_STRUCT_FUNCTION \
  virtual function AND_inputs_initiator_s to_initiator_struct();\
    AND_inputs_initiator_struct = \
           {\
           this._a , \
           this._b  \
           };\
    return ( AND_inputs_initiator_struct);\
  endfunction

  `define AND_inputs_FROM_INITIATOR_STRUCT_FUNCTION \
  virtual function void from_initiator_struct(AND_inputs_initiator_s AND_inputs_initiator_struct);\
           {\
           this._a , \
           this._b  \
           } = AND_inputs_initiator_struct;\
  endfunction

// ****************************************************************************
// When changing the contents of this struct, be sure to update the to_responder_struct
//      and from_responder_struct methods of the AND_inputs_transaction class.
//      Also update the comments in the driver BFM.
//
  `define AND_inputs_RESPONDER_STRUCT typedef struct packed  { \
  bit [AND_INPUTS_WIDTH-1:0] _a ; \
  bit [AND_INPUTS_WIDTH-1:0] _b ; \
     } AND_inputs_responder_s;

  `define AND_inputs_TO_RESPONDER_STRUCT_FUNCTION \
  virtual function AND_inputs_responder_s to_responder_struct();\
    AND_inputs_responder_struct = \
           {\
           this._a , \
           this._b  \
           };\
    return ( AND_inputs_responder_struct);\
  endfunction

  `define AND_inputs_FROM_RESPONDER_STRUCT_FUNCTION \
  virtual function void from_responder_struct(AND_inputs_responder_s AND_inputs_responder_struct);\
           {\
           this._a , \
           this._b  \
           } = AND_inputs_responder_struct;\
  endfunction
// pragma uvmf custom additional begin
// pragma uvmf custom additional end