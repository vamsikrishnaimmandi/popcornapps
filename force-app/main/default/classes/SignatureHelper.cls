public with sharing class SignatureHelper {
    
    @AuraEnabled
    public static Attachment saveSign(String strSignElement){
            Contact cont = new Contact(Id='0032v000036IN0hAAG');
            Attachment objAttachment = new Attachment();
            objAttachment.Name = 'Demo-Signature.png';
            objAttachment.ParentId = cont.Id;
            objAttachment.ContentType = 'image/png';
            objAttachment.Body = EncodingUtil.base64Decode(strSignElement);        
            insert objAttachment;
            return objAttachment;       
    }
}
