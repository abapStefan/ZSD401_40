CLASS zcl_40_42_interfaces_vor_02 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_42_interfaces_vor_02 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DATA partner TYPE REF TO lif_partner.
  DATA rental TYPE REF TO lcl_rental.
  DATA carrier TYPE REF TO lcl_carrier.

  rental = NEW #( iv_name = 'Breidenbach Auto Wunderland' ).

  carrier = NEW #( iv_name = 'Breidenbach BB FLY'  ).

  partner = rental.

  out->write( 'Autovermietung' ).
  out->write( partner->get_name(  ) ).
  out->write( '---------------' ).


  partner = carrier.

  out->write( 'Fluggesellschaft' ).
  out->write( partner->get_name(  ) ).
  out->write( '---------------' ).


ENDMETHOD.
ENDCLASS.

