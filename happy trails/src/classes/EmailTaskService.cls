global class EmailTaskService implements Messaging.InboundEmailHandler{

    global Messaging.InboundEmailResult handleInboundEmail(Messaging.inboundEmail email,
				Messaging.InboundEnvelope env){
        //return data
        Messaging.InboundEmailResult result = new Messaging.InboundEmailResult();
        try{
            Task newTask = new Task();
            Contact thisContact = new Contact();
            thisContact.lastname = email.plainTextBody;
            thisContact.email = email.fromAddress;
            insert thisContact;
            
        }catch(QueryException e){
            System.debug('Query Issue: ' + e);
        }
        result.success = true;
        return result;
    }
}