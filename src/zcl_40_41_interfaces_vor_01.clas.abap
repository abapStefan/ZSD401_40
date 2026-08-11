CLASS zcl_40_41_interfaces_vor_01 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_41_interfaces_vor_01 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DATA rental TYPE REF TO lcl_rental.
  DATA carrier TYPE REF TO lcl_carrier.

  rental = NEW #( iv_name = 'Breidenbach Auto Wunderland' ).

  carrier = NEW #( iv_name = 'Breidenbach BB FLY'  ).

  out->write( 'Autovermietung' ).
  out->write( rental->mv_name ).
  out->write( '---------------' ).


  out->write( 'Fluggesellschaft' ).
  out->write( carrier->mv_name ).
  out->write( '---------------' ).


ENDMETHOD.
ENDCLASS.

