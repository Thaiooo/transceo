<%@ page contentType="text/html"%>

<pre style="font-family: arial; font-size: 12px;">${invitation.message}</pre>
<g:link controller="member" action="initRegisterFriend" id="${invitation.id}"  params='[code:"${invitation.code}"]' absolute ="true">Join Transceo</g:link>
