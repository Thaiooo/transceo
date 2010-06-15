<%@ page contentType="text/html"%>
hello!
<p>
Your code: ${member.code}
</p>
<p>
Your password: ${member.password}
</p>

<a href="http://localhost:8080/Transceo/member/activate?id=${member.activationId}">Activate your account</a>

