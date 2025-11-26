

using { com.travel } from '../db/schema';

service TravelService @(path:'Processor') {
@odata.draft.enabled
    entity TravelEt as projection on travel.Travel;

}