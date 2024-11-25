using {buyerportal.db as db} from '../db/schema';

service BuyerPortal {

    entity Headers @(odata.draft.enabled: true)     as projection on db.master.Headers{
        ID,
        PR_Number,
        PRType,
        StatusCode,
        _Items,
        RequestDescription,
        Comments,
        RequestNo,
        Currency
    };
    entity RequestItem as projection on db.master.RequestItem;
    entity comments   as projection on db.master.comments;
    entity status     as projection on db.master.status;


}
