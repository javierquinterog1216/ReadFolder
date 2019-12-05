//requiring path and fs modules
const path = require('path');
const fs = require('fs');

//joining path of directory 
//"\\ovsappdwh\TEMIS\Produccion\004\Archivos\Vehiculo"
const directoryPath = '\\\\ovsappdwh/TEMIS/Produccion/004/Archivos/Vehiculo';
//const directoryPath = __dirname;
const rutaOrigen = path.join(directoryPath, 'Documento');
const rutaDestino = path.join(directoryPath, 'DocumentosConductores');
// lectura del archivo xlsx
const pathFileXlsx = "C:\\DEV\\ReadFolder\\FileExcel.xlsx";
var xlsx = require('node-xlsx');
var libro = xlsx.parse(__dirname + '/FileExcel_IMP.xlsx');
var listaArchivos = libro.map(hoja => hoja.data.map(col => ({ origen: col[0], destino: col[1] })))[0];



function copiar(orig, dest) {
    try {
        fs.renameSync(orig, dest);
        return true;
    } catch (error) {
        console.log(error);
        return false;
    }
}
//passsing directoryPath and callback function
fs.readdir(rutaOrigen, function (err, files) {
    //handling error
    if (err) {
        return console.log('Unable to scan directory: ' + err);
    }
    //listing all files using forEach
    files.forEach(function (file) {
        let archivo = listaArchivos.find(a => a.origen == file);
        if (archivo) {
            var res = copiar(path.join(rutaOrigen, file), path.join(rutaDestino, archivo.destino));
            if (res) {
                console.log("el archivo " + file + " se copio correctamente");
            }
        }
    });
});