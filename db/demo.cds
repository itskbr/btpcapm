namespace Ahameddb;
using { Ahameddb.commons as commons } from './commons.cds';
using { cuid, temporal, managed } from '@sap/cds/common';



context master{
entity student: commons.address{
    key ID: commons.Guid;
        NAME: String(40);
        CLASS: Association to one standards;
        GENDER: String(1);
}    
entity standards{
    key ID: Int16;
    CLASSNAME: String(10);
    SECTIONS: Int16;
    CLASSTEACHER: String(40);
}

entity books {
    key ID: commons.Guid;
    BOOKNAME: String(40);
    AUTHOR: String(40);
}
}

context trans {

entity rentals : cuid, temporal, managed {
    STUDENT: Association to master.student;
    BOOK: Association to master.books;
}    
}

    // "@ui5/cli": "^3.0.0",
