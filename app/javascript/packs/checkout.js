const $ = require('jquery')

function checkOut(){
  const checkout = $('.js-checkout')
  const shopCart = JSON.parse(localStorage.getItem('shop_cart'))

    // Accepts the array and key
  const groupBy = (array, key) => {
    // Return the end result
    return array.reduce((result, currentValue) => {
      // If an array already present for key, push it to the array. Else create an array and push the object
      (result[currentValue[key]] = result[currentValue[key]] || []).push(
        currentValue
      );
      // Return the current iteration `result` value, this will be taken as next iteration `result` value and accumulate
      return result;
    }, {}); // empty object is the initial value for result object
  };

  // Group by color as key to the person array
  const listProduct = groupBy(shopCart, 'id');
  var totalPrice = 0

  for (var key in listProduct) {
    if (listProduct.hasOwnProperty(key)) {
      var product = listProduct[key][0]
      var quantity = listProduct[key].length
      var price = (product['price'] * 1.0).toFixed(2).replace(/\d(?=(\d{3})+\.)/g, '$&,');
      var total = (product['price'] * quantity).toFixed(2).replace(/\d(?=(\d{3})+\.)/g, '$&,');

      totalPrice = (totalPrice + (product['price'] * quantity))

      var html = `
        <li>
          ${product['name']}
          <span>${total} VNĐ</span>
        </li>
      `

      checkout.last().append(html)
    }
  }

  $('.js-total-price').text(`${totalPrice.toFixed(2).replace(/\d(?=(\d{3})+\.)/g, '$&,')} VNĐ`)
}

$(function () {
  checkOut();
})