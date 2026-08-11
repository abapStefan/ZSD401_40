CLASS zcl_40_06_tech_datentypen DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_06_tech_datentypen IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


* Eingebaute ABAP Standard Typen Vollständig

    DATA gv_num TYPE i.
    gv_num = 2147483647.         " Initialwert = 0.
*    gv_num = gv_num + 1.
    out->write( gv_num ) .

    DATA gv_name TYPE string.    " Beliebige Zeichen und Länge Initialwert / = leer NULL
    gv_name = 'Hallo Stefan'.
    out->write( gv_name ).

    DATA datum TYPE d.           " ausgabe YYYY-MM-TT
    out->write( datum ).

    DATA zeit TYPE t.            " ausgabe HH:MM:SS
    out->Write( zeit ).

* Unvollständige Datentypen

    DATA name TYPE c LENGTH 11 VALUE 'Breidenbach'.            " Data Name ohne Typisierung = standard c typ länge 1
    out->write( Name ).

    DATA plz TYPE n LENGTH 5.
    plz = 37170.
    out->write( plz ).

    DATA erg TYPE p LENGTH 16 DECIMALS 14.
    erg = 10 / 3.
    out->write( erg ).




  ENDMETHOD.
ENDCLASS.
