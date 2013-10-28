
* Copyright (c) 2009, http://www.webdigi.co.uk 
* Website Change Detection system
* All rights reserved.
*
* Redistribution and use in source and binary forms, with or without
* modification, are permitted provided that the following conditions are met:
*     * Redistributions of source code must retain the above copyright
*       notice, this list of conditions and the following disclaimer.
*     * Redistributions in binary form must reproduce the above copyright
*       notice, this list of conditions and the following disclaimer in the
*       documentation and/or other materials provided with the distribution.
*     * Neither the name of the <organization> nor the
*       names of its contributors may be used to endorse or promote products
*       derived from this software without specific prior written permission.
*
* THIS SOFTWARE IS PROVIDED BY http://www.webdigi.co.uk  ''AS IS'' AND ANY
* EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
* WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
* DISCLAIMED. IN NO EVENT SHALL http://www.webdigi.co.uk BE LIABLE FOR ANY
* DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
* (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
* LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
* ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
* (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
* SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.



USAGE INSTRUCTIONS FOR WEBSITE CHANGE DETECTION SYSTEM
1) Upload the websitecds.php to the server root folder. 
2) You can edit the $scanPassword value to whatever password you like to set. Also add the edit the $emailAddressToAlert with your email address.
3) Call the file on the server with http://www.YOURDOMAIN.com/websitecds.php?password=ChangeThisPasswordForSecurity
4) You can use a cron job or siteup to detect if the same hash value is always present on your site.
5) If want an email alert on a change then use the value from above and call http://www.YOURDOMAIN.com/websitecds.php?password=ChangeThisPasswordForSecurity&myhash=7248e8a4abc6a14966badc461f0290f0

You can rename websitecds.php to any file you want.

ENJOY - Please send your valuable comments, issues and feature requests to http://code.google.com/p/websitecds/

NOTE: You dont have to upload this README.TXT to the server.
