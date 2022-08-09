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

  if (shopCart == null) return;

  numberCart.removeClass('hidden')
  numberCart.text(shopCart.length)
}

function showListOrder() {
  const shopCart = JSON.parse(localStorage.getItem('shop_cart'))
  const listOrderProduct = $('.js-list-order')
  shopCart.forEach((element) => {
    var html = `
        <tr>
          <td class="cart__product__item">
            <img "data-pagespeed-url-hash"="4207875790" "onload"="pagespeed.CriticalImages.checkImageForCriticality(this);" src=${element['image']} width="90px">
            <img/>
            <div class="cart__product__item__title">
              <h6>${element['name']}</h6>
            </div>
          </td>
          <td class="cart__price">${element['price']} VNĐ</td>
          <td class="cart__quantity">
            <div class="pro-qty">
              <input value="1"/></div>
          </td>
          <td class="cart__total">${element['price']} VNĐ</td>
        </tr>
    `

    listOrderProduct.prepend(html)
  });
}

$(function () {
  showNumberAddCart();
  addToCart();
  showListOrder();
})