module.exports = cds.service.impl(async function(){
     const {POs} = this.entities;

    this.on('boost', async(req) => {
         try {
             const ID = req.params[0];
             const tx = cds.tx(req);
             await tx.update(POs).with({
             GROSS_AMOUNT: { '+=' : 2000 }
         }).where(ID);
         } catch (error) {
             return 'Error' + error.toString();
         }

    });

    this.on('largestOrder', async(req) => {
        try {
            const tx = cds.tx(req);
            //Read the PO with highest gross amount
            //Read orders desc by gross + get the first record
            const recordData = tx.read(POs).orderBy({
                GROSS_AMOUNT: 'desc'
            }).limit(1);

            return recordData;
        } catch (error) {
            return 'Error' + error.toString();
        }

   });
});
