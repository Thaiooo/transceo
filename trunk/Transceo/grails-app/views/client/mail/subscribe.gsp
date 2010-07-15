<%@ page contentType="text/html"%>

<p>
Bonjour ${member.firstName} ${member.lastName},
</p>

<p>
Vous venez de demander la cr�ation de votre compte sur Transeo.<br/>
Ce message est un message de confirmation de votre demande qui confirme que l'adresse email que vous avez fournie est correcte.
</p>
<p>
Pour proc�der � l'ouverture effective de votre compte <g:link controller="member" action="activate" id="${member.activationId}" absolute ="true">veuillez cliquer sur ce lien</g:link>.
</p>

<p>
si le lien ci-dessus n'apparait pas veuillez copier le lien suivant dans votre navigateur internet :
</p> 
<p>
<g:createLink controller="member" action="activate" id="${member.activationId}" absolute ="true" />
</p>

<p>
Pour rappel, veuillez trouver ci-dessous vos informations de connexion :
</p>
<p>
&nbsp;&nbsp;&nbsp;* Code Utilisateur : ${member.code}<br/>
&nbsp;&nbsp;&nbsp;* Mot de passe : ${member.password}
</p>

<p>
NB :<br/>
&nbsp;&nbsp;&nbsp;- Votre demande de cr�ation de compte sera conserv�e 30 jours. Si vous n'activez pas votre compte avant ce d�lai, votre demande sera automatiquement supprim�e.<br/>
</p>

<p>
A bient�t sur Trans�o !
</p>

