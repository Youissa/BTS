function Facture() {
    var a =document.getElementById("t21").value;
    var b =document.getElementById("t31").value;
    var c = Number(a)+Number(b);
    t41.value=(c)

    var d =document.getElementById("t112").value;
    var e =document.getElementById("t113").value;
    var f = Number(d)+Number(e);
    t114.value=(f)

    var h =document.getElementById("t15").value;
    var j =document.getElementById("t16").value;
    var k = Number(h)+Number(j);
    t17.value=(k)

    var somme = Number(k)+Number(c)+Number(f);
    t7.value=(somme)

}