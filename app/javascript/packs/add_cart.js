const $ = require('jquery')

function handleDataProduct() {
  const product = $(this).data();
  const numberCart = $('.number-cart')

  const shopCart = JSON.parse(localStorage.getItem('shop_cart'))

  numberCart.removeClass('hidden')

  if (Array.isArray(shopCart)) {
    shopCart.push(product)

    localStorage.setItem('shop_cart', JSON.stringify(shopCart))
    numberCart.text(shopCart.length)
  } else {
    localStorage.setItem('shop_cart', JSON.stringify([product]))
    numberCart.text('1')
  }
}

function addToCart() {
  var btnAddToCart = $('.js-add-to-cart')

  btnAddToCart.on('click', handleDataProduct)
}

function showNumberAddCart() {
  const numberCart = $('.number-cart')
  const shopCart = JSON.parse(localStorage.getItem('shop_cart'))

  if(shopCart == null) return;

  numberCart.removeClass('hidden')
  numberCart.text(shopCart.length)
}

$(function () {
  showNumberAddCart();
  addToCart();
})