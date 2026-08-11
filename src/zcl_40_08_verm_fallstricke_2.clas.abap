CLASS zcl_40_08_verm_fallstricke_2 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_08_verm_fallstricke_2 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


* Nicht Erfolgreiche Zuweisung Abbild 40

    DATA var_string TYPE string.
    DATA var_int    TYPE i.
    DATA var_pack   TYPE p LENGTH 3 DECIMALS 2.

 TRY.

    var_string = `ABCDE`.                     "  Hier wird die Ausnahme cx_sy_conversion_no_number augelöst
    var_int = var_string.

    out->write( var_int  ).

    var_string = `1000`.                      "  Hier wird die Ausnahme cx_sy_conversion_overflow augelöst 999.99 geht aber
    var_pack = var_string.

    out->write( var_pack  ).

 CATCH cx_sy_conversion_no_number.
       out->write( |String ist kein Integer| ).
 CATCH cx_sy_conversion_overflow.
       out->write( |Nummer ist zu lang| ).

 ENDTRY.




  ENDMETHOD.
ENDCLASS.
