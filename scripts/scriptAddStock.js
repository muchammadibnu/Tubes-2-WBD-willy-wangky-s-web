function doAddAmountStock(maxAmount){
    let amount = + document.getElementsByClassName("detail")[0].getElementsByTagName("p")[1].innerHTML;
    if(amount+1>=10){
        document.getElementById("countAmount").style.width = "142px"
    }
    document.getElementsByClassName("detail")[0].getElementsByTagName("p")[1].innerHTML = 1+amount;
}
function doDecreaseAmountStock(event){
    event.preventDefault();
    let amount = + document.getElementsByClassName("detail")[0].getElementsByTagName("p")[1].innerHTML;
    if(amount-1<10){
        document.getElementById("countAmount").style.width = "134px"
    }
    if(amount-1>=1){
        document.getElementsByClassName("detail")[0].getElementsByTagName("p")[1].innerHTML = amount - 1;
    }
}
function doSubmitAdd(id, name){
    let amount = + document.getElementsByClassName("detail")[0].getElementsByTagName("p")[1].innerHTML;
    var xhr = new XMLHttpRequest();
    if(doGiveRequest(name,amount)){
        var url = "action_AddStock.php";
        var params = "amount=" + amount + "&id=" +id;
        xhr.open('POST', url);
        xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');

        xhr.onreadystatechange = () => {
            if(xhr.readyState == 4 && xhr.status == 200) {
                if (xhr.responseText=="success"){
                    alert("add stock successfull");
                    document.location.href='index.php';
                }
                else{
                    alert("Server goes wrong, Please reload again");
                    document.location.reload();
                }
            }
        }
        xhr.send(params);
    }
}

function doGiveRequest(name,amount){
    var soapMessage= `<?xml version='1.0' encoding='UTF-8'?>
                        <S:Envelope xmlns:S="http://schemas.xmlsoap.org/soap/envelope/">
                            <S:Body>
                                <ns2:reqAddChocolate xmlns:ns2="http://codejava.net/">`;
    soapMessage += `                <arg0>`+"'"+name+"'"+`</arg0>`+`<arg1>`+amount+`</arg1>`;             
    soapMessage +=`              </ns2:reqAddChocolate>
                            </S:Body>
    
                            </S:Envelope>`;
    console.log(soapMessage)
    var url = "http://localhost:8086/WSFactory/ws/requestchocolate?wsdl";

    var request = new XMLHttpRequest();

    request.open('POST', url, true);
    request.onreadystatechange = function() {
        if (request.readyState==4 && this.status == 200){
            var res = request.responseXML;
            res = res.getElementsByTagName("return")[0].childNodes[0].data
            console.log(res)
            if(doCheckRequest(res)){
                return true
            }
        }
    };
    request.setRequestHeader("Content-type", "text/xml");

    request.send(soapMessage);

}

function doCheckRequest(id){

    var soapMessage= `<?xml version='1.0' encoding='UTF-8'?>
                        <S:Envelope xmlns:S="http://schemas.xmlsoap.org/soap/envelope/">
                            <S:Body>
                                <ns2:checkStatus xmlns:ns2="http://codejava.net/">`;
    soapMessage += `                <arg0>`+id+`</arg0>`;             
    soapMessage +=`              </ns2:checkStatus>
                            </S:Body>
    
                            </S:Envelope>`;
    var url = "http://localhost:8086/WSFactory/ws/requestchocolate?wsdl";

    var request = new XMLHttpRequest();

    request.open('POST', url, true);
    request.onreadystatechange = function() {
        if (request.readyState==4 && this.status == 200){
            var res = request.responseXML;
            res = res.getElementsByTagName("return")[0].childNodes[0].data
            console.log(res)
            if(res == "DELIVERED"){
                return true
            }
            else{
                setTimeout(doCheckRequest,1000,id)
            }
        }
        else if(request.readyState==4){
            setTimeout(doCheckRequest,1000,id)
        }
    };
    request.setRequestHeader("Content-type", "text/xml");

    request.send(soapMessage);
}
document.getElementById("countAmount").getElementsByTagName("a")[0].addEventListener("click", doDecreaseAmountStock);