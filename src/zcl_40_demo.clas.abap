CLASS zcl_40_demo DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_demo IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DATA bus TYPE REF TO zcl_40_bus.

  bus = NEW #( i_hersteller = 'TEMSA'
                i_typ        = 'MD9'
                i_ps         = 337
                i_sitze      = 40 ).

    out->write( 'Ausgabe mit Objektreferenz BUS' ).
    out->write(  bus->get_attributes(  ) ).
    out->write( '---------------------------------------------------------------------------------' ).


  ENDMETHOD.
ENDCLASS.
