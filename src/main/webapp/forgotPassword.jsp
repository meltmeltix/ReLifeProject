<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Password dimenticata - ReLife</title>
        <link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
        <link rel="icon" href="favicon.ico" type="image/x-icon">
        <link rel="stylesheet" href="resources/css/style-form.css"/>
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons|Material+Icons+Outlined">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/css/materialize.min.css">
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        <script src ="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/js/materialize.min.js"></script>

        <script>
            $(document).ready(function() {
                $('input#textbox-username').characterCounter();
            });
        </script>
    </head>

    <body>
        <%
            HttpSession sessione = request.getSession(false);
            String nomeCompleto = (String) sessione.getAttribute("nomecompleto");

            if(nomeCompleto != null) {
                response.sendRedirect("feed.jsp");
            }

            if(request.getParameter("errore") != null) {
                String errore = request.getParameter("errore");
        %>
                <script>M.toast({html: '<%=errore%>', classes: 'rounded'})</script>
        <%}%>

        <main>
            <div class="fullscreen-bg">
                <video autoplay muted loop class="fullscreen-bg__video">
                    <source src="resources/video/bg-video.mp4" type="video/mp4">
                </video>
            </div>

            <div id="infoContainer">
                Sito creato a scopo didattico<br>
                ITT Fauser | Cameroni Alessio - 2020/2021
            </div>

            <div id="container">
                <form action="login-servlet" method="post">
                    <div id="formContainer">
                        <div id="textTitle">
                            <h5><strong>Password dimenticata?</strong></h5>
                        </div>
                        <div id="formInput">
                            <div class="input-field">
                                <input id="textbox-username" name="tbUsername" type="text" class="validate" maxlength="20" autocomplete="off" required>
                                <label for="textbox-username">Username</label>
                                <span class="helper-text">Max 20 caratteri</span>
                            </div>

                            <div class="input-field">
                                <input id="textbox-password" name="tbNewPassword" type="password" class="validate" required>
                                <label for="textbox-password">Nuova password</label>
                            </div>

                            <div class="input-field">
                                <input id="textbox-confirm-password" name="tbConfirmPassword" type="password" class="validate" required>
                                <label for="textbox-confirm-password">Conferma password</label>
                            </div>

                            <input type="hidden" name="azione" value="changePwd">

                            <button type="submit" class="waves-effect waves-light btn-large round z-depth-0">conferma</button>

                            <div class="divider"></div>

                            <div id="secondaryText">
                                <strong><a href="login.jsp">Accedi</a>
                                ·
                                <a href="createAccount.jsp">Iscriviti a ReLife</a></strong>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </main>
    </body>
</html>