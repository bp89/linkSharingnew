
<%@ page import="linksharing.User" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'user.label', default: 'User')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>

	<body>
		<div id="list-user" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="age" title="${message(code: 'user.age.label', default: 'Age')}" />
					
						<g:sortableColumn property="city" title="${message(code: 'user.city.label', default: 'City')}" />
					
						<g:sortableColumn property="country" title="${message(code: 'user.country.label', default: 'Country')}" />
					
						<g:sortableColumn property="emailID" title="${message(code: 'user.emailID.label', default: 'Email ID')}" />
					
						<g:sortableColumn property="firstName" title="${message(code: 'user.firstName.label', default: 'First Name')}" />
					
						<g:sortableColumn property="lastName" title="${message(code: 'user.lastName.label', default: 'Last Name')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${userInstanceList}" status="i" var="userInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${userInstance.id}">${fieldValue(bean: userInstance, field: "age")}</g:link></td>
					
						<td>${fieldValue(bean: userInstance, field: "city")}</td>
					
						<td>${fieldValue(bean: userInstance, field: "country")}</td>
					
						<td>${fieldValue(bean: userInstance, field: "emailID")}</td>
					
						<td>${fieldValue(bean: userInstance, field: "firstName")}</td>
					
						<td>${fieldValue(bean: userInstance, field: "lastName")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${userInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
