		<table class="spip" width="100%">
    		<thead>
	    		<tr class="row_first">
	    			<th></th>
	    			<g:sortableColumn action="sortMember" property="id" title="${message(code:'search.member.id')}" />
	    			<g:sortableColumn action="sortMember" property="code" title="${message(code:'search.member.code')}" />
	    			<g:sortableColumn action="sortMember" property="firstName" title="${message(code:'search.member.firstName')}" />	    			
	    			<g:sortableColumn action="sortMember" property="lastName" title="${message(code:'search.member.lastName')}" />
	    			<g:sortableColumn action="sortMember" property="phoneNumber" title="${message(code:'search.member.phone')}" />
	    			<g:sortableColumn action="sortMember" property="eMail" title="${message(code:'search.member.mail')}" />
	    			<g:sortableColumn action="sortMember" property="adresse" title="${message(code:'search.member.adresse')}" />
	    			<g:sortableColumn action="sortMember" property="city" title="${message(code:'search.member.city')}" />
	    			<g:sortableColumn action="sortMember" property="postal" title="${message(code:'search.member.postal')}" />
	    			<g:sortableColumn action="sortMember" property="active" title="${message(code:'search.member.activate')}" />
	    		</tr>
    		</thead>
    		<tbody>
    			<g:each status="i" in="${members}" var="item">
					<tr class="${ (i % 2) == 0 ? 'row_even' : 'row_odd'}">
		     			<td>
		     				<g:link action="showProfile" id="${item.id}">
		     					<img src="${resource(dir:'images',file:'loupe.png')}" alt="${message(code:'search.member.view')}" />
		     				</g:link>
		     				<g:if test="${item.class.name == com.transceo.Member.class.name}">
		     				<g:link controller="administrator" action="initCreateReservation" id="${item.id}">
		     					<img src="${resource(dir:'images',file:'plus.png')}" alt="${message(code:'search.member.create.reservation')}" />
		     				</g:link>
		     				</g:if>
		     			</td>
		     			<td>${item.id}</td>
		     			<td>
		     				<g:if test="${item.class.name == com.transceo.Member.class.name}">
		     					${item.code}
		     				</g:if>
		     			</td>
		     			<td>${item.firstName}</td>
		     			<td>${item.lastName}</td>
		     			<td width="120px">${item.phoneNumber}</td>
						<td>
							<g:if test="${item.class.name != com.transceo.Customer.class.name}">
								${item.eMail}
							</g:if>
						</td>
						<td>
							<g:if test="${item.class.name == com.transceo.Member.class.name}">
								${item.adresse}
							</g:if>
						</td>
		     			<td>
		     				<g:if test="${item.class.name == com.transceo.Member.class.name}">
		     					${item.city}
		     				</g:if>	
		     			</td>
		     			<td>
		     				<g:if test="${item.class.name == com.transceo.Member.class.name}">
		     					${item.postal}
		     				</g:if>
		     			</td>
						<td width="20px">
							<g:if test="${item.class.name == com.transceo.Member.class.name}">
		     					${item.active}
		     				</g:if>
						</td>
		     		</tr>
				</g:each>
			</tbody>
    	</table>
    	
		<div id="pagination">   	
	    	<g:paginate next="${message(code:'common.button.paginate.next')}" prev="${message(code:'common.button.paginate.back')}"
	            controller="administrator" 
	            action="paginateMember" 
	            total="${total}" 
			/>
		</div>