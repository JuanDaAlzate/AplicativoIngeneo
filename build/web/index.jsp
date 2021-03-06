
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="util.ClassConex"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Registros</title>
        <!--LLamado a bootstrap-->
        <link rel="stylesheet" href="css/bootstrap.min.css"/>
        <!-- LLamado al archivo que contiene nuestro estilos-->
        <link rel="stylesheet" href="css/Stylo.css"/>      
        <!--LLamado a las fuentes-->
        <link href='https://fonts.googleapis.com/css?family=Raleway' rel='stylesheet' type='text/css'>
         <script src="js/jquery-1.12.1.min.js"></script>
        <script src="js/Javascript.js" type="text/javascript"></script>

    </head>
    
    <body>
        <div id="contenedor1" class="container"> 
            <div class="navbar navbar-inverse navbar-fixed-top">
                <div class="container">
                    <a id="txtnavbar" href="#" class="navbar-brand">INGENEO WEB</a>
                    <button class="navbar-toggle" data-toggle="collapse" data-target=".navHeaderCollapse">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>

                    <div class="collapse navbar-collapse navHeaderCollapse">
                        <ul class="nav navbar-nav navbar-right">
                            <li class="active"><a href="#contenedor1">EMPLEADOS</a></li>
                            <li><a href="#contenedor2">DEPARTAMENTOS</a></li>
                            <li><a href="#contenedor3">CATEGORIA</a></li>
                            <li><a href="#contenedor4">NOMINA</a></li>
                            <li><a href="#contenedor5">CONTRATO</a></li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown">SOCIAL MEDIA<b class="caret"></b></a>
                                <ul class="dropdown-menu">
                                    <li><a href="#">OUTLOOK</a></li>
                                    <li><a href="#">GMAIL</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <br>
            <p class="titulo">Gestion empleados</p>
            <br><br>
            <div class="contenedor col-md-4">


                <center><h2>Registro de empleados</h2></center>

                <% if (request.getAttribute("mensaje") != null) { %> 
                <div class="col-md-12 alert alert-info" role="alert">

                    ${mensaje} 
                </div>
                <% }%>                        

                <br><br>
                <form action="ServletEmpleado" action="POST">
                    <legend>employee data</legend>
                   

                    <div id="divIdenE" class="input-group">
                        <span class="input-group-addon" id="basic-addon1" >Identificacion</span>
                        <% if(request.getAttribute("id")==null){%>
                        <input id="inputIdenE" id="redondo" type="text" class="form-control" name="txtIdentificacion" placeholder="ID/CC" aria-describedby="basic-addon1" required pattern="^[0-9]{6,10}$" title="Debe ser un numero menor de 10 digitos, y no debe contener numeros"   value=""/>
                        <% }else{ %>
                        <input id="inputIdenE" id="redondo" type="text" class="form-control" name="txtIdentificacion" placeholder="ID/CC" aria-describedby="basic-addon1" required pattern="^[0-9]{6,10}$" title="Debe ser un numero menor de 10 digitos, y no debe contener numeros"  value="<%=request.getAttribute("id")%>"/>
                       <% } %>
                    </div>
                    <br>
                    <div id="divNomE" class="input-group">                        
                        <span class="input-group-addon" id="basic-addon1">Nombre</span>
                        <% if(request.getAttribute("nom")==null){ %>
                           <input id="inputNomE" id="redondo" type="text" class="form-control" name="txtNombre" placeholder="First name" aria-describedby="basic-addon1" title="Es necesario agregar un nombre, y debe contener letras"  required value=""/>
                   
                        <%}else{%>
                        <input id="inputNomE" id="redondo" type="text" class="form-control" name="txtNombre" placeholder="First name" aria-describedby="basic-addon1" title="Es necesario agregar un nombre, y debe contener letras"  required value="<%= request.getAttribute("nom")%>"/>
                       <%}%>
                    </div>
                    <br>
                    <div id="divApeE" class="input-group">
                        <span class="input-group-addon" id="basic-addon1">Apellido</span>
                        <% if(request.getAttribute("ape")==null){%>
                        <input id="inputApeE" id="redondo" type="text" class="form-control" name="txtApellido" placeholder="Last name" aria-describedby="basic-addon1"  required title="Es necesario  agregar un apellido, y debe contener letras"  value=""/>
                        <% }else {%>
                        <input id="inputApeE" id="redondo" type="text" class="form-control" name="txtApellido" placeholder="Last name" aria-describedby="basic-addon1"  required title="Es necesario agregar un apellido, y debe contener letras"  value="<%=request.getAttribute("ape")%>"/>
                        <% }%>
                    </div>
                    <br>
                    <div id="divDirE" class="input-group">
                        <span class="input-group-addon" id="basic-addon1">Direccion</span>
                        <% if(request.getAttribute("dir")==null){%>
                        <input id="inputDirE" id="redondo" type="text" class="form-control" name="txtDireccion" placeholder="(Cr 11 #23-12)" aria-describedby="basic-addon1"  required title="Es necesario agregar una direccion ,y debe contener letras"  value=""/>
                        <% }else{%>
                         <input id="inputDirE" id="redondo" type="text" class="form-control" name="txtDireccion" placeholder="(Cr 11 #23-12)" aria-describedby="basic-addon1"  required title="Es necesario agregar una direccion ,y debe contener letras"  value="<%=request.getAttribute("dir")%>"/>
                       
                        <% }%>
                    </div>
                    <br>
                    <div id="divTelE" class="input-group">
                        <span class="input-group-addon" id="basic-addon1">Telefono</span>
                        <% if(request.getAttribute("tel")==null){%>
                        <input id="inputTelE" id="tel" id="redondo" type="number" required class="form-control" name="txtTelefono" placeholder="Phone number" aria-describedby="basic-addon1"  title="Es necesaria agregar un telefono, y debe contener numeros"  value=""/>
                        <% }else{%>
                         <input id="inputTelE" id="tel" id="redondo" type="number" required class="form-control" name="txtTelefono" placeholder="Phone number" aria-describedby="basic-addon1"  title="Es necesaria agregar un telefono, y debe contener numeros"  value="<%=request.getAttribute("tel")%>"/>
                        <% }%>
                    </div>
                    <br>
                    <div id="divJefE"  class="input-group">
                        <span class="input-group-addon" id="basic-addon1" >Asignar un </span>
                        <select disabled id="inputIdenJE" class="form-control" name="txtEmpleadoJefe" id="sel1" aria-describedby="basic-addon1"  title="Es necesaria asignar un jefe a este empleado">                              
                            <%if (request.getAttribute("name_jefe") != null) {%>
                            <option value="<%=request.getAttribute("id_jefe")%>"><%= request.getAttribute("name_jefe")%></option>
                            <%} else {%>
                            <option value="">Jefe</option>
                            <%}%>
                            <!--Con estas lineas de codigo llamamos los empleados que estan en el sistema-->
                            <%
                                 
                                ClassConex conn = new ClassConex();
                                PreparedStatement consultaEmpleado = conn.ObtenerConexion().prepareStatement("SELECT ID,nombreE FROM empleado");
                                ResultSet res = consultaEmpleado.executeQuery();
                                while (res.next()) {%>
                            <option value="<%= res.getString("ID")%>"><%= res.getString("nombreE")%></option>
                            <%}%>
                        </select>                        
                    </div>
                    <br>
                    <div id="divAcciones" class="btn-group col-md-12">
                        <input id="redondo btn-ok"  type="submit" class="btn btn-primary btn-md btn-block active" value="Ok">
                        <br><br>
                        <div class="form-group col-md-6">                        
                            <select id="listaOpciones" class="form-control btn-info" name="txtOpcion">
                                <option value="1">CREATE</option>
                                <option value="2">ELIMINAR</option>
                                <option value="3">ACTUALIZAR</option>
                                <option value="4">CONSULTAR </option>
                                
                            </select>
                        </div>
                    </div>               
                </form>   

            </div>            
            <div class="col-md-1">

            </div>  

            <div class="contenedor col-md-7">
                <center><h2>Consulta de empleados</h2></center>
                <br><br>
                <legend>All the employees</legend>
                <div id="resulset" class="table-responsive">
                    <%  
                        PreparedStatement consultaEmpleados = conn.ObtenerConexion().prepareStatement("select empleado.ID,empleado.cod_empleado,empleado.nombreE,empleado.apellido,empleado.direccion,empleado.telefono,jefe.ID,jefe.nombreE,jefe.apellido,ct.cod_categoria,ct.nombreC from empleado left join empleado jefe on empleado.id_responsable=jefe.ID left join categoria_profesional ct on empleado.cod_categoria=ct.cod_categoria;");
                        ResultSet res1 = consultaEmpleados.executeQuery();
                        
                        if (res1 != null) {%>
                    <table border="1" class="table table-striped table-bordered table-hover table-condensed">
                        <tr>
                            <th>ID</th><th>CODIGO_EMPLEADO</th><th>NOMBRE</th><th>APELLIDO</th><th>DIRECCION</th><th>TELEFONO</th><th>ID_RESPONSABLE</th><th>NOMBRE_RESPONSABLE</th><th>APELLIDO_RESPONSABLE</th><th>CODIGO_CATEGORIA</th><th>NOMBRE_CATEGORIA</th><!--<th colspan="2">OPCIONES</th>-->
                        </tr>
                        <%while (res1.next()) {%> 
                        <tr> 
                            <td> <%=res1.getString(1)%></td> 
                            <td> <%=res1.getString(2)%></td> 
                            <td> <%=res1.getString(3)%></td>
                            <td> <%=res1.getString(4)%></td>
                            <td> <%=res1.getString(5)%></td>
                            <td> <%=res1.getString(6)%></td>
                            <td> <%=res1.getString(7)%></td>
                            <td> <%=res1.getString(8)%></td>
                            <td> <%=res1.getString(9)%></td>
                            <td> <%=res1.getString(10)%></td>
                            <td> <%=res1.getString(11)%></td>
                           
                            
                           <!-- <td> <a href="#" alt="" onclick="valida_envia('4', '<%=res1.getString(1)%>');">SELECCIONAR</a></td>
                            <td> <a href="#" alt="" onclick="valida_envia('2', '<%=res1.getString(1)%>');">BORRAR</a></td>-->
                        </tr>
                        <%}%>
                    </table>
                    <%}%>
                </div>
            </div>                
        </div>

        <!--Este es el siguiente contenedor con la funcionalidad de gestionar los departamentos-->
        <div id="contenedor2" class="container">           
            <p class="titulo">Gestion de los departamentos</p>
            <br><br>
            <div class="contenedor col-md-4">
                <center><h2>Registro de departamentos</h2></center>

                <% if (session.getAttribute("mensajeD") != null) { %> 
                <div class="col-md-12 alert alert-info" role="alert">

                    ${mensajeD} 
                </div>
                <% }%> 

                <br><br>

                <form action="ServleDepartamento" method="POST">
                    <legend>Apartaments</legend>
                    <div id="divNomD" class="input-group">
                        <span class="input-group-addon" id="basic-addon1" >Nombre del departamento</span>
                        <% if(session.getAttribute("nombre")==null) {%>
                        <input id="inputNomD" id="redondo" type="text" class="form-control" name="txtNombreDepartamento" placeholder="Name" aria-describedby="basic-addon1" title="Es necesaria agregar un  nombre al departamento" required value=""/>
                       <% }else{%>
                       <input id="inputNomD" id="redondo" type="text" class="form-control" name="txtNombreDepartamento" placeholder="Name" aria-describedby="basic-addon1" title="Es necesaria agregar un nombre al departamento" required value="<%=session.getAttribute("nombre")%>"/>
                       <%}%>
                    </div>
                    <br>
                    <div id="divSelectJefeD" class="input-group">
                        <span class="input-group-addon" id="basic-addon1" >Asignar </span>
                        <select id="inputIdenEn" class="form-control" name="txtEmpleadoEncargado" id="sel1" aria-describedby="basic-addon1"  title="Es necesaria asignar un coordinador a este departamento" required>                              
                            <%if (session.getAttribute("nombre_Coordinador") != null) {%>
                            <option value="<%=session.getAttribute("id_Coordinador")%>"><%= session.getAttribute("nombre_Coordinador")%></option>
                            <%} else {%>
                            <option value="">Coordinador</option>
                            <%}%>
                            <!--Con estas lineas de codigo llamamos los empleados que estan en el sistema-->
                            <%
                               
                                PreparedStatement consultaApartamentosEmpleados = conn.ObtenerConexion().prepareStatement("SELECT ID,nombreE FROM empleado");
                                ResultSet resApartamentos = consultaApartamentosEmpleados.executeQuery();
                                while (resApartamentos.next()) {%>
                            <option value="<%= resApartamentos.getString("ID")%>"><%= resApartamentos.getString("nombreE")%></option>
                            <%}%>
                        </select>                        
                    </div>
                    <br>

                    <div id="divCodD" class="input-group">
                        <span class="input-group-addon" id="basic-addon1" >Codigo del departamento a eliminar</span>
                        <input id="inputCodE" id="redondo" disabled type="number" class="form-control" name="txtCodigoDepartamentoEliminar" placeholder="Cod_departamento" required aria-describedby="basic-addon1" title="Es necesaria agregar el codigo del departamento que va a eliminar"  value="<%=session.getAttribute("cod_departamento")%>"/>
                    </div>   
                    <br>
                    <div id="divAcciones2" class="btn-group col-md-12">
                        <input id="redondo btn-ok"  type="submit" class="btn btn-primary btn-md btn-block active" value="Ok">
                        <br><br>
                        <div class="form-group col-md-6">                        
                            <select id="listaOpciones2" class="form-control btn-info" name="txtOpcionDepartamento" required>
                                <option value="1">CREATE</option>
                                <option value="2">ELIMINAR</option>
                                <option value="3">ACTUALIZAR</option>
                                <option value="4">CONSULTAR </option>
                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="col-md-1"></div>

            <div class="contenedor col-md-7">
                <center><h2>Consulta de departamentos</h2></center>
                <br><br>
                <legend>All the departamentos</legend>
                <div id="resulset" class="table-responsive">
                    <% PreparedStatement consulta2 = conn.ObtenerConexion().prepareStatement("select departamento.*,empleado.nombreE from empleado inner join departamento on departamento.id_coordinador=empleado.ID");
                        ResultSet res2 = consulta2.executeQuery();
                        if (res2 != null) {%>
                    <table border="1" class="table table-striped table-bordered table-hover table-condensed">
                        <tr>
                            <th>COD_DEPARTAMENTO</th><th>NOMBRE_DEPARTAMENTO</th><th>ID_COORDINADOR</th><th>NOMBRE_ENCARGADO</th>
                        </tr>
                        <%while (res2.next()) {%> 
                        <tr> 
                            <td> <%=res2.getString(1)%></td> 
                            <td> <%=res2.getString(2)%></td> 
                            <td> <%=res2.getString(3)%></td>
                            <td> <%=res2.getString(4)%></td>
                            <!--<td> <a href="#" alt="" onclick="valida_envia('4', '<%=res2.getString(1)%>');">SELECCIONAR</a></td>
                            <td> <a href="#" alt="" onclick="valida_envia('2', '<%=res2.getString(1)%>');">BORRAR</a></td>-->
                        </tr>
                        <%}%>
                    </table>
                    <%}%> 
                </div>
            </div>
        </div>

        <!--En este contenedor se estara presentados los campos y l ainformacion para gestionar la categoria profesional--> 
        <div id="contenedor3" class="container">
            <p class="titulo">Gestion de la categoria profesional</p>
            <br><br>
            <div class="contenedor col-md-4">
                <center><h2>Registro de una categoria profesional</h2></center>
                    <% if (session.getAttribute("Mensaje") != null) { %> 
                <div class="col-md-12 alert alert-info" role="alert">

                    ${Mensaje} 
                </div>
                <% }%>  
                <br><br>
                <form action="ServeltCategoria" method="POST">
                    <legend>professional categories</legend>
                    <div id="divNombreCate" class="input-group">
                        <span class="input-group-addon" id="basic-addon1" >Nombre de la categoria</span>
                        <input id="inputNomcate" type="text" id="redondo" class="form-control" aria-describedby="basic-addon1" name="txtNombreCategoria" placeholder="Name" title="Es necesaria agregar un nombre para la categoria" required/>
                    </div>
                    <br>
                    <div id="divCodigoCate" class="input-group">
                        <span class="input-group-addon" id="basic-addon1" >Codigo de la categoria a eliminar</span>
                        <input id="inputCodCate" type="number"  disabled id="redondo"  class="form-control" aria-describedby="basic-addon1" name="txtCodigoCategoria" placeholder="cod_categoria" title="Es necesaria agregar el codigo de la categoria para poder eliminar" required/>
                    </div>
                    <br>
                    <div id="divAcciones3" class="btn-group col-md-12">
                        <input id="redondo btn-ok"  type="submit" class="btn btn-primary btn-md btn-block active" value="Ok">
                        <br><br>
                        <div class="form-group col-md-6">                        
                            <select id="listaOpciones3" class="form-control btn-info" name="txtOpcion">
                                <option value="1">CREATE</option>
                                <option value="2">ELIMINAR</option>
                                <option value="3">ACTUALIZAR</option>
                            </select>
                        </div>
                    </div> 
                </form>
            </div>
            <div class="col-md-1"></div>
            <div class="contenedor col-md-7">
                <center><h2>Consulta de las categorias profesionales</h2></center>
                <br><br>
                <legend>All the professional categories</legend>
                <div id="resulset" class="table-responsive">
                    <% PreparedStatement consulta3 = conn.ObtenerConexion().prepareStatement("SELECT * FROM categoria_profesional;");
                        ResultSet res3 = consulta3.executeQuery();
                        if (res3 != null) {%>
                    <table border="1" class="table table-striped table-bordered table-hover table-condensed">
                        <tr>
                            <th>COD_CATEGORIA</th><th>NOMBRE</th>
                        </tr>
                        <%while (res3.next()) {%> 
                        <tr> 
                            <td> <%=res3.getString(1)%></td> 
                            <td> <%=res3.getString(2)%></td> 

<!--<td> <a href="#" alt="" onclick="valida_envia('4', '<%=res3.getString(1)%>');">SELECCIONAR</a></td>
<td> <a href="#" alt="" onclick="valida_envia('2', '<%=res3.getString(1)%>');">BORRAR</a></td>-->
                        </tr>
                        <%}%>
                    </table>
                    <%}%> 
                </div>                
            </div>
        </div>

        <!--En este contenedor se estara presentados los campos y la informacion para gestionar las categoria profesional -->    
        <div id="contenedor4" class="container">
            <p class="titulo">Gestion de las nominas de los empleados</p>
            <br><br>
            <div class="contenedor col-md-4">
                <center><h2>Registro de una nomina</h2></center>
                    <% if (session.getAttribute("MensajeN") != null) { %> 
                <div class="col-md-12 alert alert-info" role="alert">

                    ${MensajeN} 
                </div>
                <% }%>  
                <br><br>
                <form action="ServletNomina" method="POST">
                    <legend>Payrolls an employee</legend>
                    <div id="divFechaNomina" class="input-group">
                        <span class="input-group-addon" id="basic-addon1" >Fecha</span>
                        <input id="inputFechaNomina" type="date" id="redondo" class="form-control" aria-describedby="basic-addon1" name="txtFechaNomina" placeholder="Date" title="Es necesario que ingrese una fecha" required value="<%= session.getAttribute("fecha")%>"/>
                    </div>
                    <br>
                    <div id="divSalarioNomina" class="input-group">
                        <span class="input-group-addon" id="basic-addon1" >Salario</span>
                        <input id="inputSalarioNomina" type="number" id="redondo" class="form-control" aria-describedby="basic-addon1" name="txtSalarioNomina" placeholder="Salario correspondiente" title="Es necesario agregar un salario" required value="<%= session.getAttribute("salario")%>"/>
                    </div>
                    <br>
                    <div id="divCodEmpleadoNomina" class="input-group">
                        <span class="input-group-addon" id="basic-addon1" >Empleado </span>
                        <select id="inputCodEmpleadoNomina" class="form-control" name="txtEmpleadoNomina" id="sel1" aria-describedby="basic-addon1"  title="Es necesaria asignar un empleado para la esta nomina" required>                              
                            <%if (session.getAttribute("nombre") != null) {%>
                            <option value="<%=session.getAttribute("id_empleado")%>"><%= session.getAttribute("nombre")%></option>
                            <%} else {%>
                            <option value="">Empleado</option>
                            <%}%>
                            <!--Con estas lineas de codigo llamamos los empleados que estan en el sistema-->
                            <%
                                PreparedStatement consultaEmpleadoNomina = conn.ObtenerConexion().prepareStatement("SELECT ID,nombreE FROM empleado");
                                ResultSet resEmpleadoNomina = consultaEmpleadoNomina.executeQuery();
                                while (resEmpleadoNomina.next()) {%>
                            <option value="<%= resEmpleadoNomina.getString("ID")%>"><%= resEmpleadoNomina.getString("nombreE")%></option>
                            <%}%>
                        </select>                        
                    </div>
                    <br>
                    <div id="divCodnomina" class="input-group col-md-7">
                        <span class="input-group-addon" id="basic-addon1" >Cod_nomina</span>
                        <input id="inputCodNomina" disabled type="number" id="redondo" class="form-control" aria-describedby="basic-addon1" name="txtCodigoNomina" placeholder="cod nomina" title="Es necesario agregar el codigo de la nomina si quieres eliminarla" value="<%= session.getAttribute("cod_nomina")%>"/>
                    </div>
                    <br>
                    <div class="btn-group col-md-12">
                        <input id="redondo btn-ok"  type="submit" class="btn btn-primary btn-md btn-block active" value="Ok">
                        <br><br>
                        <div class="form-group col-md-6">                        
                            <select id="listaOpciones4" class="form-control btn-info" name="txtOpcion">
                                <option value="1">CREATE</option>
                                <option value="2">ELIMINAR</option>
                                <option value="3">ACTUALIZAR</option>
                                <option value="4">CONSULTAR</option>
                            </select>
                        </div>
                    </div> 
                </form>
            </div>

            <div class="col-md-1">

            </div>

            <div class="contenedor col-md-7">
                <center><h2>Consulta de las nominas creadas</h2></center>
                <br><br>
                <legend>All the payrolls</legend>
                <div id="resulset" class="table-responsive">
                    <% PreparedStatement consulta4 = conn.ObtenerConexion().prepareStatement("select nomina.*,empleado.nombreE from empleado inner join nomina on nomina.id_empleado=empleado.ID");
                        ResultSet res4 = consulta4.executeQuery();
                        if (res4 != null) {%>
                    <table border="1" class="table table-striped table-bordered table-hover table-condensed">
                        <tr>
                            <th>COD_NOMINA</th><th>FECHA</th><th>SALARIO</th><th>ID_EMPLEADO</th><th>NOMBRE_EMPLEADO</th>
                        </tr>
                        <%while (res4.next()) {%> 
                        <tr> 
                            <td> <%=res4.getString(1)%></td> 
                            <td> <%=res4.getString(2)%></td> 
                            <td> <%=res4.getString(3)%></td> 
                            <td> <%=res4.getString(4)%></td> 
                            <td> <%=res4.getString(5)%></td> 

                        <!--<td> <a href="#" alt="" onclick="valida_envia('4', '<%=res4.getString(1)%>');">SELECCIONAR</a></td>
                        <td> <a href="#" alt="" onclick="valida_envia('2', '<%=res4.getString(1)%>');">BORRAR</a></td>-->
                        </tr>
                        <%}%>
                    </table>
                    <%}%> 
                </div>                
            </div>
        </div>

        <!--En este contenedor se manejara la gestion de los contratos-->
        <div id="contenedor5" class="container">
            <p class="titulo">Gestion de las contratos de los empleados</p>
            <br><br>
            <div class="contenedor col-md-4">
                <center><h2>Crear un contrato</h2></center>
                    <% if (session.getAttribute("mensajeContrato") != null) { %> 
                <div class="col-md-12 alert alert-info" role="alert">

                    ${mensajeContrato} 
                </div>
                <% }%>  
                <br><br>
                <form action="ServletContrato" method="POST">
                    <legend>Contract of a employee</legend>
                    <div id="divFechaInicioContrato" class="input-group">
                        <span id="basic-addon1" class="input-group-addon">Fecha inicio</span>
                        <input id="inputFechaInicioContrato" type="date" id="redondo" class="form-control" aria-describedby="basic-addon1" name="txtFechaInicio" placeholder="Fecha ini" required title="Es necesario agregar una fecha inical para registrar este contrato" value="<%= session.getAttribute("fechaInicio")%>"/>
                    </div>
                    <br>
                    <div id="divFechaFinalContrato" class="input-group">
                        <span id="basic-addon1" class="input-group-addon">Fecha final</span>
                        <input id="inputFechaFinalContrato" type="date" id="redondo" class="form-control" aria-describedby="basic-addon1" name="txtFechaFinal" placeholder="Fecha fin" title="Es necesario agregar una fecha final para registrar este contrato" value="<%= session.getAttribute("fechaFinal")%>"/>
                    </div>
                    <br>
                    <div id="divEmpleadoContrato" class="input-group">
                        <span class="input-group-addon" id="basic-addon1" >Seleccione </span>
                        <select id="inputEmpleadoContrato" class="form-control" name="txtEmpleadoAContratar" id="sel1" aria-describedby="basic-addon1"  title="Es necesaria asignar un empleado para la contratacion" required>                              
                            <%if (session.getAttribute("nombreEmpleado") != null) {%>
                            <option value="<%=session.getAttribute("id_empleado")%>"><%= session.getAttribute("nombreEmpleado")%></option>
                            <%} else {%>
                            <option value="">Empleado</option>
                            <%}%>
                            <!--Con estas lineas de codigo llamamos los empleados que estan en el sistema-->
                            <%
                                PreparedStatement consultaEmpleadoContrato = conn.ObtenerConexion().prepareStatement("SELECT ID,nombreE FROM empleado");
                                ResultSet resEmpleadoC = consultaEmpleadoContrato.executeQuery();
                                while (resEmpleadoC.next()) {%>
                            <option value="<%= resEmpleadoC.getString("ID")%>"><%= resEmpleadoC.getString("nombreE")%></option>
                            <%}%>
                        </select>                        
                    </div>
                    <br>
                    <div id="divCategoriaContrato" class="input-group">
                        <span class="input-group-addon" id="basic-addon1" >Seleccione </span>
                        <select id="inputCategoriaContrato" class="form-control" name="txtContratoCategoria" id="sel1" aria-describedby="basic-addon1"  title="Es necesaria asignar un empleado para la nomina" required>                              
                            <%if (session.getAttribute("nombreCategoria") != null) {%>
                            <option value="<%=session.getAttribute("codigoCategoria")%>"><%= session.getAttribute("nombreCategoria")%></option>
                            <%} else {%>
                            <option value="">Categoria</option>
                            <%}%>
                            <!--Con estas lineas de codigo llamamos los empleados que estan en el sistema-->
                            <%
                                PreparedStatement consultaCategoria= conn.ObtenerConexion().prepareStatement("SELECT * FROM categoria_profesional");
                                ResultSet resCategoria = consultaCategoria.executeQuery();
                                while (resCategoria.next()) {%>
                            <option value="<%= resCategoria.getString("cod_categoria")%>"><%= resCategoria.getString("nombreC")%></option>
                            <%}%>
                        </select>                        
                    </div>
                    <br>
                     <div id="divCodigoContrato" class="input-group col-md-7 center-block">
                        <span id="basic-addon1" class="input-group-addon">Cod_contrato</span>
                        <input id="inputCodigoContrato" disabled type="number" id="redondo" class="form-control" aria-describedby="basic-addon1" name="txtCodigoContrato" placeholder="Utilizado para eliminar un contrato" required title="Es necesario agregar el codigo del contrato si lo desea eliminar" required value="<%= session.getAttribute("codigoContrato")%>"/>
                    </div>
                    <br>
                    <br>
                    <br>
                    <div  id="divAcciones5" class="btn-group col-md-12">
                        <input id="redondo btn-ok"  type="submit" class="btn btn-primary btn-md btn-block active" value="Ok">
                        <br><br>
                        <div class="form-group col-md-6">                        
                            <select id="listaOpciones5" class="form-control btn-info" name="txtOpcion">
                                <option value="1">CREATE</option>
                                <option value="2">ELIMINAR</option>
                                <option value="3">ACTUALIZAR</option>
                                <option value="4">CONSULTAR</option>
                            </select>
                        </div>
                    </div> 
                </form>   
            </div>  
                    
                    <div class="col-md-1">
                       
                    </div>
            
            <div class="contenedor col-md-7">
                
                <center><h2>Consulta de los contratos hechos</h2></center>
                <br><br>
                <legend>All the contracts</legend>
                <div id="resulset" class="table-responsive">
                    <% PreparedStatement consultaContratos = conn.ObtenerConexion().prepareStatement("SELECT cod_contrato,fecha_inicio,fecha_fin,id_empleado,nombreE,apellido,codigo_categoria,nombreC from contrato c,empleado e,categoria_profesional cp where c.id_empleado=e.ID and c.codigo_categoria=cp.cod_categoria;");
                        ResultSet resContratos = consultaContratos.executeQuery();
                        if (resContratos != null) {%>
                    <table border="1" class="table table-striped table-bordered table-hover table-condensed">
                        <tr>
                            <th>COD_CONTRATO</th><th>FECHA_INICIO</th><th>FECHA_FINAL</th><th>ID_EMPLEADO</th><th>NOMBRE_EMPLEADO</th><th>APELLIDO</th><th>CODIGO_CATEGORIA</th><th>NOMBRE_CATEGORIA</th>
                        </tr>
                        <%while (resContratos.next()) {%> 
                        <tr> 
                            <td> <%=resContratos.getString(1)%></td> 
                            <td> <%=resContratos.getString(2)%></td> 
                            <td> <%=resContratos.getString(3)%></td> 
                            <td> <%=resContratos.getString(4)%></td> 
                            <td> <%=resContratos.getString(5)%></td> 
                            <td> <%=resContratos.getString(6)%></td> 
                            <td> <%=resContratos.getString(7)%></td> 
                            <td> <%=resContratos.getString(8)%></td> 

                            <!--<td> <a href="#" alt="" onclick="valida_envia('4', '<%=resContratos.getString(1)%>');">SELECCIONAR</a></td>
                            <td> <a href="#" alt="" onclick="valida_envia('2', '<%=resContratos.getString(1)%>');">BORRAR</a></td>-->
                        </tr>
                        <%}%>
                    </table>
                    <%}%> 
                </div>
                
            </div>
        </div>    



        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="js/jquery-1.12.1.min.js"></script>
        <!-- Latest compiled and minified JavaScript -->
        <script src="js/bootstrap.min.js"></script>


    </body>
</html>
