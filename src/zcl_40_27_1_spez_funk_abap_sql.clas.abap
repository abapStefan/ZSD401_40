CLASS zcl_40_27_1_spez_funk_abap_sql DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_27_1_spez_funk_abap_sql IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*  SELECT FROM /dmo/travel
*        FIELDS begin_date,
*               end_date,
*               is_valid( begin_date )                   AS valid,
*
*               add_days( begin_date, 7 )                AS add_7_days,
*               add_months( begin_date, 3 )              AS add_3_month,
*               days_between( begin_date, end_date )     AS duration,
*
*               weekday( begin_date )                    AS weekday,
*               extract_month( begin_date )              AS month,
*               dayname( begin_date )                    AS day_name
*
*          WHERE customer_id = '000001'
*          AND days_between( begin_date, end_date ) = 0
**          WHERE days_between( begin_date, end_date ) > 10  " oder so
*
*          INTO TABLE @DATA(result).
*
*          out->write( result ).


** Beispiel für eine Zeitstemnpelkonvertierung

*    SELECT FROM /dmo/travel
*        FIELDS lastchangedat,
*           CAST( lastchangedat AS DEC( 15,0 ) ) AS lastchangedat_short,
*
*           tstmp_to_dats( tstmp = CAST( lastchangedat AS DEC( 15,0 )  ),
*                          tzone = CAST( 'utc-5' AS char( 6 ) )
**                          client = .....,
**                          on_error = ....
*                         ) AS date_est,
*
*
*           tstmp_to_tims( tstmp = CAST( lastchangedat AS DEC( 15,0 ) ),
*                          tzone = CAST( 'utc-5' AS char( 6 ) )
*                          ) AS time_est
*
*         WHERE customer_id = '000001'
*
*                INTO TABLE @DATA(result_date_time).
*
*          out->write( result_date_time ).

** Beispiel SQL für Einheitenumrechnung

*      SELECT FROM /dmo/connection
*              FIELDS distance,
*                     distance_unit,
*                     unit_conversion( quantity = CAST( distance AS QUAN ),
*                                      source_unit = distance_unit,
*                                      target_unit = CAST( 'MI' AS UNIT ) ) AS distance_mi
*
*             WHERE airport_from_id = 'FRA'
*              into TABLE @DATA(result_init).
*
*            out->write( result_init ).

** Beispiel SQL für Währungsnumrechnung

    DATA(today) = cl_abap_context_info=>get_system_date(  ).

        SELECT FROM /dmo/travel
               FIELDS total_price,
                      currency_code,

                      currency_conversion( amount               = total_price,
                                           source_currency      = currency_code,
                                           target_currency      = 'EUR',
                                           exchange_rate_date   = @today ) AS total_price_eur

                WHERE customer_id = '0000002' AND currency_code <> 'EUR'

                INTO TABLE @DATA(result_currency).

                out->write( result_currency ).




  ENDMETHOD.
ENDCLASS.
