global class SingleEmailSendGrid{
   
    //Method to get alll templates
    webService static boolean GetTemplateFromSendGrid(){
        
                                String username = 'sendgrid Uid';
                               String password = 'SendGrid Pwd';
                                Boolean success;
                               Blob headerValue = Blob.valueOf(username + ':' + password);
                               String authorizationHeader = 'BASIC ' +
                               EncodingUtil.base64Encode(headerValue);
        HttpRequest req = new HttpRequest();
                               req.setHeader('Authorization', authorizationHeader);
        req.setEndpoint('https://api.sendgrid.com/v3/templates');
                               req.setMethod('GET');
       try{
               
                //send request
                Http h = new Http();
                HttpResponse res = h.send(req);
                                                res.setHeader('Content-Type','application/json');
                                                                System.debug('Response from SendGrid:' + res);
                //check response
                                                                String status = res.getStatus();
                                                                if(status.toUpperCase()=='OK'){
                                                                                success=true;
                                                                }
                                                                else{
                                                                                success=false;
                                                                }
                                }
                                catch(Exception e){
                                                System.Debug(LoggingLevel.ERROR,'****** exception ocurred while recieving Template.');
                                                success=false;
                                }
      
        return success;
       
    }   
    
 
    //Method to send plain / HTML email - Requesting Body
    webService static boolean SendEmailToSendGrid(Id UserId){
      //webService static void SendEmail(){
                 string Recipient;
         string RecipientName;
         string CC;
         string Subject;
         string Body;
         boolean Success;
       
           
        User u = [SELECT Id, Name, Email,Alias,City,CompanyName,Country,Department,Division,Username FROM User WHERE Id = :UserId];
        //UserInfo.getUserId()
        if (u != Null){
            RecipientName = u.Name;
            Recipient = u.Email;
           
            CC ='';
                subject = 'Hello ' + u.Name+', ... , This is from SendGrid by Salesforce WebMethod!';
            Body = '<p align=left>Hello <b>' + u.Name+',</b> <br/>This is from send grid <br/> Below are your user sandbox details </p> ' +
                        '<br/>Name: '+u.Name+ '<br/>Username: '+u.Username+ '<br/>Alias: '+u.Alias+ '<br/>City: '+u.City+
                        '<br/>CompanyName: '+u.CompanyName+'<br/>Country: '+u.Country+ '<br/>Department:'+u.Department+ '<br/>Division: '+ u.Division+
                       '<br/><br/> Thanks, <br/> Salesforce Team <br/>  NSW-EC';
            String requestBody='';
                                requestBody += 'to[]='+EncodingUtil.urlEncode(Recipient.trim(),'UTF-8');
                requestBody += '&to[]='+EncodingUtil.urlEncode('amarendra.001@gmail.com','UTF-8');
                                requestBody += '&from='+EncodingUtil.urlEncode('createtask@2cr978qwm9jym5pokdx0rp3xy80s1p4t5oqnppmota07ft1t5h.9-pjuaeaq.ap1.apex.salesforce.com','UTF-8');
                                requestBody += '&fromname='+EncodingUtil.urlEncode('Amarendra','UTF-8');
                                requestBody += '&subject='+EncodingUtil.urlEncode(subject,'UTF-8');
            requestBody += '&text='+EncodingUtil.urlEncode(Body.trim(),'UTF-8');
                                requestBody += '&html='+EncodingUtil.urlEncode(Body.trim(),'UTF-8');
            requestBody += '&api_user=Sendgrid Uid';
                                requestBody += '&api_key=Sendgrid Pwd';
         
           
            HttpRequest req = new HttpRequest();
            req.setEndpoint('https://sendgrid.com/api/mail.send.json');
            //req.setHeader('Content-Type','application/json');
            req.setMethod('POST');
               
            req.setBody(requestBody);
           
            try{
               
                //send request
                Http h = new Http();
               
                HttpResponse res = h.send(req);
                                                res.setHeader('Content-Type','application/json');
                                                                System.debug('Response from SendGrid:' + res);
               
                                                                //check response
                                                                String status = res.getStatus();
                                                                if(status.toUpperCase()=='OK'){
                                                                                success=true;
                                                                }
                                                                else{
                                                                                success=false;
                                                                }
                                }
                                catch(Exception e){
                                                System.Debug(LoggingLevel.ERROR,'****** exception ocurred sending the email.');
                                                success=false;
                                }
        }
        return success;
       
    }   
    
    //Method to send Email using Template
    webService static boolean SendEmailUsingTemplate(Id UserId, string temp_id){
      //temp_id ff45ad75-4e8f-40fc-908b-90499086e57e
                 string Recipient;
         string RecipientName;
         string CC;
         string Subject;
         string Body;
         boolean Success;
                                User u = [SELECT Id, Name, Email,Alias,City,CompanyName,Country,Department,Division,Username FROM User WHERE Id = :UserId];
        //UserInfo.getUserId()
       
        String str=                   '{'+
                                '  "to": ['+
                                '    "amarendra.001@gmail.com"'+
                                '  ],'+
                                '  "sub": {'+
                                '    ":name": ["' + u.Name + '"' +
                                '    ],'+
        '    ":email": ["'+ u.Email +'"'+
                                '    ],'+
        '    ":city": ["'+ u.City +'"'+
                                '    ],'+
        '    ":company": ["'+ u.CompanyName +'"'+
                                '    ],'+
                                '    ":country": ["'+ u.Country +'"'+
        '   ],'+
                                '    ":Username": ["'+ u.Username +'"'+
        '   ],'+
        '    ":Department": ["'+ u.Department +'"'+
                                '    ],'+
        '    ":Division": ["'+ u.Division +'"'+
                                '    ],'+
        '    ":Alias": ["'+ u.Alias +'"'+
        '    ]'+ 
                                '  },'+
                                '  "filters": {'+
                                '    "templates": {'+
                                '      "settings": {'+
                                '        "enable": 1,'+
                                '        "template_id": "'+ temp_id +'"'+
                                '      }'+
                                '    }'+
                                '  }'+
                                '}';
      
        if (u != Null){
            RecipientName = u.Name;
            Recipient = u.Email;
           
            CC = 'amar_mca_aits@gmail.com';
                Body = 'Mail from NSW EC';
            subject = ' ';
            String requestBody='';
                                requestBody += 'to[]='+EncodingUtil.urlEncode(Recipient.trim(),'UTF-8');
                //requestBody += '&to[]='+EncodingUtil.urlEncode('amarendra.001@gmail.com','UTF-8');
                                requestBody += '&from='+EncodingUtil.urlEncode('amarendra.001@gmail.com','UTF-8');
                                requestBody += '&fromname='+EncodingUtil.urlEncode('Amarendra','UTF-8');
                                requestBody += '&subject='+EncodingUtil.urlEncode(subject,'UTF-8');
            requestBody += '&text='+EncodingUtil.urlEncode(Body.trim(),'UTF-8');
                                requestBody += '&html='+EncodingUtil.urlEncode(Body.trim(),'UTF-8');
            requestBody += '&x-smtpapi='+str;
            requestBody += '&api_user=SendGrid Uid';
                                requestBody += '&api_key=SendGrid Pwd';
         
            HttpRequest req = new HttpRequest();
            req.setEndpoint('https://sendgrid.com/api/mail.send.json');
            //req.setHeader('Content-Type','application/json');
            req.setMethod('POST');
               
            req.setBody(requestBody);
           
            try{
               
                //send request
                Http h = new Http();
               
                HttpResponse res = h.send(req);
                                                res.setHeader('Content-Type','application/json');
                                                                System.debug('Response from SendGrid:' + res);
               
                                                                //check response
                                                                String status = res.getStatus();
                                                                if(status.toUpperCase()=='OK'){
                                                                                success=true;
                                                                }
                                                                else{
                                                                                success=false;
                                                                }
                                }
                                catch(Exception e){
                                                System.Debug(LoggingLevel.ERROR,'****** exception ocurred sending the email.');
                                                success=false;
                                }
        }
        return success;
       
    }
  }