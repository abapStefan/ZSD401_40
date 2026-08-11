CLASS zcl_40_47_ausnahmeklasse DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_47_ausnahmeklasse IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DATA connection TYPE REF TO LCL_connection.
  DATA exception TYPE REF TO lcx_no_connection.

  TRY.
  connection = NEW #( i_airlineid = 'BB' i_connectionnumber = '0013' ).
  CATCH lcx_no_connection INTO exception.
  out->write( exception->get_text(  ) ).
  ENDTRY.

  ENDMETHOD.
ENDCLASS.
