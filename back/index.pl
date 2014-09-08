#!/usr/bin/perl
use CGI;



my $q = CGI->new;                        # create new CGI object
   print $q->header,                    # create the HTTP header
         $q->start_html('back');    # start the HTML

   print $q->h1('control panel');

#   print $q->a({href=>"/?act=startApp0"},"startApp01\n\r");
#   print $q->a({href=>"/?act=startApp1"},"startApp12\n\r");
#   print $q->a({href=>"/?act=startAdmin"},"startAdmin\n\r");
#   print $q->a({href=>"/?act=restartAll"},"restartAll\n\r");
#   print $q->a({href=>"/?act=stopAll"},"stopAll\n\r");
   print $q->a({href=>"/?act=publish"},"publish\n\r");

   my $act=$q->param("act");
   if($q->param){
   if($act eq 'startApp0'){
   system("cd /home/work/www/ospace && forever start app.js");
   }elsif ($act eq 'startApp1'){
   system("cd /home/work/www/ospace_8001 && forever start app1.js");
   }elsif ($act eq 'startAdmin'){
   exec " ./startAdmin.sh";
#   system "cd /home/work/www/admin && forever  start /home/work/www/admin/admin.js";
   }elsif ($act eq 'restartAll'){
   system("forever restartall");
   }elsif ($act eq 'stopAll'){
   system("forever stopall");
   }elsif ($act eq 'publish'){
   system("yes | cp /home/work/www/admin/source/_posts/1*.md /home/work/www/ospace_8001/source/_posts/");
   system("yes | cp /home/work/www/admin/source/_posts/1*.md /home/work/www/ospace/source/_posts/");
   }
   print "\n processed ".$act;
   }






    print $q->end_html;
