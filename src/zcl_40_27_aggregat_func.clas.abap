CLASS zcl_40_27_aggregat_func DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_27_aggregat_func IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*  SELECT FROM /dmo/connection
*      FIELDS carrier_id,
*             connection_id,
*             airport_from_id,
*             distance
*
**        WHERE carrier_id = 'AA'
*
*        ORDER BY carrier_id
*
*      INTO TABLE @DATA(result_raw).
*
*      out->write( result_raw ).


*  SELECT FROM /dmo/flight
*      FIELDS " DISTINCT
*             carrier_id,
*             connection_id,
*             flight_date,
*             seats_max - seats_occupied AS sitze
*
**        WHERE carrier_id = 'LH'
*
**        ORDER BY seats_max - seats_occupied DESCENDING,
**                 flight_date ASCENDING
*
*      INTO TABLE @DATA(result_sitze).
*
*      out->write( result_sitze ).

******************************************************************************************

    SELECT FROM /dmo/connection
          FIELDS  carrier_id,
                 MIN( distance ) AS min_dist,
                 MAX( distance ) AS max_dist,
                 SUM( distance ) AS sum_dist,
*                 AVG( distance AS fltp ) AS DEC ) AS avg_dist,
                 CAST( AVG( distance AS FLTP ) AS DEC  ) AS avg_dist,
                 COUNT(  *  ) AS count,
                 COUNT( DISTINCT airport_from_id ) AS count_dist_airpfrom

       WHERE carrier_id = 'AA'

          GROUP BY carrier_id
           INTO TABLE @DATA(result_aggregate).
           out->write( result_aggregate ).


  ENDMETHOD.
ENDCLASS.
