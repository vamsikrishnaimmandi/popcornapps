public with sharing class LoginFlows {
   @AuraEnabled
    public static void update1 () {
        system.debug('updatemethod');
         system.debug(Userinfo.getUserId());
       user objuser = new user(Id =Userinfo.getUserId());
       // a=[SELECT  Id   From User where Id='0052v00000ezeGl'];
        objuser.Has_Accepted_Terms__c=true;
    update objuser;
    //fake
}
}
