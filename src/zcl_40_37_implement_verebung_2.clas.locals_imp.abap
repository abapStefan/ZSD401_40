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

     METHODS get_attributes RETURNING VALUE(rt_attribute) TYPE ft_attribute.

  protected section.
  private section.

     DATA hersteller TYPE string.
     DATA typ        TYPE string.
     DATA ps         TYPE i.

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


endclass.

class lcl_lkw implementation.

endclass.
