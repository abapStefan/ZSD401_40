CLASS zcl_40_40_upcast_downcast DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_40_upcast_downcast IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  DATA go_vehicle TYPE REF TO lcl_vehicle.  " ->super Class  " Statischer Typ
  DATA go_truck TYPE REF TO lcl_truck.      " ->sub Class
  DATA go_truck2 LIKE go_truck.


  CREATE OBJECT go_truck.                   "  Instanz muss erst einmal erstellt werden, sont nirvane

  cREATE object go_vehicle.

*  go_truck ?= go_vehicle.                  " Fehler Vehicle ist kein auto

* Normal kann auf alles seiner Klasse zugreifen

    go_truck->a = 'a'.
    go_truck->b = 'b'.
    go_truck->c = 'c'.
    go_truck->e = 'e'.
    go_truck->get_make( ).
    go_truck->get_count(  ).
    go_truck->get_cargo(  ).

    go_vehicle = go_truck.            " Upcast / Kein Zugriff auf öffentlichen Kompnenten  Truck -> Fahrzeug
                                      " Sicht wird eingeengt

    go_truck = CAST #( go_vehicle ).

    go_vehicle->a = 'a'.
    go_vehicle->b = 'b'.
    go_vehicle->c = 'c'.
    go_vehicle->get_count( ).
    go_vehicle->get_make( ).

*    go_truck2 ?= go_vehicle.           " Downcast Fahrzeug -> truck
*                                       " sicht erweitert

    IF go_vehicle IS INSTANCE OF lcl_truck.    " IS INSTANCE OF = "Ist das Objekt wirklich ein LKW?" (Prüfung) ?=
    go_truck2 ?= go_vehicle.                   " ?= Dann behandle es als LKW." (Downcast)


    go_truck2->a = 'a'.
    go_truck2->b = 'b'.
    go_truck2->c = 'c'.
    go_truck2->e = 'e'.
    go_truck2->get_make( ).
    go_truck2->get_count(  ).
    go_truck2->get_cargo(  ).

    ENDIF.




  out->write( 'out' ).

  ENDMETHOD.
ENDCLASS.
