CLASS zcl_40_39_implement_verebung_4 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_39_implement_verebung_4 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

   DATA fahrzeug TYPE REF TO lcl_fahrzeuge.
   DATA lkw       TYPE REF TO lcl_lkw.
   DATA bus       TYPE REF TO lcl_bus.
   DATA fahrzeuge TYPE TABLE OF REF TO lcl_fahrzeuge.        "   Tabelle erstellen

   lkw = NEW #( i_hersteller = 'MAN'
                i_typ        = 'TGX'
                i_ps         =  400
                i_ladung     =  40000 ).


   out->write( 'Ausgabe mit Objektreferenz LKW' ).
   out->write(  lkw->get_attributes(  ) ).
   out->write( '---------------------------------------------------------------------------------' ).

   bus = NEW #( i_hersteller = 'TEMSA'
                i_typ        = 'MD9'
                i_ps         = 337
                i_sitze      = 40 ).

    out->write( 'Ausgabe mit Objektreferenz BUS' ).
    out->write(  bus->get_attributes(  ) ).
    out->write( '---------------------------------------------------------------------------------' ).


    fahrzeug = bus.             " Upcast

    out->write( 'Ausgabe mit Objektreferenz oberklasse nach upcast' ).
    out->write(  fahrzeug->get_attributes(  ) ).
    out->write( '---------------------------------------------------------------------------------' ).

    APPEND fahrzeug TO fahrzeuge.                  " Fahrzeuge in die standard Tabelle aufnehmen

*    CLEAR fahrzeug.

" Implicit up-cast bei der Zuweisung eines NEW-Ausdrucks

    fahrzeug = NEW lcl_lkw( i_hersteller = 'Mercedes-Benz'
                i_typ         = 'Actros L'
                i_ps          = 450
                i_ladung      = 45000 ).

    APPEND fahrzeug TO fahrzeuge.

    out->write( 'Ausgabe mit Objektreferenz der oberklasse nach Implizierten Cast' ).
    out->write(  fahrzeug->get_attributes(  ) ).
    out->write( '---------------------------------------------------------------------------------' ).

* Ausgabe ohne Kenntnis des dynamischen Typs (Unterklasse)

    out->write( 'Ausgabe für beide Ebenen ohne Kenntnis des dynamischen Typs' ).

    LOOP AT fahrzeuge INTO fahrzeug.
    out->write( fahrzeug->get_attributes(  ) ).
    ENDLOOP.

    clear fahrzeug.

* Analyse des dynamischen Typs und des Downcast

    LOOP AT fahrzeuge INTO fahrzeug.

    IF fahrzeug IS INSTANCE OF lcl_bus.
        bus = CAST #( fahrzeug ).                " Hier ein Down-Cast
    ENDIF.

    IF fahrzeug IS INSTANCE OF lcl_lkw.
        DATA(ladung) = CAST lcl_lkw( fahrzeug ).  " Hier wir die Variable zugewiesen, aber nie verwendet (ABAP Cleaner
    ENDIF.                                        " down cast

    ENDLOOP.

    out->write( 'aha-Effekt nach dem Downcast' ).
    out->write( fahrzeug->get_attributes(  ) ).




  ENDMETHOD.
ENDCLASS.
