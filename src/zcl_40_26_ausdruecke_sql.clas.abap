CLASS zcl_40_26_ausdruecke_sql DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_26_ausdruecke_sql IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*  DATA lv_demo_1 TYPE c LENGTH 20.
*  DATA ls_demo_1 TYPE /dmo/carrier.
*  DATA lv_demo_2 TYPE /dmo/carrier_id.


*  SELECT SINGLE FROM /dmo/carrier
*
*        FIELDS 'Demo-1' AS a,
*               'Demo-2' AS b
*
*        INTO @DATA(ls_result).

*   SELECT FROM /dmo/carrier
*
*         FIELDS carrier_id,
*                 20 AS c,
*                 'Demo-1' AS a,
*                 'Demo-2' AS b
*
*         WHERE carrier_id = 'AA'
*
*       INTO TABLE @DATA(ls_result).
*
*  out->write( ls_result ).

* Abbildung 91

*SELECT SINGLE FROM /dmo/connection
*
*       FIELDS airport_from_id,
*              `Demo-1` AS demo_1,
*              'Demo-2' AS demo_2,
*              '123' && '567' AS Kette,
*
*              CAST( '12345678' AS CHAR( 6 ) ) AS banane,
*              CAST( '123456' AS FLTP ) AS birne,
*              CAST( '112345622.12' AS DEC( 10,2 ) ) AS dec_info,   " Hier Runtime Error
*
*             CAST( '20260722' AS char( 4 ) ) AS char_4,
*             CAST( '20260722' AS NUMC( 8 ) ) AS numc_8,
*             CAST( '20260722' AS int4 ) AS Interger,
*             CAST( '20260722' AS DEC( 10,2 ) ) AS dec_10_2,
*             CAST( '20260722' AS fltp ) AS fltp,
*             CAST( '20260722' AS DATS ) AS date
*
*       INTO @DATA(ls_demo).
*
*       out->write( ls_demo ).


** Einfache Fallunterscheidung

*   SELECT FROM /dmo/customer
*             FIELDS customer_id,
*                    title,
*              CASE  title
*                   WHEN 'Mr.' THEN 'Herr'
*                   WHEN 'Mrs.' THEN 'Frau'
*              ELSE   ' '
*              END AS title_de
*              WHERE country_code = 'AT'
*              INTO TABLE @DATA(result_simple).
*
*         out->write( result_simple ).

** Komplexe Fallunterscheidung

*    SELECT FROM /dmo/flight
*            FIELDS flight_date,
*                   seats_max,
*                   seats_occupied,
*             CASE
*                WHEN seats_occupied < seats_max THEN 'Plätze verfügbar'
*                WHEN seats_occupied = seats_max THEN 'Voll gebucht'
*                WHEN seats_occupied > seats_max THEN 'Überbucht'
*             ELSE                                    'Das ist nich möglich'
*             END AS buchungs_status
*
**          WHERE carrier_id = 'AA'
**          AND connection_id = 0017
*
*         INTO TABLE @DATA(result_complex).
*
*    out->write( result_complex ).

** Beispiel arithmetische Ausdrücke in ABAP-SQL


*   CONSTANTS c_number TYPE f VALUE '100.0'.
*
*    SELECT FROM /dmo/flight
*          FIELDS seats_max,
*                 seats_occupied,
*                 seats_max - seats_occupied AS seats_avaliable,
*
*                 CAST(
*                   (    CAST( seats_occupied AS FLTP )
*                     *  CAST( 100 AS FLTP )
*                   ) /  Cast( seats_max AS FLTP ) AS DEC( 10,2 ) ) AS percentage_dec,
*
*
*
*                   (    CAST( seats_occupied AS FLTP )
*                     *  @c_number "CAST( 100 AS FLTP )                      " geht auch mit constanten
*                   ) /  Cast( seats_max AS FLTP )  AS  percentage_fltp
*
*            WHERE carrier_id = 'LH'
*
*
*           INTO table @DATA(result).
*
*           out->write( result ).

** Verwendung numerischer Funktion

*     SELECT FROM /dmo/flight
*           FIELDS seats_max,
*                  seats_occupied,
*
*                  (    CAST( seats_occupied AS FLTP )
*                     * CAST( 100 AS FLTP )
*                  )  / Cast( seats_max AS FLTP )  AS  percentage_fltp,
*
*                   div( seats_occupied * 100, seats_max ) AS percentage_int,
*
*                   division( seats_occupied * 100, seats_max, 2 ) AS percentage_dec
*
*           WHERE carrier_id = 'LH'
*
*           INTO table @DATA(result).
*
*           out->write( result ).

** Verwendung des Operators && in ABAP SQL   1

*       SELECT from /dmo/customer
*       FIELDS customer_id,
*
*               title && ' ' && first_name && ' ' && last_name AS full_name,
*
*               street && ',' && postal_code && ' ' && city AS adress_expr
*
*
*       WHERE country_code = 'ES'
*       into table @DATA(result).
*
*       out->write( result ).


       SELECT from /dmo/customer
       FIELDS customer_id,


*               street && ',' && postal_code && ' ' && city AS adress_expr,

               concat( street,
                    concat_with_space(  ',',
                         concat_with_space(
                                    postal_code,
                                    upper( city ), 1 ), 1 ) ) AS adrress_func


       WHERE country_code = 'ES'
       into table @DATA(result).

       out->write( result ).


** Verwendung der Zeichenkettenfunktion   2


*    SELECT FROM /dmo/carrier
*          FIELDS carrier_id,
*                 name,
*                 upper( name )   AS name_upper,
*                 lower( name )   AS name_lower,
*                 initcap( name ) AS name_initcap
*
*           WHERE carrier_id = 'SR'
*           INTO TABLE @DATA(result_transform).
*
*           out->write( result_transform ).


** Verwendung der Zeichenkettenfunktion   3


*    SELECT FROM /dmo/flight
*          FIELDS flight_date,
*             CAST( flight_date AS CHAR( 8 ) ) AS flight_date_raw,
*
*                left(       flight_date, 4    )  AS year,
*                right(      flight_date, 2    )  AS day,
*                substring(  flight_date, 5, 2 )  AS month
*
*           WHERE carrier_id = 'LH'
*           INTO TABLE @DATA(result_substring).
*
*           out->write( result_substring ).






  ENDMETHOD.
ENDCLASS.
