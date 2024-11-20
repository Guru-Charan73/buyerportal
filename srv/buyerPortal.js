const cds = require('@sap/cds');

module.exports = cds.service.impl(async function () {
    const { Headers } = this.entities;

    // When a new draft is created
    this.on('NEW', 'Headers.drafts', async (req) => {
        try {
            // Start a database transaction
            const tx = cds.tx(req);

            // Fetch the current maximum value of "Request Item Number"
            const maxItemNumber = await tx.run(
                SELECT.one('Request_Item_Number')
                    .from(Headers)
                    .orderBy({ Request_Item_Number: 'desc' })
            );

            // Calculate the next "Request Item Number"
            const nextItemNumber = maxItemNumber ? maxItemNumber.Request_Item_Number + 1 : 1;

            // Set the incremented value in the incoming draft data
            req.data.Request_Item_Number = nextItemNumber;

            console.log(`New draft created with Request Item Number: ${nextItemNumber}`);

            // Return the draft data with the updated field
            return req.data;
        } catch (error) {
            console.error('Error while handling NEW draft event:', error);
            req.error(500, 'Unable to create draft with incremented Request Item Number');
        }
    });
});
