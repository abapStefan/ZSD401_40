*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
class lcl_fahrzeuge definition.

  public section.

    TYPES: BEGIN OF fs_attribute,                                 " Lokale Struktur erstellt
            fahrzeugdaten TYPE string,
            wert TYPE string,
           END OF fs_attribute.

     TYPES ft_attribute TYPE SORTED TABLE OF fs_attribute         " Lokale ITAB erstellt
                        WITH UNIQUE Key fahrzeugdaten.



     METHODS constructor                                          " Constructor Methode erstellen
          importing i_hersteller TYPE string
                    i_typ        TYPE string
                    i_ps         TYPE i.


     METHODS get_attributes RETURNING value(rt_attribute) TYPE ft_attribute.



  protected section.

    DATA typ        TYPE string.
    DATA ps         TYPE i.
    DATA hersteller TYPE string.


  private section.


endclass.

class lcl_fahrzeuge implementation.

  method constructor.

       hersteller = i_hersteller.
       typ        = i_typ.
       ps         = i_ps.

  endmethod.

  method get_attributes.

        rt_attribute = value #( ( fahrzeugdaten = 'Hersteller'  wert = hersteller )
                                ( fahrzeugdaten = 'Typ'         wert = typ )
                                ( fahrzeugdaten = 'PS'          wert = ps )  ).

  endmethod.

endclass.

class lcl_lkw definition INHERITING FROM lcl_fahrzeuge.    " LKW erbt alles aus der Oberklasse

 PUBLIC SECTION.

        METHODS constructor                                          " Neuer Constructor für Unterklasse mit neuem Attribut
          importing i_hersteller TYPE string
                    i_typ        TYPE string
                    i_ps         TYPE i
                    i_ladung TYPE p.

        METHODS  get_attributes  REDEFINITION.                " Methode Redefinieren

 PRIVATE SECTION.

     DATA ladung TYPE p DECIMALS 2.                        " Neue Eigenscahft des LKW ladung


endclass.

class lcl_lkw implementation.

  method constructor.

    super->constructor( i_hersteller = i_hersteller i_typ = i_typ i_ps = i_ps ).  "  Mit Super-> auf die Oberklasse

    ladung = i_ladung.                                      " Neues Attribut hinzufügen

  endmethod.

  method get_attributes.

* 1 Option Redefinition verwendet geschützte Attribute der Oberklasse

    rt_attribute = value #( ( fahrzeugdaten = 'Hersteller'  wert = hersteller )
                            ( fahrzeugdaten = 'Typ'         wert = typ )
                            ( fahrzeugdaten = 'PS'          wert = ps )
                            ( fahrzeugdaten = 'Ladung'      wert = ladung ) ).

  endmethod.

endclass.
