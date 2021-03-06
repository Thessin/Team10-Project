﻿<%@page import="java.util.Random"%>
<%@page import="java.util.stream.Stream"%>
<%@page import="java.util.Arrays"%>
<%@page import="Answers.GreetingsAnswers"%>
﻿﻿﻿<%-- 
    Document   : index
    Created on : 13.Ara.2017, 15:33:46
    Author     : LordAvalon
--%>

<%@page import="Search.SearchQuery"%>
<%@page import="Process.Score"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"></link> 
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
    <title>JSP Page</title>
</head>
<body>
    <form action="index.jsp" method="get">
        <input type="text" id="txtMessage" name="txtMessage" placeholder="Birşeyler söyleyin..." />
        <input type="submit" name="btnSend" id="btnSend" class="btn btn-success" value="Gönder" />
        <input type="submit" name="btnSport" id="btnSport" class="btn btn-success" value="Spor" />
        <hr/>
        <%
            String[] greetingsQuestions = Questions.GreetingsQuestions.getGreetings();
            String answer = "";
            String question="";
            if (request.getParameter("btnSend") != null && request.getParameter("btnSend").equals("Gönder")) {
                question = request.getParameter("txtMessage").toString();
                if (Arrays.asList(greetingsQuestions).contains(question)) {
                    answer = GreetingsAnswers.greet(question);
                }

            }
        %>  

        <hr/>
        
        <% if(request.getParameter("btnSend") != null && request.getParameter("btnSend").equals("Gönder")){%>
            
        <div class="containerChat">
            <img src="/w3images/bandmember.jpg" alt="Avatar">
                <div class="clr"></div>
                <p class="text-right"><%=question %></p>
                <span class="time-right">11:00</span>
                

        </div>
        <div class="containerChat darker">
            <img src="/w3images/avatar_g2.jpg" alt="Avatar" class="right">
                <p> <%=question %> </p>
                <span class="time-left">11:01</span>
        </div>
        <%}%>
    </form>
</body>
</html>
<style>
    /* 
    Created on : 14.Ara.2017, 11:45:21
    Author     : LordAvalon
    */

    /* Chat containers */
    .containerChat {
        border: 2px solid #dedede;
        background-color: #f1f1f1;
        border-radius: 5px;
        padding: 10px;
        margin: 10px 0;
    }

    /* Darker chat container */
    .darker {
        border-color: #ccc;
        background-color: #ddd;
    }

    /* Clear floats */
    .containerChat::after {
        content: "";
        clear: both;
        display: table;
    }

    /* Style images */
    .containerChat img {
        float: left;
        max-width: 60px;
        width: 100%;
        margin-right: 20px;
        border-radius: 50%;
    }

    /* Style the right image */
    .containerChat img.right {
        float: right;
        margin-left: 20px;
        margin-right:0;
    }

    /* Style time text */
    .time-right {
        float: right;
        color: #aaa;
    }

    /* Style time text */
    .time-left {
        float: left;
        color: #999;
    } 


</style>
