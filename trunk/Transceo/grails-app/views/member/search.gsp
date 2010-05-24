<html>
    <head>
        <title>Member - Search</title>
		<meta name="layout" content="main" />		
    </head>
    <body>
    	
		<form controller="administrator" action="searchMember" method="post" >
			<g:message code="search.member.code" />
    		<g:textField name="code" value="${fieldValue(bean:criteria,field:'code')}"/>
			<g:message code="search.member.firstName" />
    		<g:textField name="firstName" value="${fieldValue(bean:criteria,field:'firstName')}"/>
			<g:message code="search.member.lastName" />
    		<g:textField name="lastName" value="${fieldValue(bean:criteria,field:'lastName')}"/>
    		<g:message code="search.member.phone" />
    		<g:textField name="phoneNumber" value="${fieldValue(bean:criteria,field:'phoneNumber')}"/>
    		<g:message code="search.member.mail" />
    		<g:textField name="eMail" value="${fieldValue(bean:criteria,field:'eMail')}"/>
    		<g:message code="search.member.adresse" />
    		<g:textField name="adresse" value="${fieldValue(bean:criteria,field:'adresse')}"/>
    		<g:message code="search.member.city" />
    		<g:textField name="city" value="${fieldValue(bean:criteria,field:'city')}"/>
    		<g:message code="search.member.postal" />
    		<g:textField name="postal" value="${fieldValue(bean:criteria,field:'postal')}"/>
    		<g:message code="search.member.country" />
    		<g:textField name="country" value="${fieldValue(bean:criteria,field:'country')}"/>
			<g:submitButton name="search" value="${message(code:'common.button.search')}" />
		</form>
    
    	<br/>
    	
    	<g:render template="/member/result" bean="${members}"/>
    		
    </body>
</html>