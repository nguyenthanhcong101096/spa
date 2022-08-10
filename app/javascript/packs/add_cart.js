const $ = require('jquery')

function handleDataProduct() {
  const product = $(this).data();
  const numberCart = $('.number-cart')

  const shopCart = JSON.parse(localStorage.getItem('shop_cart'))

  numberCart.removeClass('hidden')

  if (Array.isArray(shopCart)) {
    shopCart.push(product)

    localStorage.setItem('shop_cart', JSON.stringify(shopCart))
    numberCart.text(Object.keys(groupBy(shopCart, 'id')).length)
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

  numberCart.text(Object.keys(groupBy(shopCart, 'id')).length)
}

function groupBy(array, key) {
  return array.reduce((result, currentValue) => {
    // If an array already present for key, push it to the array. Else create an array and push the object
    (result[currentValue[key]] = result[currentValue[key]] || []).push(
      currentValue
    );
    // Return the current iteration `result` value, this will be taken as next iteration `result` value and accumulate
    return result;
  }, {});
}

function showListOrder() {
  const shopCart = JSON.parse(localStorage.getItem('shop_cart'))
  const listOrderProduct = $('.js-list-order')

  const ordersGroup = groupBy(shopCart, 'id');

  var totalPrice = 0

  for (var key in ordersGroup) {
    if (ordersGroup.hasOwnProperty(key)) {
      var product = ordersGroup[key][0]
      var quantity = ordersGroup[key].length
      var price = (product['price'] * 1.0).toFixed(2).replace(/\d(?=(\d{3})+\.)/g, '$&,');
      var total = (product['price'] * quantity).toFixed(2).replace(/\d(?=(\d{3})+\.)/g, '$&,');

      totalPrice = totalPrice + (product['price'] * quantity)

      var html = `
          <tr>
            <td class="cart__product__item">
              <img "data-pagespeed-url-hash"="4207875790" "onload"="pagespeed.CriticalImages.checkImageForCriticality(this);" src=${product['image']} width="90px">
              <img/>
              <div class="cart__product__item__title">
                <h6>${product['name']}</h6>
              </div>
            </td>
            <td class="cart__price">${price} VNĐ</td>
            <td class="cart__quantity">
              <div class="pro-qty">
                <input value=${quantity} /></div>
            </td>
            <td class="cart__total">${total} VNĐ</td>
          </tr>
      `

      listOrderProduct.prepend(html)
    }
  }

  $('.js-total-price').text(`${totalPrice.toFixed(2).replace(/\d(?=(\d{3})+\.)/g, '$&,')} VNĐ`)
}

function btnAddToCart() {
  const quantity = $('.js-quantity')

  $('.js-btn-cart').on('click', function () {
    var array = Array(parseInt(quantity.val())).fill(null)
    array.forEach(function () {
      const product = $('.js-btn-cart').data();
      const numberCart = $('.number-cart')

      const shopCart = JSON.parse(localStorage.getItem('shop_cart'))

      numberCart.removeClass('hidden')

      if (Array.isArray(shopCart)) {
        shopCart.push(product)

        localStorage.setItem('shop_cart', JSON.stringify(shopCart))
        numberCart.text(Object.keys(groupBy(shopCart, 'id')).length)
      } else {
        localStorage.setItem('shop_cart', JSON.stringify([product]))
        numberCart.text('1')
      }
    })
  })
}

$(function () {
  showNumberAddCart();
  addToCart();
  btnAddToCart();
  showListOrder();
})