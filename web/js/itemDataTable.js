function canLastPage() {
    let Page = document.getElementById("Page").value;
    return Page !== "1";
}

function canNextPage() {
    let Page = document.getElementById("Page").value;
    let totalPage = document.getElementById("totalPage").innerHTML;
    return Page !== totalPage;
}

function deleteConfirm(target) {
    if (confirm("是否删除？") === true) {
        location.href = target;
    }
}

let allSelect = false;



function allSelected() {
    let i;
    let itemDataCheckBox = document.getElementsByClassName("itemDataCheckBox");
    let n = itemDataCheckBox.length;
    if (allSelect) {
        for (i=0; i<n; i++) {
            if (document.getElementById("reverseSelectedBox").checked) {
                itemDataCheckBox[i].checked = true
            }
            else {
                itemDataCheckBox[i].checked = false
            }
        }
        allSelect = false;
    }
    else {
        for (i=0; i<n; i++) {
            if (document.getElementById("reverseSelectedBox").checked) {
                itemDataCheckBox[i].checked = false
            }
            else {
                itemDataCheckBox[i].checked = true
            }
        }
        allSelect = true;
    }
    if (document.getElementById("reverseSelectedBox").checked === true) {
        document.getElementById("reverseSelectedBox").checked = false
    }
}

function reverseSelected() {
    let itemDataCheckBox = document.getElementsByClassName("itemDataCheckBox");
    let n = itemDataCheckBox.length;
    for (let i=0; i<n; i++) {
        itemDataCheckBox[i].checked = itemDataCheckBox[i].checked !== true;
    }
    if (document.getElementById("itemDataAllCheckBox").checked === true) {
        document.getElementById("itemDataAllCheckBox").checked = false
    }
}

function itemTableClicked(obj) {
    document.getElementById("reverseSelectedBox").checked = false
    if (obj.checked === false) {
        allSelect = false
        document.getElementById("itemDataAllCheckBox").checked = false

    }
}

function checkedChange() {
    let allElem = document.getElementsByClassName("itemDataCheckBox")
    let n = allElem.length
    let a = 0
    for (let i=0; i<n; i++) {
        if (allElem[i].checked === true) {
            a++
        }
        else a--
    }
    if (a === n) {
        document.getElementById("itemDataAllCheckBox").checked = true
        allSelect = true
    }
    else if (a === 1) {
        document.getElementById("itemDataAllCheckBox").checked = false
        allSelect = false
    }
    else allSelect = false

}