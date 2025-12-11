

using { com.travel } from '../db/schema';

service TravelService @(path:'Processor') {
@odata.draft.enabled
    entity TravelEt as projection on travel.Travel actions {
        action deductDiscount(@(UI.ParameterDefaultValue : 5)percent: Percentage not null @mandatory ) returns  TravelEt;
        action AcceptTravel();
    };
    entity TravelAgency as projection on travel.TravelAgency;
    entity Passenger as projection on travel.Passenger;
    entity TravelStatus as projection on travel.TravelStatus;
    entity Airline as projection on travel.Airline;
   

}
type Percentage : Integer @assert.range: [1,100];