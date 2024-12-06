using { Ahameddb.master as master,
        Ahameddb.trans as transaction } from '../db/demo';

        service MyService {
            entity Studentset as projection on master.student;
            entity Standardset as projection on master.standards;
            entity Bookset as projection on master.books;
            entity BookRentalset as projection on transaction.rentals;
            }   
