CLASS zcl_40_15_2_absch_rund_verhind DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_15_2_absch_rund_verhind IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


* Abschneiden und Runden verhindern

    DATA var_string TYPE string.
    DATA var_char    TYPE c LENGTH 3.


    var_string = `Breidenbach`.
    var_char = var_string.

    out->write( var_char  ).          " Hier kommt nur Bre inhalt wird abgeschnitten


    Try.

    var_char = EXACT #( var_string ).
    CATCH cx_sy_conversion_error.

    out->write( |String muss abgeschnitten werden. EXACT hat eine Ausnahme ausgelöst|  ).

    ENDTRY.


  ENDMETHOD.
ENDCLASS.
