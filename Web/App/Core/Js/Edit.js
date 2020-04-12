function ECICopy(UI) {
    if ($.eci.hasSave()) {
        return true;
    }
    else {
        return false;
    }
}

function ECIAdd(UI) {
    if ($.eci.hasSave()) {
        return true;
    }
    else {
        return false;
    }
}

function SaveCheck(UI) {
    if (eciform.validate()) {
        return SaveCheckPass();
    }
    else {
        SaveCheckNotPass();
        return false;
    }

    return true;
}

function SaveCheckNotPass() {
}

function SaveCheckPass() {
    msg.loading();
    return true;
}

function UEditGridClick(key, tr, gridId) {
    $("#dataTemp").val(key);
    __doPostBack('btnServerExecute', '')
}

function editClose(button) {
    eci.close();
}
