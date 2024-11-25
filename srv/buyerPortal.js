const cds = require('@sap/cds');
 
module.exports = cds.service.impl(async function () {
  const { Headers, RequestItem } = this.entities;
 
  // Request_No auto-numbering for Request_Header
  this.before('CREATE', 'Headers', async (req) => {
    const DEFAULT_START = 1000000000; 
 
    // Fetch the highest existing Request_No
    const existingRecords = await SELECT.columns('RequestNo')
      .from(Headers)
      .orderBy`RequestNo desc`
      .limit(1);
 
    if (existingRecords.length === 0) {
      req.data.RequestNo = DEFAULT_START; 
    } else {
      const highestRequestNo = existingRecords[0].Request_No;
      req.data.Request_No = highestRequestNo + 1; 
    }
  });
 
  this.before('NEW', 'RequestItem.drafts', async req => {
 
    const DEFAULT_START = 10;
 
    // Check existing items for the same header
    const existingItems = await SELECT.columns('ReqItemNo')
      .from(RequestItem.drafts)
      .orderBy`ReqItemNo desc`
      .limit(1);
 
    if (existingItems.length === 0) {
      req.data.ReqItemNo = DEFAULT_START;
    } else {
      const highestReqItemNo = Math.max(...existingItems.map(item => item.ReqItemNo));
      req.data.ReqItemNo = highestReqItemNo + 10;
    }
 
  })
});