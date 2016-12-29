String.prototype.trim = function () {
    return this.replace(/(^\s*)|(\s*$)/g, '');
}

String.prototype.ltrim = function () {
    return this.replace(/(^\s*)/g, '');
}

String.prototype.rtrim = function () {
    return this.replace(/(\s*$)/g, '');
}


function checkUser() {
    if (document.myform.username.value == "") {
        swal("用户名不能为空！！");
        return false;
    }

    if (document.myform.username.value.length > 12) {
        swal("用户名不能不能长于12！！");
        return false;
    }

    if (document.myform.newpass.value == "") {
        swal("密码不能为空！！");
        return false;
    }

    if (document.myform.newpass.value.length < 6) {
        swal("密码长度不能小于6位！！");
        return false;
    }

    if (document.myform.repass.value != document.myform.newpass.value) {
        swal("两次密码输入不一样！！");
        return false;
    }

    if (document.myform.newpass.value.length > 11) {
        swal("密码长度不能长于12！！");
        return false;
    }
}

function checkReSetPwd() {
    if (document.myform.oldpass.value == "") {
        swal("原密码不能为空！！");
        return false;
    }
    if (document.myform.newpass.value.length < 6) {
        swal("密码长度不能小于6位！！");
        return false;
    }
    if (document.myform.newpass.value == "") {
        swal("新密码不能为空！！");
        return false;
    }
    if (document.myform.repass.value != document.myform.newpass.value) {
        swal("两次密码输入不一样！！");
        return false;
    }
}

function checkHospital() {
    if (document.myform.hospitalname.value.trim() == "") {
        swal("医院名称名不能为空！！");
        return false;
    }

    if (document.myform.hospitalname.value.length > 16) {
        swal("医院名称长度不能长于16个汉字或者字符！！");
        return false;
    }
    if (document.myform.comment.value.trim() == "") {
        swal("备注不能为空！！");
        return false;
    }
    if (document.myform.comment.value.length > 32) {
        swal("备注长度不能长于32个汉字！！");
        return false;
    }
}

function checkHospitalName() {
    if (document.myform.hospitalname.value.trim() == "") {
        swal("医院名称名不能为空！！");
        return false;
    }
    if (document.myform.comment.value.trim() == "") {
        swal("备注不能为空！！");
        return false;
    }
}

function CheckAll(form) {
    for (var i = 0; i < form.elements.length; i++) {
        var e = form.elements[i];
        if (e.name != 'chkall')
            if (e.disabled == 0) {
                e.checked = form.chkall.checked;
            }

    }
}

function HiddenMenu() {
    document.getElementById("tbl_menu").style.display = "none";
}

function ShowMenu() {
    document.getElementById("tbl_menu").style.display = "";
}