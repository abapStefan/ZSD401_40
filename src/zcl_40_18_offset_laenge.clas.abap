CLASS zcl_40_18_offset_laenge DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_18_offset_laenge IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

   DATA var_date TYPE d.
   DATA var_month TYPE n LENGTH 2.

   var_date = cl_abap_context_info=>get_system_date(  ).

   var_month = var_date+4(2).   " Offset und länge / Jahr: var_date(4) / monat: var_date+4( 2 ) ) tag: var_date+6(2)


   out->write( var_date ).
   out->write( var_month ).

  ENDMETHOD.
ENDCLASS.
