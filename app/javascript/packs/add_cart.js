const $ = require('jquery')

function handleDataProduct() {
  const product = $(this).data();
  const shopCart = JSON.parse(localStorage.getItem('shop_cart'))

  if (Array.isArray(shopCart)) {
    shopCart.push(product)

    localStorage.setItem('shop_cart', JSON.stringify(shopCart))
  } else {
    localStorage.setItem('shop_cart', JSON.stringify([product]))
  }
}

function addToCart() {
  var btnAddToCart = $('.js-add-to-cart')

  btnAddToCart.on('click', handleDataProduct)
}

$(function () {
  addToCart();
})