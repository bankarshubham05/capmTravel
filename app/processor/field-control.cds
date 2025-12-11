using TravelService from '../../srv/travel-service';
using from './annotations';


//
// annotations that control the behavior of fields and actions
//

// Workarounds for overly strict OData libs and clients
annotate cds.UUID with @Core.Computed  @(
    odata.Type : 'Edm.String',
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : TravelID,
            @UI.Importance : #High,
        },
        {
            $Type : 'UI.DataField',
            Value : to_Customer_CustomerID,
            @UI.Importance : #High,
        },
        {
            $Type : 'UI.DataField',
            Value : BeginDate,
        },
        {
            $Type : 'UI.DataField',
            Label : 'BookingFee',
            Value : BookingFee,
        },
        {
            $Type : 'UI.DataField',
            Value : TotalPrice,
        },
        {
            $Type : 'UI.DataField',
            Value : TravelStatus_code,
            Criticality : TravelStatus.criticality,
            @UI.Importance : #High,
        },
        {
            $Type : 'UI.DataFieldForAnnotation',
            Target : 'to_Agency/@Communication.Contact#contact',
            Label : 'Contact Name',
        },
    ],
   
);

annotate TravelService.TravelEt with @(Common.SideEffects: {
  SourceProperties: [BookingFee],
  TargetProperties: ['TotalPrice']
}){
  BookingFee  @Common.FieldControl  : TravelStatus.fieldControl;
  BeginDate   @Common.FieldControl  : TravelStatus.fieldControl;
  EndDate     @Common.FieldControl  : TravelStatus.fieldControl;
  to_Agency   @Common.FieldControl  : TravelStatus.fieldControl;
  to_Customer @Common.FieldControl  : TravelStatus.fieldControl;

} actions {
  
   deductDiscount @(
    Core.OperationAvailable : { $edmJson: { $Eq: [{ $Path: 'in/TravelStatus_code'}, 'O']}},
    Communication.Contact #contact1 : {
        $Type : 'Communication.ContactType',
        fn : Name,
    },
  );
}


annotate TravelService.TravelAgency with @(
    Communication.Contact #contact : {
        $Type : 'Communication.ContactType',
        fn : Name,
    }
);

