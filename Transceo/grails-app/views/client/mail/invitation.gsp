<%@ page contentType="text/html"%>

<pre>${invitation.message}</pre>
<g:link controller="member" action="initRegisterFriend" id="${invitation.id}"  params='[code:"${invitation.code}"]' absolute ="true">Join Transceo</g:link>
