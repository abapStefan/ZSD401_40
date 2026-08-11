CLASS zcl_40_10_unerwartete_ergebnis DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_10_unerwartete_ergebnis IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


* Unerwartete Ergebnisse

    DATA var_date TYPE d.
    DATA var_string TYPE string.
    DATA var_int    TYPE i.
    DATA var_n   TYPE n LENGTH 4.


    var_date = cl_abap_context_info=>get_system_date(  ).

    out->write( var_date ).            " Hier kommt das Systemdatum

    var_int = var_date.                " Anzahl der Tage seit  01.01.0001

    out->write( var_int ).

    var_string = `R2D2`.               " 0022 weil ungültige Zeichen werden entfernt

    var_n = var_string.

    out->write( var_n ).

    var_date = 'KASALLAA'.            " Warnung. aber das Datum kann ungültige Werte enthalten

    out->write( var_date ).

  ENDMETHOD.
ENDCLASS.
