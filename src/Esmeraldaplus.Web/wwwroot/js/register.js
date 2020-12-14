function validar(){
var nombre1, apellido1, correo, contraseña, recontraseña, ndocumento, expresion;

var nombre1 =document.getElementById('nombre1').value;
var nombre2 =document.getElementById('nombre1').value;
var apellido1 =document.getElementById('apellido1').value;
var apellido2 =document.getElementById('apellido2').value;
var correo =document.getElementById('correo').value;
var contraseña =document.getElementById('contraseña').value;
var recontraseña =document.getElementById('recontraseña').value;
var ndocumento =document.getElementById('ndocumento').value;


if(nombre1==0){
	alert("Debe escribir su nombre");
	return false;
}	
if(nombre1.length>10){
	alert("Su nombre es muy largo");
	return false;
}	
if(nombre1.length<3){
	alert("Su nombre es muy corto");
	return false;
}	

if(apellido1==0){
	alert("Debe escribir su apellido");
	return false;
}	
if(apellido1.length>10){
	alert("Su apellido es muy largo");
	return false;
}
if(apellido1.length<3){
	alert("Su apellido es muy corto");
	return false;
}

if(correo==0){
	alert("Debe escribir su correo");
	return false;
}	

if(contraseña==0){
	alert("Debe escribir una contraseña");
	return false;
}	
if(contraseña.length>50){
	alert("La contraseña debe tener maximo 50 caracteres");
	return false;
}
if(contraseña.length<8){
	alert("La contraseña debe tener minimo 8 caracteres");
	return false;
}

if(recontraseña==0){
	alert("Debe repetir una contraseña");
	return false;
}	
if(recontraseña.length>50){
	alert("La contraseña debe tener maximo 50 caracteres");
	return false;
}
if(recontraseña.length<8){
	alert("La contraseña debe tener minimo 8 caracteres");
	return false;
}

if(ndocumento==0){
	alert("Debe escribir su numero de documento");
	return false;
}	
if(ndocumento.length>10){
	alert("Su numero de Documento debe ser maximo de 10 caracteres");
	return false;
}
if(ndocumento.length<4){
	alert("Su numero de Documento debe ser minimo de 4 caracteres");
	return false;
}



}