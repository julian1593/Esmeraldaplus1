function validar(){
var nombre, correo, telefono, mensaje, expresiones;

var nombre = document.getElementById('nombre-cliente').value;
var correo = document.getElementById('correo').value;
var telefono = document.getElementById('telefono').value;
var mensaje = document.getElementById('mensaje').value;

if(nombre==0){
	alert("Por favor Ingresa tu nombre");
	return false;
}
if(correo==0){
	alert("Por favor Ingresa tu correo electronico");
	return false;
}
if(telefono==0){
	alert("Por favor Ingresa un numero de telefono");
	return false;
}
if(telefono.length<7){
	alert("por favor escriba un numero de telefono valido");
	return false;
}
if(telefono.length>14){
	alert("por favor escriba un numero de telefono valido");
	return false;
}
if(mensaje==0){
	alert("Por favor Ingresa un mensaje");
	return false;
}




}