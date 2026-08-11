CLASS zcl_40_32_feldsymbol_bsp DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_32_feldsymbol_bsp IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


* Führen die klasse mit dem Profil AS-ABAP Application aus

* in der analyse die vergleichenden Laufzeiten beobachten

  DATA(flights) = NEW lcl_demo(  ).

  flights->use_work_area(  ).
  flights->use_field_symbol(  ).

  out->write( 'Oha' ).


  ENDMETHOD.

ENDCLASS.

