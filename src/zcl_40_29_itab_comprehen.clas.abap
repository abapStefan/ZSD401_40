CLASS zcl_40_29_itab_comprehen DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_29_itab_comprehen IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    TYPES:
      BEGIN OF st_connection,
        carrier_id             TYPE /dmo/carrier_id,
        connection_id          TYPE /dmo/connection_id,
        departure_airport      TYPE /dmo/airport_from_id,
        departure_airport_name TYPE /dmo/airport_name,
      END OF st_connection.


    TYPES tt_connections TYPE STANDARD TABLE OF st_connection
                         WITH NON-UNIQUE KEY carrier_id connection_id.

    DATA connections TYPE TABLE OF /dmo/connection.
    DATA airports    TYPE TABLE OF /dmo/airport.
    DATA result_table TYPE tt_connections.


    SELECT FROM /dmo/airport
       FIELDS *
         INTO TABLE @airports.

    SELECT FROM /dmo/connection
       FIELDS *
         INTO TABLE @connections.


*   out->write( 'Connection Tabelle' ).
*   out->write( '__________________' ).
*   out->write( connections ).
*   out->write( ` ` ).

*   result_table = corresponding #( connections ).       " Beispiel corresponding zuerst

*    result_table = VALUE #(  FOR line IN connections
*                          ( carrier_id = line-carrier_id
*                            connection_id = line-connection_id
*                            departure_airport = line-airport_from_id
*                            departure_airport_name = airports[ airport_id = line-airport_from_id ]-name ) ).
*
*
*    out->write( 'Ergebnis' ).
*    out->write( '__________________' ).
*    out->write( result_table ).
*    out->write( ` ` ).

* Syntax wie wir sie kennen


*    LOOP AT connections INTO DATA(line).
*
*    APPEND VALUE #(
*            carrier_id   = line-carrier_id
*            connection_id  = line-connection_id
*            departure_airport = line-airport_from_id
*            departure_airport_name = airports[ airport_id = line-airport_from_id ]-name )
*
*    TO result_table.
*
*
*    ENDLOOP.
*
*    out->write( 'Ergebnis' ).
*    out->write( '__________________' ).
*    out->write( result_table ).
*    out->write( ` ` ).


*** Zusammenfassung von Tabelleninhalten

    TYPES: BEGIN OF st_results,
             occupied TYPE /dmo/plane_seats_occupied,
             maximum  TYPE /dmo/plane_seats_max,
           END OF st_results.

    TYPES: BEGIN OF st_results_with_avg,
             occupied TYPE /dmo/plane_seats_occupied,
             maximum  TYPE /dmo/plane_seats_max,
             average TYPE p LENGTH 16 DECIMALS 2,
           END OF st_results_with_avg.

    DATA flights TYPE TABLE OF /dmo/flight.


         SELECT FROM /dmo/flight
             FIELDs *
         INTO TABLE @flights.

    DATA sum TYPE i.

** So würde es mit einer Loop schleife aussehen

*    LOOP AT flights into DATA(line).
*
*      sum = sum + line-seats_occupied.
*
*    ENDLOOP.
*
*   out->write( sum ).

***  Besser aber der Reduce

    sum = REDUCE #( INIT total = 0
                FOR line IN flights
                NEXT total += line-seats_occupied ).

    out->write( 'Ergebnis ist ein scalarer Datentyp' ).
    out->write( '__________________' ).
    out->write( sum ).
    out->write( ` ` ).

** Reduzierung mit einer Struktur als Ergebnis

   data(results) = reduce st_results( init totals type st_results
                   for line in flights
                   next totals-occupied += line-seats_occupied
                   totals-maximum       += line-seats_max ) .

    out->write( 'ergebnis ist eine struktur' ).
    out->write( '__________________' ).
    out->write( results ).
    out->write( ` ` ).


    out->write( 'Ergebnis ist eine Struktur. Der Durchschnitt wird mithilfe einer lokalen Variable berechnet' ).
    out->write( ` ` ).

    DATA(result_with_average) = REDUCE st_results_with_avg(  INIT totals_avg TYPE st_results_with_avg
                                 count = 1
                                 FOR line IN flights
                                 NEXT totals_avg-occupied += line-seats_occupied
                                      totals_avg-maximum  += line-seats_max
                                      totals_avg-average   = totals_avg-occupied / count
                                 count += 1 ).

    out->write(  result_with_average ).



  ENDMETHOD.
ENDCLASS.
