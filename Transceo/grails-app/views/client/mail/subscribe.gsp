<%@ page contentType="text/html"%>
hello!
<p>
Your code: ${member.code}
</p>
<p>
Your password: ${member.password}
</p>
<g:link controller="member" action="activate" id="${member.activationId}" absolute ="true">Activate your account</g:link>

