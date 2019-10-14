public class sampleCon {
        String  countries{get;set;}
        account ac{get;set;}
    
        
        public PageReference test() {
            return null;
        }
            
        public List<SelectOption> getItems() {
            List<SelectOption> options = new List<SelectOption>();
            /*options.add(new SelectOption('US','US'));
            options.add(new SelectOption('CANADA','Canada'));
            options.add(new SelectOption('MEXICO','Mexico'));*/
             options.add(new selectOption('None', 'None')); 
             for (Account st :
            [select id,Name
             from Account])
             options.add(new selectOption(st.id, st.Name)); 
             return options;
        }
            
        public account getCountries() {
            IF (countries!=null)
            ac = [select Name from Account where id =: countries];
            return ac;
        }
            
        public void setCountries(String countries) {
            this.countries = countries;
        }
            public String getTest() {
        return countries;
    }

    }