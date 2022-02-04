Expression Language (EL) in JSP
The Expression Language (EL) simplifies the accessibility of data stored
in the Java Bean component, and other objects like request, session, application etc.

There are many implicit objects, operators and reserve words in EL.

Syntax for Expression Language (EL)
${ expression }

Implicit Objects	Usage
pageScope	        it maps the given attribute name with the value set in the page scope
requestScope	    it maps the given attribute name with the value set in the request scope
sessionScope	    it maps the given attribute name with the value set in the session scope
applicationScope	it maps the given attribute name with the value set in the application scope
param	            it maps the request parameter to the single value
paramValues     	it maps the request parameter to an array of values
header	            it maps the request header name to the single value
headerValues	    it maps the request header name to an array of values
cookie	            it maps the given cookie name to the cookie value
initParam	        it maps the initialization parameter
pageContext	        it provides access to many objects request, session etc.

1.EL param example
In this example, we have created two files index.jsp and process.jsp.
The index.jsp file gets input from the user and sends the request to
the process.jsp which in turn prints the name of the user using EL.

index.jsp
<form action="process.jsp">
    Enter Name:<input type="text" name="name" /><br/><br/>
    <input type="submit" value="go"/>
</form>
process.jsp
Welcome, ${ param.name }

2.EL sessionScope example
In this example, we printing the data stored in the session scope using EL. For this purpose, we have used sessionScope object.

index.jsp
<h3>welcome to index page</h3>
<%
    session.setAttribute("user","sonic");
%>

<a href="process.jsp">visit</a>
process.jsp
Value is ${ sessionScope.user }

3.EL cookie example
index.jsp
<h1>First JSP</h1>
<%
    Cookie ck=new Cookie("name","Angular");
    response.addCookie(ck);
%>
<a href="process.jsp">click</a>
process.jsp
Hello, ${cookie.name.value}

4.header
example:=
<%@ page import = "java.io.*,java.util.*" %>
<%String title = "User Agent Example";%>

<html>
<head>
    <title><% out.print(title); %></title>
</head>

<body>
<center>
    <h1><% out.print(title); %></h1>
</center>

<div align = "center">
    <p>${header["user-agent"]}</p>
</div>
</body>
</html>



5.Precedence of Operators in EL
There are many operators that have been provided in the Expression Language. Their precedence are as follows:

#1
.
Access a bean property or Map entry

#2
[]
example:
<p>${header["user-agent"]}</p>

Access an array or List element

#3
( )

Group a subexpression to change the evaluation order

#4
+
exmaple:
${2+2+4}
Addition

#5
-

Subtraction or negation of a value
example:
${6-3}

#6
*

Multiplication
example:
${4*4}

#7
/ or div

Division
example:
${9/3}
${3 div 4}
#8
% or mod

Modulo (remainder)
example:
${200%2}
${200%3}
${10 mod 4}

#9
== or eq

Test for equality
example:
${100.0 == 100}

#10
!= or ne

Test for inequality
example:
${100.0 != 100}
${324 ne 45}

#11
< or lt

Test for less than
example:
${4<7}
${90 lt 45}

#12
> or gt

Test for greater than
example:
${100 gt 200}
${45 gt 67}

#13
<= or le

Test for less than or equal
example:
${23<=34}

#14
>= or ge

Test for greater than or equal
example:
${6>=7}

#15
&& or and

Test for logical AND
example:
${true && false}

${false and false}

#16
|| or or

Test for logical OR
example:
${true || false}

${false or false}

#17
! or not

Unary Boolean complement
example:
${!false}

${!true}

#18
empty

Test for empty variable values
example:
${empty value}

Reserve words in EL
There are many reserve words in the Expression Language.

lt	le	gt	ge
eq	ne	true	false
and	or	not	instanceof
div	mod	empty	null

6.Scopes

example:
<%
    request.setAttribute("na","Kullen");
    session.setAttribute("he","John");
    pageContext.setAttribute("je","Emma Watson");
    application.setAttribute("i","Harry Potter");
%>
Request Scope:
${requestScope.na}
<br/>
Session Scope:
${sessionScope.he}
<br/>
Page Scope:
${pageScope.je}
<br/>
Application Scope:
${applicationScope.i}
