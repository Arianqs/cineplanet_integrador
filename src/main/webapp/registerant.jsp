<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Registrate</title>
    <%@ include file="logicajsp/logicalogin_intranet.jsp" %>
    <link rel="stylesheet" type="text/css" href="css/formlogin.css">
    <link rel="stylesheet" type="text/css" href="css/index.css">
     <link rel="stylesheet" href="css/main.css">
          <link rel="stylesheet" href="css/registro.css">
    <script src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
      <link rel="icon" href="img/icon.ico"  sizes="32x32"   type="image/x-icon">
</head>
 <style>
 .form-login {
    background-color: #fff;
    padding: 60px;
    border-radius: 5px;
    box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.1);
    width: 30%;
    max-width: 670px;
    text-align: center;
    font-size: 10px;
    margin: 5px;
    height: 778px;
    margin-bottom: 0;
    margin: 5px 0 0 0;
    margin-bottom: 0;
    margin-top: 25px;
}
.btn-registro {
      background-color: #cd2906;
    color: white; 
    border: none;
    padding: 10px 20px;
    font-size: 16px;
    border-radius: 25px; 
    cursor: pointer; 
    transition: background-color 0.3s ease;
    display: block;
    margin: 0 auto; 
    margin-left: 240px; 
}

.btn-registro:hover {
    background-color: #cc0052; 
}
.icono-registro {
    width: 30px; 
    height: 20px;
}
</style>
<body>
    
    <div class="header-line"></div>
   <a href="cartelera.jsp" class="btn-atras">
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
        <path d="M15.41 7.41L14 6l-6 6 6 6 1.41-1.41L10.83 12z"/>
    </svg>
    Atrás
</a>

    <div class="container-login">
        <form class="form-login" action="loginusuario_intranet.jsp" method="POST">
            <fieldset>

                <h3>Únete</h3>
                <p>Completa tus datos y accede a nuestro<br>universo de beneficios</p><br><br><br>
                
   <form id="contactForm" action="" method="post">
    <div class="form-container">
        <!-- Primera fila: Nombre y Apellidos -->
               <div class="input-container">
              <label for="DNI"></label>
              <input type="password" id="DNI" name="pass" placeholder="DNI">
          </div>  
        
        
        
        <div class="input-container">
            <input type="text" id="nombre" name="nombre" class="input-leftt" placeholder="Nombre" maxlength="50" required>
            <label for="nombre" class="label-custom">Nombre</label>
        </div>   

        <div class="input-container">
            <input type="text" id="apellidos" name="apellidos" class="input-leftt" placeholder="Apellidos" maxlength="50" required>
            <label for="apellido  Paterno" class="label-custom">ApellidoS</label>
        </div>
       


        <div class="input-container">
            <input type="tel" id="telefono" name="telefono" class="input-leftt" placeholder="Correo electrónico" maxlength="15" required>
            <label for="telefono" class="label-custom">Correo electrónico</label>
        </div>
                       <div class="input-container">
              <label for="DNI"></label>
              <input type="password" id="DNI" name="pass" placeholder="DNI">
          </div>
                <div class="input-container">
                    <label for="contraseña"></label>
                    <input type="password" id="contraseña" name="pass" placeholder="Contraseña">
                </div>
  			  <div class="input-container">
                    <label for="Confirmar contraseña"></label>
                    <input type="password" id="contraseña" name="pass" placeholder=" Confirmar Contraseña">
                </div>
                
  <div class="terminos">
    <div class="checkbox-item">
        <input type="checkbox" id="acepto-terminos" name="acepto-terminos" required>
        <label for="acepto-terminos">Acepto los <a href="https://cdnpe.cineplanet.com.pe/assets/1862f49f-807a-44cc-bf34-629d915042e7">Términos y Condiciones</a> y la <a href="https://cdnpe.cineplanet.com.pe/assets/1a433f78-12dd-4a63-9c01-ee93a76b6d9b">Política de Privacidad</a> </label>
    </div>

    <div class="checkbox-item">
        <input type="checkbox" id="acepto-finalidades" name="acepto-finalidades" required>
        <label for="acepto-finalidades">He leído y acepto las finalidades de tratamiento adicionales</label>
    </div>
      <button type="submit" class="btn-registro">
                <img src="img/iconUser.png" alt="Icono de socio" class="icono-registro">
                Únete
            </button>

                
                <%
                    // Mostrar el mensaje de error si existe
                    String error = (String) request.getAttribute("error");
                    if (error != null) {
                %> 
                    <p class="error-message"><%= error %></p>
                <%
                    }
                %>
<br><br>
            </fieldset>
        </form>
   </div>

<script>
    document.querySelectorAll("input").forEach(function(input) {
        input.addEventListener("focus", function() {
            this.dataset.placeholder = this.placeholder; // Guarda el placeholder original
            this.placeholder = ""; // Elimina el placeholder
        });

        input.addEventListener("blur", function() {
            this.placeholder = this.dataset.placeholder; // Restaura el placeholder si el input queda vacío
        });
    });
</script>

</body>
</html>