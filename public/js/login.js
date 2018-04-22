function myFunction() {
    var pd = document.getElementById("pd").value;
    var cpd = document.getElementById("cpd").value;
    var ok = true;
    if (pd != cpd) {
        //alert("Passwords Do not match");
        document.getElementById("pd").style.borderColor = "#E34234";
        document.getElementById("cpd").style.borderColor = "#E34234";
        ok = false;
    }
    else {
        document.getElementById("pd").style.borderColor = "#FFFFFF";
        document.getElementById("cpd").style.borderColor = "#FFFFFF";
    }
    return ok;
}