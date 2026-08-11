CLASS zcl_40_28_verarbeitung_itab DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_28_verarbeitung_itab IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

  TYPES tt_flights TYPE STANDARD TABLE OF /dmo/flight
                   WITH NON-UNIQUE KEY carrier_id connection_id flight_date.

  DATA flights TYPE tt_flights.

 SELECT FROM /dmo/flight
     FIELDS *
     INTO TABLE @flights.

** Tabelle selbst füllen

*     flights = VALUE #( (
*     client = sy-mandt
*     carrier_id = 'LH'
*     connection_id = 0400
*     flight_date = '20260723'
*     plane_type_id = '747-400'
*     price = '600'
*     currency_code = 'EUR' )
*
*
*   ( client = sy-mandt
*     carrier_id = 'LH'
*     connection_id = 0400
*     flight_date = '20270813'
*     plane_type_id = '747-400'
*     price = '600'
*     currency_code = 'EUR' ) ).

*      SORT flights.                                    " Abbildung 117
*      SORT FLIGHTS BY currency_code flight_date.       " Abbildung 118
      SORT FLIGHTS BY currency_code ASCENDING           " Abbildung 119
                        flight_date DESCENDING.

     SORT flights BY carrier_id connection_id.          " Erst Sortieren Einträge müssen nebeneinander liegen
*     DELETE ADJACENT DUPLICATES FROM flights.           " Abbildung 120 / 121 / 122  " nichts passiert ohne comparing


     DELETE ADJACENT DUPLICATES FROM flights
     COMPARING carrier_id connection_id.                " Abbildung 123
*
*
     out->write( flights ).

  ENDMETHOD.
ENDCLASS.
