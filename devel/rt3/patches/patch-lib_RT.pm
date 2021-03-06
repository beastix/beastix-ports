$NetBSD: patch-lib_RT.pm,v 1.2 2015/03/01 22:45:26 spz Exp $

perl 5.14 qw() in for* fixes
Fix for CVE-2014-9472 taken from the patch for RT 4.0.0

--- lib/RT.pm.orig	2013-05-22 19:04:26.000000000 +0000
+++ lib/RT.pm
@@ -362,6 +362,8 @@ sub InitSignalHandlers {
 ## mechanism (see above).
 
     $SIG{__WARN__} = sub {
+        return 'IGNORE' if $_[0] and $_[0] =~ /^Code point \S+ is not Unicode, may not be portable/;
+
         # The 'wide character' warnings has to be silenced for now, at least
         # until HTML::Mason offers a sane way to process both raw output and
         # unicode strings.
@@ -459,7 +461,7 @@ sub InitClasses {
     # in the session, as we deserialize it so we never call constructor
     # of the class, so the list of accessible fields is empty and we die
     # with "Method xxx is not implemented in RT::SomeClass"
-    $_->_BuildTableAttributes foreach qw(
+    $_->_BuildTableAttributes foreach ( qw(
         RT::Ticket
         RT::Transaction
         RT::Attachment
@@ -477,7 +479,7 @@ sub InitClasses {
         RT::ObjectCustomField
         RT::ObjectCustomFieldValue
         RT::Attribute
-    );
+    ) );
 
     if ( $args{'Heavy'} ) {
         # load scrips' modules
