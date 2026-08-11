 CLASS zcl_40_22_zeichenket_fun_regex DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_40_22_zeichenket_fun_regex IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

*  DATA text TYPE string VALUE `  SAP BTP, ABAP enviroment  `.
*
*  out->write( |Input String                        = { text }| ).

** Beschreibungsfunktion (gibt ganzzahligen Wert zurück )
****************************************************************************************
*
*  DATA result_int TYPE i.
*
*  result_int = numofchar( text ).
*
*  out->write( |NUMOFCHAR                           = { result_int }| ).
*
*  result_int = find( val = text sub = 'env' ).
*
*  out->write( |FIND 'env'                          = { result_int }| ).

*
*** Bearbeitungsfunktionen (gibt einen Stringwert zurück )
*****************************************************************************************
*
* DATA result_string TYPE string.
*
* result_string = replace( val = text sub = 'env' with = 'Env' ).
*
* out->write( |REPLACE 'env' with 'Env'            = { result_string }| ).
*
*
*** Präfikatsfunktionen (dient als logischer Ausdruck )
*****************************************************************************************
*
* IF contains( val = text sub = 'env' ).
*
*    out->write( |CONTAINS 'env'                        is true| ).
*
* ELSE.
*
*    out->write( |CONTAINS 'env'                        is false| ).
*
*ENDIF.
*
* " Verwende die Funktion XSDBOOL( )., um die Prädikatsfunktion
* " in die Werte 'X' (für Wahr)  und ' '  für falsch
*
* DATA result_char1 TYPE abap_bool. " TYPE C LENGHT 1.
*
* result_char1 = xsdbool( contains( val = text sub = 'env' ) ).
*
* out->write( |XSDBOOL( CONTAINS 'env')            = { result_char1 } | ).


********************************************************************************************

*  DATA text TYPE string VALUE `  let's talk about abap  `.
*  DATA result TYPE i.
*
*  out->write( |input string:{ text }| ).
*
*  out->write( `--------------------------------------------------------` ).
*
*  result = find( val = text sub = 'a' case = abap_true ).
*  out->write( |find 'a' (standard):                                 { result }| ).
*
*  result = find( val = text sub = 'a' case = abap_false ).
*  out->write( |find 'a' (case = abap_false):                        { result }| ).
*
*  result = find( val = text sub = 'a' case = abap_false occ = -1 ).
*  out->write( |find 'a' (occ -1):                                   { result }| ).
*
*  result = find( val = text sub = 'a' case = abap_false occ = -2 ).
*  out->write( |find 'a' (occ -2):                                   { result }| ).
*
*  result = find( val = text sub = 'a' case = abap_false occ = 2 ).
*  out->write( |find 'a' (occ 2):                                    { result }| ).
*
*  result = find( val = text sub = 'a' case = abap_false occ = 2 off = 10 ).
*  out->write( |find 'a' (occ 2 off = 10):                           { result }| ).
*
*  result = find( val = text sub = 'a' case = abap_false occ = 2 off = 10 len = 4 ).
*  out->write( |find 'a' (occ 2 off = 10 len = 4):                   { result }| ).


** Aufruf verschiedener Beschreibungsfunktionen
***************************************************************************************

*  DATA result TYPE i.
*  DATA text TYPE string value `  ABAP  `.     " Stringargument ` `  nicht ' '
**   DATA text TYPE string value '  ABAP  '.
*
*   DATA substring TYPE string VALUE `BA`.
*   DATA offset    TYPE i     VALUE  0.
*
*
*  out->write( |input string:{ text }| ).
*
*  out->write( `--------------------------------------------------------` ).
*
*  result = strlen( text ).
*  out->write( |Strlen:                                          { result }| ).
*
*  result = numofchar( text ).
*  out->write( |Numofchar:                                       { result }| ).
*
*  result = count(     val = text sub = substring off = offset ).
*  out->write( |count { substring }                                         { result }| ).
*
*  result = find(     val = text sub = substring off = offset ).
*  out->write( |Find { substring }                                          { result }| ).
*
*  result = count_any_of(     val = text sub = substring off = offset ).
*  out->write( |Count_any_of { substring }                                  { result }| ).
*
*  result = find_any_of(     val = text sub = substring off = offset ).
*  out->write( |Find_any_of { substring }                                   { result }| ).
*
*  result = count_any_not_of(     val = text sub = substring off = offset ).
*  out->write( |Count_any_not_of { substring }                              { result }| ).
*
*   result = find_any_not_of(     val = text sub = substring off = offset ).
*  out->write( |find_any_not_of { substring }                               { result }| ).

**********************************************************************************************

* DATA text TYPE string      VALUE ` ASP BTP,   ABAP Environment  `.
*
*    out->write( |Input string:          '{ text }'| ).
*    out->write( `------------------------------------------------------------------` ).

** Groß-/Kleinschreibung der Zeichen ändern
**********************************************************************
*    out->write( |TO_UPPER             = '{   to_upper( `##ABAP_is_cool` ) }' | ).
*    out->write( |TO_LOWER             = '{   to_lower(  text ) }' | ).
*    out->write( |TO_MIXED             = '{   to_mixed(  text ) }' | ).
*    out->write( |TO_MIXED             = '{   to_mixed(  'make_this_mixed'  ) }' | ).
*    out->write( |FROM_MIXED           = '{ from_mixed(  text ) }' | ).
**
**
*** Reihenfolge der Zeichen ändern
************************************************************************
*    out->write( |REVERSE              = '{  reverse( text ) }' | ).
*    out->write( |SHIFT_LEFT  (places) = '{  shift_left(  val = text places   = 3  ) }' | ).
*    out->write( |SHIFT_RIGHT (places) = '{  shift_right( val = text places   = 3  ) }' | ).
*    out->write( |SHIFT_LEFT  (circ)   = '{  shift_left(  val = text circular = 3  ) }' | ).
*    out->write( |SHIFT_RIGHT (circ)   = '{  shift_right( val = text circular = 13  ) }' | ).
*
*
*** Eine Teilzeichenfolge extrahieren
*************************************************************************************************
*
*    out->write( |SUBSTRING            = '{  substring(        val = text off = 4 len = 10 ) }' | ).
*    out->write( |SUBSTRING_FROM       = '{  substring_from(   val = text sub = 'ABAP'     ) }' | ).
*    out->write( |SUBSTRING_AFTER      = '{  substring_after(  val = text sub = 'ABAP'     ) }' | ).
*    out->write( |SUBSTRING_TO         = '{  substring_to(     val = text sub = 'ABAP'     ) }' | ).
*    out->write( |SUBSTRING_BEFORE     = '{  substring_before( val = text sub = 'ABAP'     ) }' | ).
**
**
*** Condense, REPEAT and Segment
************************************************************************
*    out->write( |CONDENSE             = '{   condense( val = text from = ` `   to = ``  )         }' | ).
*    out->write( |CONDENSE             = '{   condense( val = text   )         }' | ).
*    out->write( |REPEAT               = '{   repeat(   val = text occ = 3 ) }' | ).
*
*    out->write( |SEGMENT1             = '{   segment(  val = text sep = ',' index = 1 ) }' |  ).
*    out->write( |SEGMENT2             = '{   segment(  val = text sep = ',' index = 2 ) }' |  ).

**************************************************************************************************

* DATA text TYPE string      VALUE ` SAP BTP,   ABAP Environment  `.
*
*    out->write( |Input string:          '{ text }'| ).
*    out->write( `------------------------------------------------------------------` ).
**
*** Prüfen, ob eine Zeichenkette eine bestimmte Teilzeichenkette enthält
************************************************************************
*    out->write( |CONTAINS 'ABAP':                          { xsdbool( contains( val = text sub   = 'ABAP'  ) )  } | ).
*    out->write( |CONTAINS 'ABAP', off = 20:                { xsdbool( contains( val = text sub   = 'ABAP' off = 20 ) ) } | ).
*    out->write( |CONTAINS 'ABAP', start ='ABAP', off = 12: { xsdbool( contains( val = text start = 'ABAP' off = 12 ) ) } | ).
***
**** Prüfen, ob eine Zeichenfolge Zeichen aus einer Liste von Zeichen enthält
*************************************************************************
*    out->write( |CONTAINS_ANY_OF 'ABC':                   { xsdbool( contains_any_of( val = text sub   = 'ABC' ) ) } | ).
*    out->write( |CONTAINS_ANY_OF 'XYZ':                   { xsdbool( contains_any_of( val = text sub   = 'XYZ' ) ) } | ).
***
**** Prüfen, ob eine Zeichenkette Zeichen außerhalb einer Liste von Zeichen enthält
********************************************************************************
*    out->write( |CONTAINS_ANY_NOT_OF 'ABC':               { xsdbool( contains_any_not_of( val = text sub   = 'ABC' ) ) } | ).
*    out->write( |CONTAINS_ANY_NOT_OF 'XYZ':               { xsdbool( contains_any_not_of( val = text sub   = 'XYZ' ) ) } | ).



** Bausteinprüfung
*********************************************************************

DATA result TYPE i.



result  = find_any_of( val = 'ABAP ABAP abap' sub = 'AB' ).

out->write( | 'find_any_of' { result } | ).

result = Count_any_of( val = 'ABAP ABAP abap' sub = 'AB' ).

out->write( | 'count_any_of' { result } | ).

result = Count( val = 'ABAP ABAP abap' sub = 'AB' ).

out->write( | 'count' { result } | ).

result = find_any_not_of( val = 'ABAP ABAP abap' sub = 'AB' ).

out->write( | 'find_any_not_of' { result } | ).


** Reguläre Ausdrücke
****************************************************************************
*   DATA text TYPE string   VALUE `2027-07-21`.
*   DATA text TYPE string   VALUE `Zum Beispiel, hier 2027-07-21 ist ein Datum in Iso Format`.     " Schritt 1
*   DATA text TYPE string   VALUE `Zum Beispiel, 27.01.1968 ist nicht im Iso Format`.
*   DATA text TYPE string   VALUE `Zum Beispiel, 1968.01.27 ist nicht im Iso Format`.
*
**  DATA regex TYPE string VALUE '[0-9]{4}(-[0-9]{2}){2}'.
*  DATA regex TYPE string VALUE '[0-9]{4}(\.[0-9]{2}){2}'.
*
*   out->write( |Zu verarbeitende Text      = '{ text }' | ).
*   out->write( |Regular Expression         = '{ regex }' | ).
*
*   IF NOT contains( val = text pcre = regex ).
*      out->write( 'Kein passenden Substring gefunden' ).
*   ELSE.
*
*   DATA(number) = count( val = text pcre = regex ).
*      out->write( |Anzahl der Befunde      = { number }| ).
*
*   DATA(offset) = find( val = text pcre = regex occ = 1 ).
*     out->write( |Offset des 1st Befundes  = { offset } | ).
*
*   DATA(date_text) = match( val = text pcre = regex occ = 1 ).
*     out->write( |1st Befund (extrahiert)  = `{ date_text }` | ).
*
*   IF matches( val = text pcre = regex ).
*      out->write( `Das ist ein complete match` ).
*   ELSE.
*   out->write( `kein Complete match` ).
*
*   ENDIF.
*
*   ENDIF.


  ENDMETHOD.
ENDCLASS.
