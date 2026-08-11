CLASS zcl_40_23_joins_implementieren DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_23_joins_implementieren IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

* 1 Beispiel
* Select Anweisung für den Einzelsatz Carrier

*  SELECT SINGLE  FROM /dmo/carrier
*      FIELDS carrier_id, name, currency_code
*      WHERE carrier_id = 'LH'
*      INTO @DATA(ls_result).
*
*      out->write( ls_result ).

*  ENDSELECT.  " wenn kein Select Single

* 2 Beispiel
* Select Anweisung für den Einzelsatz Connection

*  SELECT SINGLE  FROM /dmo/connection
*      FIELDS carrier_id, connection_id, airport_from_id, airport_to_id
*      WHERE carrier_id = 'LH'
*      INTO @DATA(ls_result2).
*
*      out->write( ls_result2 ).

* 3 Beispiel Inner Join beide Tabellen zusammen

*    SELECT FROM /dmo/carrier
*     INNER JOIN /dmo/connection
*            ON /dmo/carrier~carrier_id = /dmo/connection~carrier_id   " Join Bedingung
*         FIELDS /dmo/carrier~carrier_id,
*                /dmo/carrier~name AS carrier_name,    " Ohne AS Carrier_name steht nur name in der Ausgabe
*                /dmo/connection~connection_id,
*                /dmo/connection~airport_from_id,
*                /dmo/connection~airport_to_id,
*                /dmo/carrier~currency_code
*        WHERE  /dmo/carrier~currency_code = 'EUR'
*
*        INTO TABLE @DATA(ls_result).
*
*      out->write( ls_result ).


* 4 Beispiel Inner Join

*   SELECT FROM /dmo/carrier
*     INNER JOIN /dmo/connection
*            ON /dmo/carrier~carrier_id = /dmo/connection~carrier_id   " Join Bedingung
*
*         FIELDS  /dmo/carrier~carrier_id,
*                 name AS carrier_name,
*                 connection_id,
*                 airport_from_id,
*                 airport_to_id,
*                 currency_code
*        WHERE  /dmo/carrier~currency_code = 'EUR'
*
*        INTO TABLE @DATA(ls_result).
*
*      out->write( ls_result ).

** 5 Beispiel Inner Join Aliase
*
   SELECT FROM /dmo/carrier AS a
     INNER JOIN /dmo/connection AS b
            ON a~carrier_id = b~carrier_id   " Join Bedingung

         FIELDS  a~carrier_id,
                 name AS carrier_name,
                 connection_id,
                 airport_from_id,
                 airport_to_id,
                 currency_code
        WHERE    currency_code = 'EUR'

        INTO TABLE @DATA(ls_result).

      out->write( ls_result ).

** 6 Beispiel Erforderliche Aliase in Selfjoins   (Ähnlich Zerti)

*   SELECT FROM /dmo/connection AS a
*     INNER JOIN /dmo/connection AS b
*            ON  a~airport_to_id = b~airport_from_id  " Join Bedingung
*            AND a~airport_from_id <> b~airport_to_id  " Rückflüge werden ausgeschlossen
*
*         FIELDS  a~airport_from_id,
*
*              concat_with_space( a~carrier_id, a~connection_id, 1  ) AS erster_flug,
*
*              a~airport_to_id AS ueber_airport_id,
*
*              concat_with_space( b~carrier_id, b~connection_id, 1  ) AS zweiter_flug,
*
*              b~airport_to_id
*
*             WHERE a~airport_from_id = 'FRA'
*
*        INTO TABLE @DATA(ls_result).
*
*      out->write( ls_result ).




  ENDMETHOD.
ENDCLASS.
