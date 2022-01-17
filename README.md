---
<h1 align="center">README</h1> 

---



- 01/17/2021                                                                   
- Automated Web Server Therapy Session                                                
- WebServerTherapy.sh   
- Formerly LinkCheckNGrab
- NOTE: Progress Starts Tomorroe 
                                                        
---
<h1 align="center">ABOUT</h1>      

---                      
                                                                               
- The program is fed links from a text file in a loop until it reaches    
  the end of the file.                                                         
									       
- The program will be able to do three things:
	- Check for dead redirects - Already possible
	- Check for duplicate imported files
	- Check for outdated libraries  
---
<h1 align="center">PREREQUISITES</h1>      

---
- Installed Programs:                                                          
   - curl - Red Hat's default terminal-based web browser.                      
              - used to load the Source URL, and save result as a variable    
- Program/File Settings:                                                       
   - Config file:                                                              
                - The file for parsing redirects is named:                     
                   -  "configtext.txt" for internally facing redirects not found by wildcard	       
                   -  "configmatch.txt" for internally facing redirects found by wildcard       
                   -  "exttext.txt" for externally facing redirects not found by wildcard            
                   -  "extmatch.txt" for externally facing redirects found by wildcard   
                - Contents must be of format "Redirect 301 Source Destination" 
                  for each redirect using internally facing redirects                                     
                - Contents must be of format                                   
                  "RedirectMatch 301 Source Destination" for each redirect using
		  externally facing redirects.
                - Every argument MUST have exactly ONE space between each argument 
                - in a txt file.                                      
                - In regex redirect files, you must remove the beginning karat 
                  from the regex portion of each source if there is a karat, 
		  or the code will not work.    
		  
---
<h1 align="center">INSTALL AND RUN</h1>      

---
- Installation Steps:                                                          
              - Install prerequisite programs with your OS's installation      
                schema (e.g. sudo yum install curl).                           
              - Confirm prerequisite program and file settings with your own.  
              - Make the script executable (chmod +x LinkCheckNGrab.sh)        
- Command-Line Arguments:   
	``` WebServerTherapy.sh [options]
	Options:
	[-h || --help] : output this file
	[-r || --red] | check for internally facing redirects not found by wildcard
	[-rx || --redreg] check for internally facing redirects found by wildcard
	[-er || --exred] check for externally facing redirects not found by wildcard
	[-erx || --exredreg] check for externally facing redirects found by wildcard
	[-ar || -- allreg] run all redirect tests.
	[-d || --dup] check for duplicate included libraries
	[-l || --leg] check for legacy libraries
	```                                                                    
              - run with `./WebServerTherapy.sh` if you don't want to see all      
                shell output.                                                  
              - run with `bash -x ./WebServerTherapy.sh` if you want to see all    
                shell output.                                                  
              
---
<h1 align="center">NOTES</h1>      

---

  - If the two URLs are an exact match, then the result column     
    gets written as an empty string. Since nothing else needs to  
    be done in this case, adding text in this field would only     
    make the resulting csv less legible.                                                         
  - If the two URLs don't match exactly, then the URL is saved in  
    the result column. Even if nothing else needs to be done in    
    these cases, there's no way around this.
  - You MUST have a directory for which echo can write the csv     
    file. otherwise, you'll have to use sudo, which will lose its  
    usefulness once the machine goes to sleep.                                            
  - You will have to edit the code to get it working the way you   
    want. You should just have to edit the URL variable(s),        
    however. This can easily be set up in the Linux bash script.   
		
--------------------------------------------------------------------------------
