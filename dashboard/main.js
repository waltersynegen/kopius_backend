$(document).ready(function(){
    tablaPersonas = $("#tablaPersonas").DataTable({
       "columnDefs":[{
        "targets": -1,
        "data":null,
        "defaultContent": "<div class='text-center'><div class='btn-group'><button class='btn btn-primary btnEditar'>Edit</button><button class='btn btn-danger btnBorrar'>Del</button></div></div>"  
       }],
        
    "language": {
            "lengthMenu": "Show _MENU_ records",
            "zeroRecords": "No records found",
            "info": "Showing records from _START_ to _END_ out of a total of _TOTAL_ records",
            "infoEmpty": "Showing records from 0 to 0 out of total of 0 records",
            "infoFiltered": "(filtered out of a total of _MAX_ records)",
            "sSearch": "Search:",
            "oPaginate": {
                "sFirst": "First",
                "sLast":"Last",
                "sNext":"Next",
                "sPrevious": "Previous"
             },
             "sProcessing":"Processing...",
        }
    });
    
$("#btnNuevo").click(function(){
    $("#formPersonas").trigger("reset");
    $(".modal-header").css("background-color", "#1cc88a");
    $(".modal-header").css("color", "white");
    $(".modal-title").text("Nueva Persona");            
    $("#modalCRUD").modal("show");        
    id=null;
    opcion = 1; //alta
});    
    
var fila; //capturar la fila para editar o borrar el registro
    
//botón EDITAR    
$(document).on("click", ".btnEditar", function(){
    fila = $(this).closest("tr");
    id = parseInt(fila.find('td:eq(0)').text());
    nombre = fila.find('td:eq(1)').text();
    apellido = fila.find('td:eq(2)').text();
    email = fila.find('td:eq(3)').text();
    pais = fila.find('td:eq(4)').text();
    edad = parseInt(fila.find('td:eq(5)').text());
    skills = fila.find('td:eq(6)').text();
    puntaje = parseInt(fila.find('td:eq(7)').text());
    comentario = fila.find('td:eq(8)').text();
    
    $("#nombre").val(nombre);
    $("#apellido").val(apellido);
    $("#email").val(email);
    $("#pais").val(pais);
    $("#edad").val(edad);
    $("#skills").val(skills);
    $("#puntaje").val(puntaje);
    $("#comentario").val(comentario);
    opcion = 2; //editar
    
    $(".modal-header").css("background-color", "#4e73df");
    $(".modal-header").css("color", "white");
    $(".modal-title").text("Editar Persona");            
    $("#modalCRUD").modal("show");  
    
});

//botón BORRAR
$(document).on("click", ".btnBorrar", function(){    
    fila = $(this);
    id = parseInt($(this).closest("tr").find('td:eq(0)').text());
    opcion = 3 //borrar
    var respuesta = confirm("¿Está seguro de eliminar el registro: "+id+"?");
    if(respuesta){
        $.ajax({
            url: "bd/crud.php",
            type: "POST",
            dataType: "json",
            data: {opcion:opcion, id:id},
            success: function(){
                tablaPersonas.row(fila.parents('tr')).remove().draw();
            }
        });
    }   
});
    
$("#formPersonas").submit(function(e){
    e.preventDefault();    
    nombre = $.trim($("#nombre").val());
    apellido = $.trim($("#apellido").val());
    email = $.trim($("#email").val());
    pais = $.trim($("#pais").val());
    edad = $.trim($("#edad").val());
    skills = $.trim($("#skills").val());
    puntaje = $.trim($("#puntaje").val());
    comentario = $.trim($("#comentario").val());
    $.ajax({
        url: "bd/crud.php",
        type: "POST",
        dataType: "json",
        data: {
            nombre:nombre,
            apellido:apellido,
            email:email,
            pais:pais,
            edad:edad,
            skills:skills,
            puntaje:puntaje,
            comentario:comentario,
            id:id, 
            opcion:opcion
        },
        success: function(data){  
            console.log(data);
            id = data[0].id;            
            nombre = data[0].nombre;
            apellido = data[0].apellido;
            email = data[0].email;
            pais = data[0].pais;
            edad = data[0].edad;
            skills = data[0].skills;
            puntaje = data[0].puntaje;
            comentario = data[0].comentario;
            if(opcion == 1){tablaPersonas.row.add([id,nombre,apellido,email,pais,edad,skills,puntaje,comentario]).draw();}
            else{tablaPersonas.row(fila).data([id,nombre,apellido,email,pais,edad,skills,puntaje,comentario]).draw();}            
        }        
    });
    $("#modalCRUD").modal("hide");    
    
});    
    
});