CLASS zcl_40_vehicle DEFINITION
  PUBLIC
*  FINAL
  CREATE PUBLIC .

    public section.

    TYPES: type TYPE c LENGTH 15.

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


     METHODS get_attributes RETURNING value(rt_attribute) TYPE ft_attribute .



  protected section.

    DATA typ        TYPE string.
    DATA ps         TYPE i.
    DATA hersteller TYPE string.


  private section.

ENDCLASS.



CLASS zcl_40_vehicle IMPLEMENTATION.

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


ENDCLASS.
