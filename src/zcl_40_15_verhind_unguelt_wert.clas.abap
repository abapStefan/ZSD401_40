CLASS zcl_40_15_verhind_unguelt_wert DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_15_verhind_unguelt_wert IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


  DATA var_date TYPE D.

     var_date = 'KASALLAA'.
      out->write(  var_date ).

     TRY.
        var_date = EXACT #( 'KASALLAA' ).
        CATCH cx_sy_conversion_error..
        out->write( |Kasallaa ist kein gültiges Datum. EXACT hat eine Ausnahme ausgelöst| ).

     ENDTRY.

        var_date = '20260732'.

    out->write(  var_date ).
*

    TRY.
        var_date = EXACT #( '20260732' ).
        CATCH cx_sy_conversion_error..
        out->write( |2026-07-32  ist kein gültiges Datum. EXACT hat eine Ausnahme ausgelöst| ).
    ENDTRY.


  ENDMETHOD.
ENDCLASS.
