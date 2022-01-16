function hienThi(x, a) {
    document.getElementById(x).style.display = a;

}

function clearCart() {
    var do_cart = setTimeout(function() {
        document.getElementsByClassName('top-cart')[0].style.display = 'block';
    }, 1000);
    window.scroll(0, 100);
}

function addCart(id){
    $.ajax({
        url: "/addCart-" +id,
        type: "POST",
        success: function (response) {
            location.reload();
        },
        error: function (xhr) {
            alert('Error add cart')
        }
    });
}
function removeCart(id){

    $.ajax({
        url: "/removeCart-" +id,
        type: "DELETE",
        success: function (response) {
            location.reload();
        },
        error: function (xhr) {
            alert('Error add cart')
        }
    });
}