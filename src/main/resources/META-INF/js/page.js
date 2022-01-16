const rows = document.getElementById("row-page");
//const rows = 8;
const products = document.getElementById("product_items").children; // xem có bao nhiêu product con
rows.addEventListener("change", changeRowPerPage);
const allPage = document.getElementsByClassName('page-number');

function checkPageActive(pageNumber) {
    if (pageNumber.getAttribute('data-is-active'))
        return true;
    else
        return false;
}

function loadPageNumber() {
    var pages = Math.floor(document.getElementById("product_items").children.length / document.getElementById("row-page").value);
    var parent = document.getElementById("page");
    parent.innerHTML = '';
    var strong = document.createElement('strong');
    strong.setAttribute('id', 'page-number');
    strong.innerHTML = '1 - ' +
        rows.value +
        ' of ' + products.length;

    var previous = document.createElement('a');
    previous.setAttribute('class', 'btn');
    previous.href = 'javascript:void(0);';
    previous.style = 'color: #6C757D;';
    previous.innerHTML = 'Previous';

    var firstPage = document.createElement('a');
    firstPage.setAttribute('class', 'btn page-number');
    firstPage.setAttribute('href', 'javascript:void(0);');
    firstPage.setAttribute('data-page-number', 1);
    firstPage.setAttribute('data-is-active', true);
    firstPage.setAttribute('style', 'background-color: #527afd; color: cornsilk;');
    firstPage.setAttribute('onclick', 'selectPage(this)');

    firstPage.innerHTML = '1';


    var next = document.createElement('a');
    next.setAttribute('class', 'btn');
    next.setAttribute('href', 'javascript:void(0);');
    next.innerHTML = 'Next';

    parent.appendChild(strong);
    parent.appendChild(previous);
    parent.appendChild(firstPage);
    parent.appendChild(next);

    var parentNode = parent.childNodes;
    var needToInsert = parent.firstChild.nextElementSibling.nextElementSibling.nextElementSibling;
    for (let i = 0; i < pages; i++) {
        var a = document.createElement('a');
        a.setAttribute('class', 'btn page-number');
        a.setAttribute('data-page-number', i + 2);
        a.setAttribute('data-is-active', false);
        a.setAttribute('href', 'javascript:void(0);');
        a.setAttribute('onclick', 'selectPage(this)');
        a.innerHTML = i + 2;
        parent.insertBefore(a, needToInsert);
    }
}

function changeRowPerPage() {
    var page = '';

    for (let i = 1; i < allPage.length; i++) {
        allPage[i].setAttribute('style', '');
        allPage[i].setAttribute('data-is-active', false);
    }
    allPage[0].setAttribute('style', 'background-color: #527afd; color: cornsilk;');
    allPage[0].setAttribute('data-is-active', true);

    if (rows.value > products.length) {
        for (let i = 0; i < products.length; i++) {
            page += products[i].outerHTML;
        }
    } else {
        for (let i = 0; i < parseInt(rows.value); i++) {
            page += products[i].outerHTML;
        }
    }

    document.getElementById("product_items2").innerHTML = page;
    document.getElementById("product_items2").style.display = "";
    document.getElementById("product_items").style.display = "none";

    loadPageNumber();

}

function selectPage(element) {
    var page = '';
    for (let i = 0; i < allPage.length; i++) {
        allPage[i].setAttribute('style', '');
        allPage[i].setAttribute('data-is-active', false);
    }
    element.setAttribute('style', 'background-color: #527afd; color: cornsilk;');
    element.setAttribute('data-is-active', true);
    var pageNumber = parseInt(element.getAttribute('data-page-number'));
    var start = (pageNumber - 1) * parseInt(rows.value);
    var end = start + parseInt(rows.value);
    console.log(start);
    console.log(end);
    if (end > products.length)
        end = products.length;
    for (let i = start; i < end; i++) {
        page += products[i].outerHTML;
    }
    document.getElementById("product_items2").innerHTML = page;
    document.getElementById("product_items2").style.display = "";
    document.getElementById("product_items").style.display = "none";

    document.getElementById("page-number").innerHTML = (start + 1) + ' - ' +
        (end) +
        ' of ' + products.length;
}

