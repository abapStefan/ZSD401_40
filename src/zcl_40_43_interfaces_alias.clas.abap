CLASS zcl_40_43_interfaces_alias DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_43_interfaces_alias IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DATA partner TYPE REF TO lif_partner.
  DATA rental TYPE REF TO lcl_rental.
  DATA carrier TYPE REF TO lcl_carrier.
  DATA bahn    TYPE REF TO lcl_bahn.

  rental = NEW #( iv_name = 'Breidenbach Auto Wunderland' ).

  carrier = NEW #( iv_name = 'Breidenbach BB FLY'  ).

  bahn = NEW #( iv_name = 'Deutsche Bundesbahn' ).

  partner = rental.

  out->write( 'Autovermietung' ).
  out->write( partner->get_name(  ) ).
  out->write( '---------------' ).

  partner = carrier.

  out->write( 'Fluggesellschaft' ).
  out->write( partner->get_name(  ) ).
  out->write( '---------------' ).


   partner = bahn.


*  IF partner IS INSTANCE OF lcl_bahn.
*  bahn = CAST #( partner ).


  out->write( 'Bahn' ).
  out->write( partner->get_name(  ) ).
  out->write( '---------------' ).


*  ENDIF.

ENDMETHOD.
ENDCLASS.

