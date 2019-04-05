# LinkCheckNGrab
--------------------------------------------------------------------------------
                                    README                                     
--------------------------------------------------------------------------------                                                  
- 09/29/2018                                                                   
- Automated Link Check and Grab                                                
- LinkCheckNGrab.sh                                                            
--------------------------------------------------------------------------------
                                     ABOUT                                     
--------------------------------------------------------------------------------
- This program is designed to compare URLs expected from redirects             
 (Destination URL) with the URLs that result from running the link to be      
 redirected (Source URL).                                                     
                                                                              
- The program writes out the results as a CSV file. Three columns get written:
       the Source URL, the Destination URL, and the result.                       
                                                                               
- The program is fed a file containing redirects in a loop until it reaches    
  the end of the file.                                                         
									       -
- The program has 4 versions:						       -
    - LinkCheckNGrab: For retrieving internal redirect links without regex.   
    - LinkCheckNGrabWRegex: For retrieving internal redirect links with       
      regex.		                        			       -
    - LinkCheckNGrabWRegex: For retrieving external redirect links without    
      regex.							               -
    - ExternalLinkCheckNGrabWRegex: For retrieving external redirect links    
      with regex.							       -
--------------------------------------------------------------------------------
                                   PREREQUISITES                               
--------------------------------------------------------------------------------
- Installed Programs:                                                          
   - curl - Red Hat's default terminal-based web browser.                      
              - used to load the Source URL, and save result as a variable    
- Program/File Settings:                                                       
   - Config file:                                                              
                - The file for parsing redirects is named:                     
                   -  "configtext.txt" for LinkCheckNGrab.sh		       
                   -  "configmatch.txt" for LinkCheckNGrabWRegex.sh            
                   -  "exttext.txt" for ExternalLinkCheckNGrab.sh              
                   -  "extmatch.txt" for ExternalLinkCheckNGrabWRegex.sh       
                - Contents must be of format "Redirect 301 Source Destination" 
                  for each redirect in LinkCheckNGrab.sh and                   
                  LinkCheckNGrabWRegex.sh                                      
                - Contents must be of format                                   
                  "RedirectMatch 301 Source Destination" for each redirect in  
                  ExternalLinkCheckNGrab and ExternalLinkCheckNGrabWRegex.sh.  
                - Every redirect MUST have exactly ONE space between the       
                  Redirect(Match) 301, the source redirect, and the            
                  destination redirect.                                        
                - In regex redirect files, you must remove the beginning karat 
                  from the regex portion of each source or the code will not   
                  work.                                                        
--------------------------------------------------------------------------------
                                 INSTALL AND RUN                               
--------------------------------------------------------------------------------
- Installation Steps:                                                          
              - Install prerequisite programs with your OS's installation      
                schema (e.g. sudo yum install curl).                           
              - Confirm prerequisite program and file settings with your own.  
              - Make the script executable (chmod +x LinkCheckNGrab.sh)        
- To Run:                                                                      
              - run with ./LinkCheckNGrab.sh if you don't want to see all      
                shell output.                                                  
              - run with bash -x ./LinkCheckNGrab.sh if you want to see all    
                shell output.                                                  
              - run with ./LinkCheckNGrab.sh [-h || --help] if you need help.  
--------------------------------------------------------------------------------
                                      NOTES                        
--------------------------------------------------------------------------------
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
