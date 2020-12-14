function validar(){
var correo, contraseña, expresiones;

var correo = document.getElementById('correo').value;
var contraseña = document.getElementById('contraseña').value;

if(correo==0){
	alert("Debe escribir un Correo Electronico");
	return false;
}

if(contraseña==0){
	alert("Debe escribir su contraseña");
	return false;
}
if(contraseña.length<8){
	alert("Contraseña incorrecta, su contraseña debe contener al menos 8 caracteres");
	return false;
}
if(contraseña.length>50){
	alert("Contraseña incorrecta, su contraseña no puede contener mas de 50 caracteres");
	return false;
}



}