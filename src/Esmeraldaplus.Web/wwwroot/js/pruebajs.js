function validar(){
	var correo, correo2, expresiones;

	var correo = document.getElementById('correo').value;
	var correo2 = document.getElementById('correo2').value;


	if(correo==0){
		alert("Verifique e intente nuevamente");
		return false;
	}
	if(correo2==correo){
		alert("El correo no se puede repetir");
		return false
	}
}