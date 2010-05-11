<html>
    <head>
        <title>Member - Search</title>
		<meta name="layout" content="main" />		
    </head>
    <body>
    	
		<form controller="member" action="search" method="post" >
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
			<g:submitButton name="search" value="${message(code:'common.button.search')}" />
		</form>
    
    	<table border = "1">
    		<thead>
	    		<tr>
	    			<th></th>
	    			<g:sortableColumn action="sort" property="code" title="Code" />
	    			<g:sortableColumn action="sort" property="firstName" title="First Name" />	    			
	    			<g:sortableColumn action="sort" property="lastName" title="Last Name" />
	    			<g:sortableColumn action="sort" property="phoneNumber" title="Phone Number" />
	    			<g:sortableColumn action="sort" property="eMail" title="E-Mail" />
	    			<g:sortableColumn action="sort" property="adresse" title="Adresse" />
	    			<g:sortableColumn action="sort" property="city" title="City" />
	    			<g:sortableColumn action="sort" property="postal" title="Postal" />
	    			<g:sortableColumn action="sort" property="subscribeDate" title="Subscribe Date" />
	    			<g:sortableColumn action="sort" property="active" title="Status" />
	    		</tr>
    		</thead>
    		<tbody>
		    	<g:each in="${members}">
		     		<tr>
		     			<td width="50px"><g:link action="show" id="${it.id}">View</g:link></td>
		     			<td>${it.code}</td>
		     			<td>${it.firstName}</td>
		     			<td>${it.lastName}</td>
		     			<td width="120px">${it.phoneNumber}</td>
						<td>${it.eMail}</td>
						<td>${it.adresse}</td>
		     			<td>${it.city}</td>
		     			<td>${it.postal}</td>
						<td width="70px"><g:formatDate format="yyyy-MM-dd" date="${it.subscribeDate}"/></td>
						<td width="20px">${it.active}</td>
		     		</tr>
				</g:each>
			</tbody>
    	</table>
    	
    	<g:paginate next="Forward" prev="Back"
    		max="2"  
            maxsteps="0" 
            controller="member" 
            action="paginate" 
            total="${com.transceo.Member.count()}" 
		/>
            
    </body>
</html>