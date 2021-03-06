global class TwilioChatTokenGenration {
    /*
	sub - Account SID of the account or subaccount to authenticate	
		- Account must be active
        Must use the Account SID from your Live Credentials
        Cannot be shared across subaccounts
	
	iss - API Key whose Secret signs the token	 
		- API Key must be in the account identified by the above Account SID
		Token must be signed by the Secret matching the API Key

	jti

    API Key concatenated with a random string	
    Unique identifier for the token
	Automatically generated by Twilio helper libraries

	iat

    Timestamp on which the token was issued	
    Uses Unix epoch timestamp
	Ensure server system clock not skewed

	nbf

    Timestamp when token becomes valid for use	
    Uses Unix epoch timestamp
    Ensure server system clock not skewed
    Token cannot be used before nbf

	exp

    Timestamp on which the token will expire	
    Uses Unix epoch timestamp
    Ensure server system clock not skewed
    TTL cannot be greater than 24 hours
    Token cannot be used after exp

	grants

    List of permissions granted to the token (varies by product)	
    Must contain at least one grant
    Multiple grants can be assigned if using multiple Twilio products

	*/
    global void jwtToken(){
        //TwilioConfig__c config = TwilioConfig__c.getOrgDefaults();
        TwilioCapabilityNew TwilioCapabilityNewRec = new TwilioCapabilityNew('ACb5ca33cc17a0e23f50d5754c68257697','IFXe4HSxD496VxC9YPPJxcjwZdBQV0Im');
        Grants grants = new Grants();
        grants.identity = 'pdalal@officebeacon.com';
        Chat chat = new Chat();
        chat.service_sid = 'IS6fb0537a60934e53b5542f47643e55e3';
        grants.chat = chat;
        String token = TwilioCapabilityNewRec.generateToken(grants);
        System.debug('token @@@@ '+ token); 
    }
   
    global class Grants{
        public string identity;
        public Chat chat;
    }
    global class Chat{
        public string service_sid;
    }
}