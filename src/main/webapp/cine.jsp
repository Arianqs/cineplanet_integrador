<%@ page import="java.sql.*, java.util.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Sucursales</title>
    <link rel="stylesheet" type="text/css" href="css/index.css">
    <link rel="stylesheet" type="text/css" href="css/styles.css">
    <link rel="stylesheet" type="text/css" href="css/estilotabla2.css">
    <script>
        function cargarCines() {
            var ciudadId = document.getElementById("ciudades").value;
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function() {
                if (this.readyState == 4 && this.status == 200) {
                    document.getElementById("cines").innerHTML = this.responseText;
                }
            };
            xhttp.open("GET", "cargarCines.jsp?ciudadId=" + ciudadId, true);
            xhttp.send();
        }

        function mostrarCine() {
            var cineId = document.getElementById("cines").value;
            if (cineId) {
                var xhttp = new XMLHttpRequest();
                xhttp.onreadystatechange = function() {
                    if (this.readyState == 4 && this.status == 200) {
                        document.getElementById("resultado").innerHTML = this.responseText;
                    }
                };
                xhttp.open("GET", "mostrarCine.jsp?cineId=" + cineId, true);
                xhttp.send();
            } else {
                document.getElementById("resultado").innerHTML = "";
            }
        }
    </script>
</head>
<jsp:include page="/fragmentos/encabezado.jsp" />
<br><br><br><br>
<body>

<h1>Sucursales</h1>
   <div class="filter-container">
    <table class="filter-table">
        <tr>
            <form action="cines.jsp" method="post">
                <td>
                    <div class="combobox-item">
    <label for="ciudades">Selecciona una ciudad:</label>
    <select id="ciudades" name="ciudades" onchange="cargarCines()">
        <option value="">-- Seleccionar --</option>
        <%
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver"); 
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/cineproyect", "root", "");

                String sql = "SELECT id, nombre_ciudad FROM ciudades";
                pstmt = conn.prepareStatement(sql);
                rs = pstmt.executeQuery();

                while (rs.next()) {
                    int id = rs.getInt("id");
                    String nombreCiudad = rs.getString("nombre_ciudad");
        %>
                    <option value="<%= id %>"><%= nombreCiudad %></option>
        <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (rs != null) try { rs.close(); } catch (SQLException e) {}
                if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
                if (conn != null) try { conn.close(); } catch (SQLException e) {}
            }
        %>
    </select>
    </div>
    </td>

    <br><br>
    <td>
    <div class="combobox-item">
    <label for="cines">Selecciona un cine:</label>
    <select id="cines" name="cines" onchange="mostrarCine()">
        <option value="">-- Seleccionar --</option>
        
        <!-- Aquí se cargarán los cines a través de AJAX -->
    </select>
    </div>
    </td>
    </form>
    </tr>
    </table>

</div>
    <br><br>
<h1>Lista de Cines</h1>
    <div id="resultado"></div>
</body>
</html>
