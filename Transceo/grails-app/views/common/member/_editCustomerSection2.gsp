<g:hasErrors bean="${customer}">
	<div class="erreur_message">
		<g:renderErrors bean="${customer}" />
	</div>
</g:hasErrors>		
<g:render template="/common/member/editCustomerInformation" bean="${customer}" var="customer"/>