trigger Duplicate_email on Lead (before insert) {
    Set<String> mailset = new Set<String>();
    list<Lead> allrecords = [SELECT Id, FirstName, Email FROM Lead Where Email IN:mailset];
    for(Lead Dublicate : trigger.new){
        mailset.add(Dublicate.Email);
        if(allrecords.size()>0){
            Dublicate.Email.adderror('Duplicate email exits');
            
        }
        
    }
    
}