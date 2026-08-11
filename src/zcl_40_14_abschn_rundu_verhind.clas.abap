CLASS zcl_40_14_abschn_rundu_verhind DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_14_abschn_rundu_verhind IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


* Unerwartete Ergebnisse

    DATA var_pack TYPE p LENGTH 3 DECIMALS 2.

    var_pack = 1 / 8 .     "Bekannt var_pack hat 2 deecimal Ergebnis wir gerundet


    out->write( |1 / 8 = { var_pack number = user }| ).  " number = user ist eine Formatoptioon

    TRY.

     var_pack = EXACT #(  1 / 8 ).
               CATCH cx_sy_conversion_error.
     out->Write( |1 / 8 muss gerundet werden. Exact hat eine Ausnahme ausgelöst| ).

   ENDTRY.


  ENDMETHOD.
ENDCLASS.
