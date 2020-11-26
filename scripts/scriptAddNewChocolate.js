function loadListMaterial(){
    const divListMaterial = document.getElementById("listMaterial");

    var xhr = new XMLHttpRequest();
    var url = "http://localhost:3000/getDaftarBahan?harga=true";
    
    xhr.open('GET', url);
    xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');

    xhr.onreadystatechange = () => {
        console.log(xhr.status);
        if(xhr.readyState == 4 && xhr.status == 200) {
            var res = xhr.responseText;
            var jsonResponse = JSON.parse(res);
            console.log(jsonResponse);
            var strHtml = "<div id = 'listMaterial'> <table>";
            strHtml += "<tr> <th>Nama Bahan</th> <th>Harga</th></tr>";
            for (var i in jsonResponse.daftarbahan){
                bahan = jsonResponse.daftarbahan[i];
                strHtml += "<tr>";
                strHtml += "<td>" + bahan.namaBahan + "</td>";
                strHtml += "<td>" + bahan.hargaSatuan + "</td>";
                strHtml += "</tr>";
            }
            strHtml += "</table></div>";
            console.log(strHtml);
            divListMaterial.innerHTML = strHtml;
        }
    }

    xhr.send();  

}

loadListMaterial();


function loadListRecipe(){
    const divListRecipe = document.getElementById("listRecipe");

    
    var SoaMessage = `<?xml version='1.0' encoding='UTF-8'?>
                        <S:Envelope xmlns:S="http://schemas.xmlsoap.org/soap/envelope/">
                            <S:Body>
                                <ns2:getListRecipe xmlns:ns2="http://codejava.net/">
                                   
                                </ns2:getListRecipe>
                            </S:Body>
                        </S:Envelope>`;
    
    var url = "http://localhost:8086/WSFactory/ws/chocolate?wsdl";

    var request = new XMLHttpRequest();
    request.open('POST', url, true);

    request.onreadystatechange = () =>{
        if (request.readyState==4 && request.status==200){
            var res = request.responseXML;
            console.log(res);
            res = res.getElementsByTagName("return")[0].childNodes[0].data;
            divListRecipe.innerHTML=res;
        }
    };
    request.setRequestHeader("Content-type", "text/xml  ");

    request.send(SoaMessage);
    
}

loadListRecipe();

const formResep = document.getElementById("formResep");

function doSend(event){
    const name = document.getElementById("name").value;
    const price = document.getElementById("price").value;
    const description = document.getElementById("description").value;
    const listBahan = document.getElementById("listBahan").value;
    const listJumlahBahan = document.getElementById("listJumlahBahan").value;
    var chocolateImg = document.getElementById("chocolateImg").value;


    var SoaMessage = `<?xml version='1.0' encoding='UTF-8'?>
    <S:Envelope xmlns:S="http://schemas.xmlsoap.org/soap/envelope/">
        <S:Body>
            <ns2:addNewChocolateRecipe xmlns:ns2="http://codejava.net/">
               <arg0>${name}</arg0>
               <arg1>${listBahan}</arg1>
               <arg2>${listJumlahBahan}</arg2>
               <arg3>${price}</arg3>
            </ns2:addNewChocolateRecipe>
        </S:Body>
    </S:Envelope>`;

    var url = "http://localhost:8086/WSFactory/ws/chocolate?wsdl";

    
    var request = new XMLHttpRequest();
    request.open('POST', url, true);

    request.onreadystatechange = () =>{
        if (request.readyState==4 && request.status==200){
            var res = request.responseXML;
            console.log(res);
        }
    };
    request.setRequestHeader("Content-type", "text/xml  ");

    request.send(SoaMessage);
}

formResep.addEventListener('submit', doSend);