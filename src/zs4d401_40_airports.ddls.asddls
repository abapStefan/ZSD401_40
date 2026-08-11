@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS AIRPORTS'
@Metadata.ignorePropagatedAnnotations: true
define view entity ZS4D401_40_AIRPORTS as select from /dmo/airport
{
    key airport_id as AirportId,
    name as Name,
    city as City,
    country as Country
}
