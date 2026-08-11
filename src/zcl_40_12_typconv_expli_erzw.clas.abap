CLASS zcl_40_12_typconv_expli_erzw DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_12_typconv_expli_erzw IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.


* Kovertierung des Erzwungenen Typs
* Result1 hat den Typ C
* und wird unformatiert in der Konsole angezeigt

  DATA(result1) = '20260717'.
   out->write(  result1  ).                " Result 1 ist vom Typ des Literalen Typs (Type c )

* reault muss vom Typ d sein
* und wird mit Datumsformatierung in der Konsole angezeigt


 DATA(result2) = CONV d( '20260717' ) .

   out->write(  result2 ).                  " Result2 ist vom Typ der Konvertierung ( Typ D )

  ENDMETHOD.
ENDCLASS.
