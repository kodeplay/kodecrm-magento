KodeCRM - Live Chat and CRM extension for Magento
=================================================

Note: In case you are not comfortable with installing extensions in
Magento, please consider backing up your files and data before
proceeding further.


Installation and setup using our integration wizard
---------------------------------------------------

This is the recommended way of integrating KodeCRM

Login to your account on KodeCRM. If you have chosen Magento as the
store platform while signing up, our Magento integration wizard
will open up once you are logged in. If not, you can always click on 
Integration on the topbar and select Magento in the drop down.

Magento Integration Wizard will help you with smooth integration. In
case you used the wizard, please skip the next section which basically
is a repetition of the steps in the wizard.


Installation without using our integration wizard
-------------------------------------------------

1) Copy the files from the 'magento' directory to your target
   installation directory of Magento.

2) Go to System -> Cache Management and flush magento cache and flush
   cache storage. And relogin to admin.

3) Login to admin and go to System -> configuration -> Kodecrm ->
   Settings. Set the 'Feed Status Enabled' to 'Yes'. Your feed url
   will be http://yourdomain.com/index.php/kodecrm.

4) Go to System -> Configuration -> General -> Design -> Footer and
   add the chat snippet in 'Miscellaneous HTML' field.  The chat
   snippet can be taken from Kodecrm admin setting page.

5) Login to KodeCRM account and submit the feed url.


Getting Help
------------

For further help, questions, feature requests or just for saying hi!
please contact info@kodeplay.com, sales@kodeplay.com or using the
feedback form inside your KodeCRM account.

KodeCRM
http://www.kodecrm.com
http://www.kodecrm.com/blog
@kodecrm on twitter
